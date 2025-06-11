import maya.cmds as mc
import maya.api.OpenMaya as om2


# reverseJointChainDriver================================================

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
#========================================================================

# ribbon, primaryCurveIso, secondaryCurveIso, revPrimaryCurveDAG = setupJointToRibbon(jointChain, width=0.5, primaryInMiddle=True)

# ikDriverJoints: the splineIK driver, NOT the skinned joints (duplicate separately) - for holding ik result
# width: the width of the ribbon (default: 0.5; an option just in case the need for a wider width comes up) 
# primaryInMiddle: should the ribbon be alighed on the edge (False) or along the middle (True)
# rigOpName: the name of the group 
#
# return: two-element list of following:
# 0 - [ribbonShape, primaryISO, secondaryISO, primaryCurve]
def setupJointToDualSplineIK(ikDriverJoints, width=0.5, primaryInMiddle=True, rigOpName="g_dualSplineIK") -> list:
	startOffset = 0.0
	endOffset = width
	primaryIsoParam = 0.0
	secondaryIsoParam = 1.0
	if primaryInMiddle:
		halfWidth = width * 0.5
		startOffset = -halfWidth
		endOffset = halfWidth
		primaryIsoParam = 0.5
	
	startOffsetMatrix = om2.MMatrix([1,0,0,0,0,1,0,0,0,0,1,0,0,0,startOffset,1])
	endOffsetMatrix = om2.MMatrix([1,0,0,0,0,1,0,0,0,0,1,0,0,0,endOffset,1])

	rigOpGroup = rigOpName
	if rigOpName == None:
		rigOpGroup = f"g_dualSplineIK_{ikDriverJoints[0]}"
	if not mc.objExists(rigOpGroup):
		rigLogicRoot = "g_rigLogic"
		if not mc.objExists(rigLogicRoot):
			rigLogicRoot = mc.createNode("transform", n=rigLogicRoot, skipSelect=True)
		rigOpGroup = mc.createNode("transform", n=rigOpGroup, p=rigOpGroup, skipSelect=True)

	# logic joints setup; placing it at the top to make future input sanatisation easier
	# doing pretty roundabout duplicate to skip over edge cases in hierachy (multiple children branches in hierachy etc)
	jointForwardMSL:om2.MSelectionList = om2.MSelectionList()
	for joint in ikDriverJoints:
		jointForwardMSL.add( mc.duplicate(joint, n=f"j_fwdSplineResult_{joint}" ,po=True) )
	for i in range(jointForwardMSL.length() -1 ):
		mc.parent(jointForwardMSL.getSelectionStrings(i+1)[0], jointForwardMSL.getSelectionStrings(i)[0])
	mc.parent(jointForwardMSL.getSelectionStrings(0)[0], rigOpGroup)
	
	jointForwardIK = jointForwardMSL.getSelectionStrings()
	jointForwardMSL.clear()
	del jointForwardMSL

	jointReverseIK = mc.duplicate(jointForwardIK[0], rc=True) # rc=True ensures the children gets unique DAG paths
	for i in range(len(jointReverseIK)):
		jointReverseIK[i] = mc.rename(jointReverseIK[i], f"j_revSplineChain_{joint}")

	jointReverseIKResult = reverseJointChainDriver(jointReverseIK, "j_revSplineResult")
	jointReverseIKResult[0] = mc.parent(jointReverseIK[0], rigOpGroup)[0]

	# summary of joint chains:
	# ikDriverJoints - IK driver, 

	# get joint world matrices (EPs)
	jointListMatrix = []
	for joint in ikDriverJoints:
		jointListMatrix.append(mc.getAttr(f"{joint}.worldMatrix"))

	# make EPs using offets
	primaryListEP = []
	secondaryListEP = []
	ikCurveListEP = []
	for mat in jointListMatrix:
		jointMatrix = om2.MMatrix(mat)
		# new EP = offsetMatrix * worldMatrix
		primaryMakeMatrix : om2.MMatrix = startOffsetMatrix * jointMatrix
		secondaryMakeMatrix:om2.MMatrix = endOffsetMatrix * jointMatrix
		# record EPs
		primaryListEP.append(list(primaryMakeMatrix)[-4:-1])
		secondaryListEP.append(list(secondaryMakeMatrix)[-4:-1])
		ikCurveListEP.append(list(jointMatrix)[-4:-1])
		del primaryMakeMatrix , secondaryMakeMatrix # cleanup, just in case
	del startOffsetMatrix , endOffsetMatrix

	# create spline IK curves
	ikFwdCurve = mc.curve(ep=ikCurveListEP) # forward IK spline driver curve, placeholder because using ribbon isoparm for this
	ikCurveReverseEP = ikCurveListEP.copy()
	ikCurveReverseEP.reverse()
	# ikRevCurve = mc.curve(n=f"spline_primaryCurveRev_{ikDriverJoints[0]}", ep=ikCurveReverseEP) # reverse IK spline driver curve
	
	# create curves and loft 
	primaryCurve   = mc.curve(ep=primaryListEP) # ribbon side 0
	secondaryCurve = mc.curve(ep=secondaryListEP) # ribbon side 1
	ribbonTransform = mc.loft(primaryCurve, secondaryCurve, n=f"nurbs_dualSplineIK_{ikDriverJoints[0]}", d=1, o=True, ch=False)[0]
	ribbonShape = mc.listRelatives(ribbonTransform, s=True)[0]

	# create and connect curveFromSurfaceIso node: ribbon -> primary
	primaryISO = mc.createNode("curveFromSurfaceIso", n=f"siso_primaryCurve_{ikDriverJoints[0]}", skipSelect = True) # pass result to forward IK
	mc.setAttr(f'{primaryISO}.isoparmValue', primaryIsoParam , type='double')
	mc.connectAttr(f"{ribbonShape}.worldSpace", f"{primaryISO}.inputSurface",	 f=True)
	checkLength = mc.arclen(primaryCurve) - mc.arclen(f"{primaryISO}.outputCurve") # expects close to zero
	if not -0.0001 < checkLength < 0.0001: # if the result isoparm is shorter than the actual length, implying wrong isoparm direction
		mc.setAttr(f"{primaryISO}.isoparmDirection", 1) # enum

	# create and connect curveFromSurfaceIso node: ribbon -> secondary
	secondaryISO = mc.createNode("curveFromSurfaceIso", n=f"siso_tangentCurve_{ikDriverJoints[0]}", skipSelect = True) # pass result to forward aimMatrix
	mc.setAttr(f'{secondaryISO}.isoparmValue', secondaryIsoParam , type='double')
	mc.connectAttr(f"{ribbonShape}.worldSpace", f"{secondaryISO}.inputSurface",	 f=True)
	checkLength = mc.arclen(secondaryCurve) - mc.arclen(f"{secondaryISO}.outputCurve") # expects close to zero
	if not -0.0001 < checkLength < 0.0001: # if the result isoparm is shorter than the actual length, implying wrong isoparm direction
		mc.setAttr(f"{secondaryISO}.isoparmDirection", 1) # enum

	# create and connect forward solver
	ikHandleForward, ikEffectorForward, tempCurveFwd = mc.ikHandle(sj=jointForwardIK[0], ee=jointForwardIK[-1], n=f"ikh_dualSplineFwd_{ikDriverJoints[0]}", solver="ikSplineSolver", ccv=True) 
	mc.connectAttr(f"{primaryISO}.outputCurve", f"{ikHandleForward}.inCurve", f=True)
	ikEffectorForward = mc.rename(ikEffectorForward, f"ike_dualSplineFwd_{ikDriverJoints[0]}")
	mc.delete(tempCurveFwd) # cleanup
	del tempCurveFwd # cleanup
	
	# create and connect reverse curves
	primaryReverse = mc.createNode("reverseCurve", n=f"cRev_primaryCurve_{ikDriverJoints[0]}", skipSelect = True) 
	mc.connectAttr(f"{primaryISO}.outputCurve", f"{primaryReverse}.inputCurve",	 f=True)
	# mc.connectAttr(f"{primaryReverse}.outputCurve", f"{ikRevCurve}.create",	 f=True) # pass ikRevCurve to reverseIK

	secondaryReverse = mc.createNode("reverseCurve", n=f"cRev_tangentCurve_{ikDriverJoints[0]}", skipSelect = True) # pass result to reverse aimMatrix
	mc.connectAttr(f"{secondaryISO}.outputCurve", f"{secondaryReverse}.inputCurve",	 f=True)

	mc.delete(primaryCurve, secondaryCurve) # cleanup
	del primaryCurve, secondaryCurve # cleanup
	# in summary:
	# primaryCurve - temporary - first edge for ribbon
	# secondaryCurve - temporary - second edge for ribbon
	# primaryISO - curve driver for spline IK (forward) 
	# secondaryISO - curve target for spline IK (forward-tangent)
	# primaryReverse - curve driver for spline IK (reverse)
	# secondaryReverse - curve target for spline IK (reverse-tangent)

	# create and connect reverse solver
	# repurpose the automatically-created curve as reverseCurve doesn't live-update for some reason
	ikHandleReverse, ikEffectorReverse, primaryCurveReverse = mc.ikHandle(sj=jointReverseIKResult[0], ee=jointReverseIKResult[-1], n=f"ikh_dualSplineRev_{ikDriverJoints[0]}", solver="ikSplineSolver", ccv=True) 
	mc.connectAttr(f"{primaryReverse}.outputCurve", f"{primaryCurveReverse}.create", f=True)
	ikEffectorReverse = mc.rename(ikEffectorReverse, f"ike_dualSplineRev_{ikDriverJoints[0]}")
	primaryCurveReverse = mc.rename(ikEffectorReverse, f"spline_primaryCurveRev_{ikDriverJoints[0]}") 
	
	# stage one result: hand the following off to second stage
	#                                 ikDriverJoints,           jointForwardIK,              jointReverseIK,              secondaryISO,        secondaryReverse,
	# def setupDualSplineRootSwitchIK(resultJointList:list, forwardSolverJointList:list, reverseSolverJointList:list, fwdTangentCurve:str, revTangentCurve:str, aimInputAxis=[0.0,0.0,-1.0]) -> str:
	
	# ribbon, primaryCurveIso, secondaryCurveIso, revPrimaryCurveDAG = setupJointToRibbon(ikDriverJoints, width=0.5, primaryInMiddle=True)

	# close out
	mc.parent(primaryCurveReverse, ikHandleForward, ikEffectorForward, ikHandleReverse, ikEffectorReverse, ribbonTransform, rigOpGroup)
	#return [ribbonShape, primaryISO, secondaryISO, primaryCurve]
	return [[ikDriverJoints, jointForwardIK, jointReverseIK, secondaryISO, secondaryReverse], [ribbonShape, ]]