# scripterStu: start print
# date created: UTC 0800 2025.05.23 1716HRS 

import maya.cmds as mc
import maya.api.OpenMaya as om2

# activeSelection = om2.MGlobal.getActiveSelectionList()

def setupDualSplineIK(drivenJointList, splineJointList, ribbon, endJoint):
	# expected nodes:
	# drivenJointList: spine0,         spine1,         spine2, ...,         spineN
	# splineJointList: jSplineSolver0, jSplineSolver1, jSplineSolver2, ..., jSplineSolverN 
	# ribbon, nurbsSurface shape node

	# nodes assumed to be complete:
	# ribbon at isoparm[u=0] made splineIK to driverJointList
	# skin bind of ribbon to control joints, made separately

	# joint orients to be edited separately, or in another function or workflow separately
	# 	these will be returned from this function
	# aim_splineResult_{drivenJoint[0]}.secondaryInputAxis
	# mxm_splineResult_{drivenJoint[0]}.forwardOrient

	jointList = [None] * 5
	nodeList_A = [None] * 23

	previousNodes = []
	returnList = []
	for i in range(len(drivenJointList)-1): # stop before the last joint
		# list of joints
		jointList[0] = drivenJointList[i] # incoming: ['dmx_jointDriver_spine0'] - outgoing: ['spine1', 'cmx_jointOrient_spine0', 'pmx_parentInverseRotate_spine0']
		jointList[1] = splineJointList[i] #  - outgoing: ['jSplineSolver1', 'ikh_dualSplineIK_spine0', 'mxm_splineForward_jSplineDriver0', 'dmx_worldMatrix_jSplineDriver0', 'pmx_worldPoint_jSplineDriver0']
		#jointList[0] = "spine0" # incoming: ['dmx_jointDriver_spine0'] - outgoing: ['spine1', 'cmx_jointOrient_spine0', 'pmx_parentInverseRotate_spine0']
		#jointList[1] = "jSplineSolver0" #  - outgoing: ['jSplineSolver1', 'ikh_dualSplineIK_spine0', 'mxm_splineForward_jSplineDriver0', 'dmx_worldMatrix_jSplineDriver0', 'pmx_worldPoint_jSplineDriver0']

		jointList[2] = splineJointList[i+1] # incoming: ['jSplineSolver0'] - outgoing: ['jSplineSolver2', 'mxm_splineForward_jSplineDriver1', 'dmx_worldMatrix_jSplineDriver1', 'pmx_worldPoint_jSplineDriver1', 'cmx_downstreamTranslate_jSplineSolver0']
		#jointList[2] = "jSplineSolver1" # incoming: ['jSplineSolver0'] - outgoing: ['jSplineSolver2', 'mxm_splineForward_jSplineDriver1', 'dmx_worldMatrix_jSplineDriver1', 'pmx_worldPoint_jSplineDriver1', 'cmx_downstreamTranslate_jSplineSolver0']
		#jointList[3] = "spine1"
		
		# create nodes

		nodeList_A[14] = jointList[0] # joint - spine0, parent: 
		nodeList_A[16] = jointList[1] # joint - jSplineSolver0, parent: g_dualSplineIK_spine
		nodeList_A[20] = jointList[2] # joint - jSplineSolver1, parent: jSplineSolver0

		nodeList_A[0] = mc.createNode("curveFromSurfaceIso",	n=f"siso_tangentCurve_{jointList[0]}", skipSelect = True)
		mc.setAttr(f'{nodeList_A[0]}.isoparmValue', 1.0 , type='double')
		nodeList_A[1] = mc.createNode("curveFromSurfaceIso",	n=f"siso_primaryCurve_{jointList[0]}", skipSelect = True)
		mc.setAttr(f'{nodeList_A[1]}.isoparmValue', 0.0 , type='double')
		nodeList_A[2] = ribbon # nurbs surface control ribbon
		#nodeList_A[2] = mc.createNode("nurbsSurface",	n=f"nurbs_dualSplineIK_spineShape", skipSelect = True)
		
		nodeList_A[3] = mc.createNode("composeMatrix",	n=f"cmx_dualSplineVector_{jointList[1]}", skipSelect = True)
		nodeList_A[4] = mc.createNode("inverseMatrix",	n=f"imx_jointOrientInverse_{jointList[0]}", skipSelect = True)
		nodeList_A[5] = mc.createNode("multMatrix",	n=f"mxm_splineTangent_{jointList[1]}", skipSelect = True)
		nodeList_A[6] = mc.createNode("nearestPointOnCurve",	n=f"npoc_dualSplineVector_{jointList[1]}", skipSelect = True)
		nodeList_A[7] = mc.createNode("inverseMatrix",	n=f"imx_worldPointInverse_{jointList[1]}", skipSelect = True)
		nodeList_A[8] = mc.createNode("decomposeMatrix",	n=f"dmx_worldMatrix_{jointList[1]}", skipSelect = True)
		nodeList_A[9] = mc.createNode("composeMatrix",	n=f"cmx_jointOrient_{jointList[0]}", skipSelect = True)
		nodeList_A[10] = mc.createNode("pickMatrix",	n=f"pmx_splineForward_{jointList[1]}", skipSelect = True)
		nodeList_A[11] = mc.createNode("multMatrix",	n=f"mxm_splineForward_{jointList[1]}", skipSelect = True)
		nodeList_A[13] = mc.createNode("pickMatrix",	n=f"pmx_parentInverseRotate_{jointList[0]}", skipSelect = True)
		nodeList_A[17] = mc.createNode("pickMatrix",	n=f"pmx_worldPoint_{jointList[1]}", skipSelect = True)
		nodeList_A[19] = mc.createNode("composeMatrix",	n=f"cmx_downstreamTranslate_{jointList[1]}", skipSelect = True)

		nodeList_A[15] = mc.createNode("aimMatrix",	n=f"aim_splineResult_{jointList[0]}", skipSelect = True)
		nodeList_A[12] = mc.createNode("multMatrix",	n=f"mxm_splineResult_{jointList[0]}", skipSelect = True)
		nodeList_A[18] = mc.createNode("decomposeMatrix",	n=f"dmx_jointDriver_{jointList[0]}", skipSelect = True)

		# custom attributes
		# Dynamic Attributes for nodeList_A[12] : mxm_splineDriver_spine0 ========================== 
		mc.addAttr(nodeList_A[12], ln='forwardOrient', at='matrix'                     	, hidden = False, readable = True, writable = True, keyable = False)
		mc.setAttr(f'{nodeList_A[12]}.forwardOrient', 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, type='matrix') # dynamic attribute setAttr
		mc.connectAttr(f"{nodeList_A[12]}.forwardOrient", f"{nodeList_A[12]}.matrixIn[0]",	 f=True) # mxm_splineDriver_spine0.forwardOrient -> mxm_splineDriver_spine0.matrixIn[0]
		
		
		# Dynamic Attributes for nodeList_A[22] : mxm_splineDriver_spine1 ========================== 
		mc.addAttr(nodeList_A[22], ln='forwardOrient', at='matrix'                     	, hidden = False, readable = True, writable = True, keyable = False)
		mc.connectAttr(f"{nodeList_A[22]}.forwardOrient", f"{nodeList_A[22]}.matrixIn[0]",	 f=True) # mxm_splineDriver_spine1.forwardOrient -> mxm_splineDriver_spine1.matrixIn[0]


		# write attributes
		mc.setAttr(f'{nodeList_A[15]}.secondaryInputAxisY', 0.0 , type='double') # aim_splineDriver_spine0.secondaryInputAxisY
		mc.setAttr(f'{nodeList_A[15]}.secondaryInputAxisZ', -1.0 , type='double') # aim_splineDriver_spine0.secondaryInputAxisZ

		mc.setAttr(f'{nodeList_A[10]}.useRotate', False ) # pmx_splineForward_jSplineDriver0.useRotate
		mc.setAttr(f'{nodeList_A[13]}.useTranslate', False ) # pmx_parentInverseRotate_spine0.useTranslate
		mc.setAttr(f'{nodeList_A[13]}.useScale', False ) # pmx_parentInverseRotate_spine0.useScale
		mc.setAttr(f'{nodeList_A[13]}.useShear', False ) # pmx_parentInverseRotate_spine0.useShear
		mc.setAttr(f'{nodeList_A[15]}.secondaryMode', 1 , type='enum') # aim_splineDriver_spine0.secondaryMode
		mc.setAttr(f'{nodeList_A[17]}.useRotate', False ) # pmx_worldPoint_jSplineDriver0.useRotate
		mc.setAttr(f'{nodeList_A[17]}.useScale', False ) # pmx_worldPoint_jSplineDriver0.useScale
		mc.setAttr(f'{nodeList_A[17]}.useShear', False ) # pmx_worldPoint_jSplineDriver0.useShear
		mc.setAttr(f'{nodeList_A[21]}.secondaryMode', 1 , type='enum') # aim_splineDriver_spine1.secondaryMode

		# connect attributes
		mc.connectAttr(f"{nodeList_A[0]}.outputCurve", 	f"{nodeList_A[6]}.inputCurve",	 f=True) # siso_tangentCurve_spine0.outputCurve -> npoc_dualSplineVector_jSplineDriver0.inputCurve
		mc.connectAttr(f"{nodeList_A[2]}.worldSpace", 	f"{nodeList_A[0]}.inputSurface",	 f=True) # nurbs_dualSplineIK_spineShape.worldSpace -> siso_tangentCurve_spine0.inputSurface
		mc.connectAttr(f"{nodeList_A[2]}.worldSpace", 	f"{nodeList_A[1]}.inputSurface",	 f=True) # nurbs_dualSplineIK_spineShape.worldSpace -> siso_primaryCurve_spine0.inputSurface
		mc.connectAttr(f"{nodeList_A[3]}.outputMatrix", 	f"{nodeList_A[5]}.matrixIn[1]",	 f=True) # cmx_dualSplineVector_jSplineDriver0.outputMatrix -> mxm_splineTangent_jSplineDriver0.matrixIn[1]
		mc.connectAttr(f"{nodeList_A[4]}.outputMatrix", 	f"{nodeList_A[12]}.matrixIn[3]",	 f=True) # imx_jointOrientInverse_spine0.outputMatrix -> mxm_splineDriver_spine0.matrixIn[3]
		mc.connectAttr(f"{nodeList_A[5]}.matrixSum", 		f"{nodeList_A[15]}.secondaryTargetMatrix",	 f=True) # mxm_splineTangent_jSplineDriver0.matrixSum -> aim_splineDriver_spine0.secondaryTargetMatrix
		mc.connectAttr(f"{nodeList_A[6]}.position", 		f"{nodeList_A[3]}.inputTranslate",	 f=True) # npoc_dualSplineVector_jSplineDriver0.position -> cmx_dualSplineVector_jSplineDriver0.inputTranslate
		mc.connectAttr(f"{nodeList_A[7]}.outputMatrix", 	f"{nodeList_A[5]}.matrixIn[0]",	 f=True) # imx_worldPointInverse_jSplineDriver0.outputMatrix -> mxm_splineTangent_jSplineDriver0.matrixIn[0]
		mc.connectAttr(f"{nodeList_A[8]}.outputTranslate", f"{nodeList_A[6]}.inPosition",	 f=True) # dmx_worldMatrix_jSplineDriver0.outputTranslate -> npoc_dualSplineVector_jSplineDriver0.inPosition
		mc.connectAttr(f"{nodeList_A[9]}.outputMatrix", 	f"{nodeList_A[4]}.inputMatrix",	 f=True) # cmx_jointOrient_spine0.outputMatrix -> imx_jointOrientInverse_spine0.inputMatrix
		mc.connectAttr(f"{nodeList_A[10]}.outputMatrix", 	f"{nodeList_A[15]}.primaryTargetMatrix",	 f=True) # pmx_splineForward_jSplineDriver0.outputMatrix -> aim_splineDriver_spine0.primaryTargetMatrix
		mc.connectAttr(f"{nodeList_A[11]}.matrixSum", 	f"{nodeList_A[10]}.inputMatrix",	 f=True) # mxm_splineForward_jSplineDriver0.matrixSum -> pmx_splineForward_jSplineDriver0.inputMatrix
		mc.connectAttr(f"{nodeList_A[12]}.matrixSum", 	f"{nodeList_A[18]}.inputMatrix",	 f=True) # mxm_splineDriver_spine0.matrixSum -> dmx_jointDriver_spine0.inputMatrix
		mc.connectAttr(f"{nodeList_A[13]}.outputMatrix", 	f"{nodeList_A[12]}.matrixIn[2]",	 f=True) # pmx_parentInverseRotate_spine0.outputMatrix -> mxm_splineDriver_spine0.matrixIn[2]
		mc.connectAttr(f"{nodeList_A[14]}.jointOrient", 	f"{nodeList_A[9]}.inputRotate",	 f=True) # spine0.jointOrient -> cmx_jointOrient_spine0.inputRotate
		mc.connectAttr(f"{nodeList_A[14]}.parentInverseMatrix", f"{nodeList_A[13]}.inputMatrix",	 f=True) # spine0.parentInverseMatrix -> pmx_parentInverseRotate_spine0.inputMatrix
		mc.connectAttr(f"{nodeList_A[15]}.outputMatrix", 	f"{nodeList_A[12]}.matrixIn[1]",	 f=True) # aim_splineDriver_spine0.outputMatrix -> mxm_splineDriver_spine0.matrixIn[1]
		#mc.connectAttr(f"{nodeList_A[16]}.scale", 		f"{nodeList_A[20]}.inverseScale",	 f=True) # jSplineSolver0.scale -> jSplineSolver1.inverseScale
		mc.connectAttr(f"{nodeList_A[16]}.worldMatrix", 	f"{nodeList_A[11]}.matrixIn[1]",	 f=True) # jSplineSolver0.worldMatrix -> mxm_splineForward_jSplineDriver0.matrixIn[1]
		mc.connectAttr(f"{nodeList_A[16]}.worldMatrix", 	f"{nodeList_A[8]}.inputMatrix",	 f=True) # jSplineSolver0.worldMatrix -> dmx_worldMatrix_jSplineDriver0.inputMatrix
		mc.connectAttr(f"{nodeList_A[16]}.worldMatrix", 	f"{nodeList_A[17]}.inputMatrix",	 f=True) # jSplineSolver0.worldMatrix -> pmx_worldPoint_jSplineDriver0.inputMatrix
		mc.connectAttr(f"{nodeList_A[17]}.outputMatrix", 	f"{nodeList_A[7]}.inputMatrix",	 f=True) # pmx_worldPoint_jSplineDriver0.outputMatrix -> imx_worldPointInverse_jSplineDriver0.inputMatrix
		mc.connectAttr(f"{nodeList_A[17]}.outputMatrix", 	f"{nodeList_A[15]}.inputMatrix",	 f=True) # pmx_worldPoint_jSplineDriver0.outputMatrix -> aim_splineDriver_spine0.inputMatrix
		mc.connectAttr(f"{nodeList_A[17]}.outputMatrix", 	f"{nodeList_A[5]}.matrixIn[2]",	 f=True) # pmx_worldPoint_jSplineDriver0.outputMatrix -> mxm_splineTangent_jSplineDriver0.matrixIn[2]
		mc.connectAttr(f"{nodeList_A[18]}.outputRotate", 	f"{nodeList_A[14]}.rotate",	 f=True) # dmx_jointDriver_spine0.outputRotate -> spine0.rotate
		mc.connectAttr(f"{nodeList_A[19]}.outputMatrix", 	f"{nodeList_A[11]}.matrixIn[0]",	 f=True) # cmx_downstreamTranslate_jSplineSolver0.outputMatrix -> mxm_splineForward_jSplineDriver0.matrixIn[0]
		mc.connectAttr(f"{nodeList_A[20]}.translate", 	f"{nodeList_A[19]}.inputTranslate",	 f=True) # jSplineSolver1.translate -> cmx_downstreamTranslate_jSplineSolver0.inputTranslate
	
		#mc.connectAttr(f"{nodeList_A[21]}.outputMatrix", 	f"{nodeList_A[22]}.matrixIn[1]",	 f=True) # aim_splineDriver_spine1.outputMatrix -> mxm_splineDriver_spine1.matrixIn[1]

		if not i: # skip the first joint
		#	nodeList_A[21] = mc.createNode("aimMatrix",	n=f"aim_splineResult_spine1", skipSelect = True)
		#	nodeList_A[22] = mc.createNode("multMatrix",	n=f"mxm_splineResult_spine1", skipSelect = True)
			mc.connectAttr(f"{previousNodes[0]}.forwardOrient", f"{nodeList_A[12]}.forwardOrient",	 f=True) # mxm_splineDriver_spine0.forwardOrient -> mxm_splineDriver_spine1.forwardOrient
			mc.connectAttr(f"{previousNodes[1]}.secondaryInputAxis", f"{nodeList_A[15]}.secondaryInputAxis",	 f=True) # aim_splineDriver_spine0.secondaryInputAxis -> aim_splineDriver_spine1.secondaryInputAxis
		#	mc.connectAttr(f"{nodeList_A[12]}.forwardOrient", f"{nodeList_A[22]}.forwardOrient",	 f=True) # mxm_splineDriver_spine0.forwardOrient -> mxm_splineDriver_spine1.forwardOrient
		#	mc.connectAttr(f"{nodeList_A[15]}.secondaryInputAxis", f"{nodeList_A[21]}.secondaryInputAxis",	 f=True) # aim_splineDriver_spine0.secondaryInputAxis -> aim_splineDriver_spine1.secondaryInputAxis
		else:
			returnList = [f'{nodeList_A[15]}.secondaryInputAxis' , f"{nodeList_A[12]}.forwardOrient"]
		previousNodes = [nodeList_A[12], nodeList_A[15]]
	
	# last bit on the last joints

	nodeList_B = [None] * 11
	jointList[4] = drivenJointList[-1] # last driven joint
#	jointList[4] = "spine4" # incoming: ['spine3', 'dmx_jointDriver_spine4'] - outgoing: ['pmx_parentInverseRotate_spine4', 'cmx_jointOrient_spine4']

#	nodeList_B[0] = jointList[0] # joint - dualSplineDriver0, parent: nurbsCircle1
	nodeList_B[1] = endJoint # the joint at the end of the skinned ribbon
#	nodeList_B[1] = jointList[1] # joint - dualSplineDriver2, parent: dualSplineDriver1
#	nodeList_B[2] = jointList[2] # joint - dualSplineDriver1, parent: dualSplineDriver0
#	nodeList_B[3] = jointList[3] # joint - jSplineSolver4, parent: jSplineSolver3


	nodeList_B[5] = jointList[4] # joint - spine4, parent: spine3
	nodeList_B[4] = mc.createNode("decomposeMatrix",	n=f"dmx_jointDriver_{jointList[4]}", skipSelect = True)
	nodeList_B[6] = mc.createNode("multMatrix",	n=f"mxm_splineResult_{jointList[4]}", skipSelect = True)
	nodeList_B[7] = mc.createNode("pickMatrix",	n=f"pmx_splineDriverEndJoint_{jointList[4]}", skipSelect = True)
	nodeList_B[8] = mc.createNode("pickMatrix",	n=f"pmx_parentInverseRotate_{jointList[4]}", skipSelect = True)
	nodeList_B[9] = mc.createNode("composeMatrix",	n=f"cmx_jointOrient_{jointList[4]}", skipSelect = True)
	nodeList_B[10] = mc.createNode("inverseMatrix",	n=f"imx_jointOrientInverse_{jointList[4]}", skipSelect = True)

	# write attributes
	mc.setAttr(f'{nodeList_B[7]}.useTranslate', False ) # pickMatrix14.useTranslate
	mc.setAttr(f'{nodeList_B[7]}.useScale', False ) # pickMatrix14.useScale
	mc.setAttr(f'{nodeList_B[7]}.useShear', False ) # pickMatrix14.useShear
	mc.setAttr(f'{nodeList_B[8]}.useTranslate', False ) # pmx_parentInverseRotate_spine4.useTranslate
	mc.setAttr(f'{nodeList_B[8]}.useScale', False ) # pmx_parentInverseRotate_spine4.useScale
	mc.setAttr(f'{nodeList_B[8]}.useShear', False ) # pmx_parentInverseRotate_spine4.useShear

	# connect attributes
#	mc.connectAttr(f"{nodeList_B[0]}.scale", 		f"{nodeList_B[2]}.inverseScale",	 f=True) # dualSplineDriver0.scale -> dualSplineDriver1.inverseScale
#	mc.connectAttr(f"{nodeList_B[2]}.scale", 		f"{nodeList_B[1]}.inverseScale",	 f=True) # dualSplineDriver1.scale -> dualSplineDriver2.inverseScale
	mc.connectAttr(f"{nodeList_B[1]}.worldMatrix", 	f"{nodeList_B[7]}.inputMatrix",	 f=True) # dualSplineDriver2.worldMatrix -> pickMatrix14.inputMatrix
	mc.connectAttr(f"{nodeList_B[4]}.outputRotate", f"{nodeList_B[5]}.rotate",	 f=True) # dmx_jointDriver_spine4.outputRotate -> spine4.rotate
	mc.connectAttr(f"{nodeList_B[5]}.parentInverseMatrix", f"{nodeList_B[8]}.inputMatrix",	 f=True) # spine4.parentInverseMatrix -> pmx_parentInverseRotate_spine4.inputMatrix
	mc.connectAttr(f"{nodeList_B[5]}.jointOrient", 	f"{nodeList_B[9]}.inputRotate",	 f=True) # spine4.jointOrient -> cmx_jointOrient_spine4.inputRotate
	mc.connectAttr(f"{nodeList_B[6]}.matrixSum", 	f"{nodeList_B[4]}.inputMatrix",	 f=True) # mxm_splineDriver_spine4.matrixSum -> dmx_jointDriver_spine4.inputMatrix
	mc.connectAttr(f"{nodeList_B[7]}.outputMatrix", f"{nodeList_B[6]}.matrixIn[0]",	 f=True) # pickMatrix14.outputMatrix -> mxm_splineDriver_spine4.matrixIn[0]
	mc.connectAttr(f"{nodeList_B[8]}.outputMatrix", f"{nodeList_B[6]}.matrixIn[1]",	 f=True) # pmx_parentInverseRotate_spine4.outputMatrix -> mxm_splineDriver_spine4.matrixIn[1]
	mc.connectAttr(f"{nodeList_B[9]}.outputMatrix", f"{nodeList_B[10]}.inputMatrix",	 f=True) # cmx_jointOrient_spine4.outputMatrix -> imx_jointOrientInverse_spine4.inputMatrix
	mc.connectAttr(f"{nodeList_B[10]}.outputMatrix", f"{nodeList_B[6]}.matrixIn[2]",	 f=True) # imx_jointOrientInverse_spine4.outputMatrix -> mxm_splineDriver_spine4.matrixIn[2]

	# end of script
	return returnList