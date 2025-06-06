# scripterStu: start print
# date created: UTC 0800 2025.06.05 1902HRS

import maya.cmds as mc
import maya.api.OpenMaya as om2

# activeSelection = om2.MGlobal.getActiveSelectionList()

def reverseJointChainDriver(jointChain:list, jointBaseName:str) -> list :
	# check if selection is all joints, and only a straight chain selection
	checkBool = True
	checkParent = ""
	checkMSL = om2.MSelectionList()
	try:
		for node in jointChain:
			assert mc.nodeType(node) == "joint" # is it a joint
			checkMSL.add(node)
			nodeName = checkMSL.getSelectionStrings(0)[0]
			checkMSL.clear()
			if checkBool: # first item
				checkBool = False
			else: # not first: check parent
				assert mc.listRelatives(nodeName, p=True)[0] == checkParent # is the parent the previous selection?
			checkParent = nodeName
	except:
		raise TypeError(f"reverseJointChainDriver - selection contains non-joint objects/nodes or is not of a simple chain; check selection:\n{jointChain}\n--------")
	finally:
		del checkMSL
	getParentName = mc.listRelatives(jointChain[0], p=True)
	
	# ============= execution phase
	reverseChain = []
	nodeCounter=0
	for j in jointChain:
		# duplicate on spot only
		reverseChain += mc.duplicate(j, n=f"{jointBaseName}{nodeCounter}", po=True)
		nodeCounter +=1
	mc.parent(*reverseChain, w=True)
	for i in range(len(reverseChain) -1):
		mc.parent(reverseChain[i], reverseChain[i+1])
	if getParentName: # if not none
		mc.parent(jointChain[0], getParentName[0])

	jointList = [None] * 4
	nodeList = [None] * 15

	for i in range(len(jointChain) -1):
		# list of joints
		jointList[1] = jointChain[i] 		# "jRevSplineChain0" the forward one 
		jointList[0] = reverseChain[i] 		# "jRevSplineSolver0" the reverse one
		
		nodeList[5] = jointList[0] # joint - jRevSplineSolver0, parent: jRevSplineSolver1
		nodeList[7] = jointList[1] # joint - jRevSplineChain0, parent: g_dualSplineIK_spine
		
		# A-A or B-B
		# create nodes
		nodeList[9] = mc.createNode("composeMatrix",	n=f"cmx_rot_{jointList[1]}", skipSelect = True) # A
		nodeList[8] = mc.createNode("inverseMatrix",	n=f"imx_rot_{jointList[1]}", skipSelect = True) # A
		nodeList[6] = mc.createNode("decomposeMatrix",	n=f"dmx_rotDriver_{jointList[1]}", skipSelect = True) # A
		
		# connect attributes
		mc.connectAttr(f"{nodeList[5]}.rotate", f"{nodeList[9]}.inputRotate",	 f=True) # jRevSplineSolver0.rotate -> cmx_rot_jRevSplineSolver0.inputRotate
		mc.connectAttr(f"{nodeList[6]}.outputRotate", f"{nodeList[7]}.rotate",	 f=True) # dmx_rotDriver_jRevSplineChain0.outputRotate -> jRevSplineChain0.rotate
		mc.connectAttr(f"{nodeList[8]}.outputMatrix", f"{nodeList[6]}.inputMatrix",	 f=True) # imx_rot_jRevSplineSolver0.outputMatrix -> dmx_rotDriver_jRevSplineChain0.inputMatrix
		mc.connectAttr(f"{nodeList[9]}.outputMatrix", f"{nodeList[8]}.inputMatrix",	 f=True) # cmx_rot_jRevSplineSolver0.outputMatrix -> imx_rot_jRevSplineSolver0.inputMatrix

		if not i: # base of joint: index [0]
			# base setup for A-A
			nodeList[0] = mc.createNode("pickMatrix",		n=f"pmx_opmReverseChainNoScale_{jointList[1]}", skipSelect = True)
			mc.setAttr(f'{nodeList[0]}.useScale', False ) # pmx_opmReverseChainNoScale_jRevSplineChain0.useScale
			nodeList[1] = mc.createNode("inverseMatrix",	n=f"imx_jointOrient_{jointList[1]}", skipSelect = True)
			nodeList[2] = mc.createNode("composeMatrix",	n=f"cmx_transOrient_{jointList[0]}", skipSelect = True)
			nodeList[3] = mc.createNode("composeMatrix",	n=f"cmx_jointOrient_{jointList[1]}", skipSelect = True)
			nodeList[4] = mc.createNode("multMatrix",		n=f"mxm_opmReverseChain_{jointList[1]}", skipSelect = True)
			mc.connectAttr(f"{nodeList[0]}.outputMatrix", f"{nodeList[7]}.offsetParentMatrix",	 f=True) # pmx_opmReverseChainNoScale_jRevSplineChain0.outputMatrix -> jRevSplineChain0.offsetParentMatrix
			mc.connectAttr(f"{nodeList[1]}.outputMatrix", f"{nodeList[4]}.matrixIn[0]",	 f=True) # imx_jointOrient_jRevSplineChain0.outputMatrix -> mxm_opmReverseChain_jRevSplineChain0.matrixIn[0]
			mc.connectAttr(f"{nodeList[2]}.outputMatrix", f"{nodeList[4]}.matrixIn[1]",	 f=True) # cmx_transOrient_jRevSplineSolver0.outputMatrix -> mxm_opmReverseChain_jRevSplineChain0.matrixIn[1]
			mc.connectAttr(f"{nodeList[3]}.outputMatrix", f"{nodeList[1]}.inputMatrix",	 f=True) # cmx_jointOrient_jRevSplineChain0.outputMatrix -> imx_jointOrient_jRevSplineChain0.inputMatrix
			mc.connectAttr(f"{nodeList[4]}.matrixSum", f"{nodeList[0]}.inputMatrix",	 f=True) # mxm_opmReverseChain_jRevSplineChain0.matrixSum -> pmx_opmReverseChainNoScale_jRevSplineChain0.inputMatrix
			mc.connectAttr(f"{nodeList[5]}.translate", f"{nodeList[2]}.inputTranslate",	 f=True) # jRevSplineSolver0.translate -> cmx_transOrient_jRevSplineSolver0.inputTranslate
			mc.connectAttr(f"{nodeList[5]}.parentMatrix", f"{nodeList[4]}.matrixIn[2]",	 f=True) # jRevSplineSolver0.parentMatrix -> mxm_opmReverseChain_jRevSplineChain0.matrixIn[2]
			mc.connectAttr(f"{nodeList[5]}.jointOrient", f"{nodeList[2]}.inputRotate",	 f=True) # jRevSplineSolver0.jointOrient -> cmx_transOrient_jRevSplineSolver0.inputRotate
			mc.connectAttr(f"{nodeList[7]}.jointOrient", f"{nodeList[3]}.inputRotate",	 f=True) # jRevSplineChain0.jointOrient -> cmx_jointOrient_jRevSplineChain0.inputRotate
			pass
		else:
			# B-A
			mc.connectAttr(f"{jointChain[i]}.scale", f"{jointChain[i-1]}.scale",	 f=True) # connect scale, B-A
		pass


	# connect the final scale attr
	mc.connectAttr(f"{reverseChain[-1]}.scale", f"{jointChain[-2]}.scale",	 f=True)

	# end of script
	return reverseChain


