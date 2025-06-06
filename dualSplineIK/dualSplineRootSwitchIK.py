# scripterStu: start print
# date created: UTC 0800 2025.06.06 1827HRS

import maya.cmds as mc
import maya.api.OpenMaya as om2

# activeSelection = om2.MGlobal.getActiveSelectionList()

# resultJointList: list of joints representing the result, in hierarchal order
# forwardSolverJointList: list of joints bearing the result of the forward spline IK
# reverseSolverJointList: list of joints bearing the result of the reverse spline IK; expects the rectified chain, not the direct IK result
# fwdTangentCurve: name of node holding curve of forward tangent curve; expects curveFromSurfaceIso
# revTangentCurve: name of node holding curve of reverse tangent curve; expects curveFromSurfaceIso
#
# return: name of network node, with the .ikRootSwitch attribute. expected to be used in mc.connectAttr() or mc.listRelatives()
def setupDualSplineRootSwitchIK(resultJointList:list, forwardSolverJointList:list, reverseSolverJointList:list, fwdTangentCurve:str, revTangentCurve:str) -> str:
	# assertion and input sanitisation script here (this will be a next time thing)

	# list of joints
	jointList = [None] * 5
	nodeList = [None] * 43

	nodeList[0] = fwdTangentCurve # mc.createNode("curveFromSurfaceIso",	n=f"siso_tangentCurve_splineDriver0", skipSelect = True)
	nodeList[1] = revTangentCurve # mc.createNode("reverseCurve",	n=f"cRev_tangentCurve_splineDriver0", skipSelect = True)
		# handle the splinefromIso setup externally before passing to this script; commands for reference
	# mc.setAttr(f'{nodeList[0]}.isoparmValue', 1.0 , type='double') # siso_tangentCurve_splineDriver0.isoparmValue
	# mc.connectAttr(f"{nodeList[0]}.outputCurve", f"{nodeList[1]}.inputCurve",	 f=True) # siso_tangentCurve_splineDriver0.outputCurve -> cRev_tangentCurve_splineDriver0.inputCurve

	nodeList[2] = mc.createNode("network",	n=f"net_fkikBlend_{resultJointList[0]}_annotate", skipSelect = True) # return item
	# Dynamic Attributes for nodeList[2] : net_fkikBlend_annotate ========================== 
	mc.addAttr(nodeList[2], ln='ikRootSwitch', at='double'                    	, hasMinValue = True, minValue = 0.0, hasMaxValue = True, maxValue = 1.0, defaultValue = 0.0, hidden = False, readable = True, writable = True, keyable = False)

	downwardConnect = [None, None, None] # rev_aimMatrix, fwd_aimMatrix, result_multMatrix

	for i in range(len(resultJointList) -1):
		jointList[0] = resultJointList[i] 	# "splineDriver0" 
		jointList[1] = reverseSolverJointList[i] # "jRevSplineChain0" 
		jointList[3] = reverseSolverJointList[i+1] # "jRevSplineChain1" 
		jointList[2] = forwardSolverJointList[i] # "jSplineSolver0" 
		jointList[4] = forwardSolverJointList[i+1] # "jSplineSolver1" 

		nodeList[24] = jointList[0] # joint - splineDriver0, parent: 
		nodeList[30] = jointList[1] # joint - jRevSplineChain0, parent: g_dualSplineIK_spline
		nodeList[31] = jointList[2] # joint - jSplineSolver0, parent: g_dualSplineIK_spline
		nodeList[40] = jointList[3] # joint - jRevSplineChain1, parent: jRevSplineChain0
		nodeList[41] = jointList[4] # joint - jSplineSolver1, parent: jSplineSolver0

		# base nodes
		nodeList[8] = mc.createNode("inverseMatrix",	n=f"imx_jointOrientInverse_splineDriver0", skipSelect = True)
		nodeList[9] = mc.createNode("blendMatrix",	n=f"bmx_splineDriver_splineDriver0", skipSelect = True)
		nodeList[10] = mc.createNode("composeMatrix",	n=f"cmx_dualSplineVector_jSplineSolver0", skipSelect = True)
		nodeList[11] = mc.createNode("nearestPointOnCurve",	n=f"npoc_revDualSplineVector_jSplineSolver0", skipSelect = True)
		nodeList[12] = mc.createNode("aimMatrix",	n=f"aim_splineDriverRev_splineDriver0", skipSelect = True)
		nodeList[13] = mc.createNode("nearestPointOnCurve",	n=f"npoc_fwdDualSplineVector_jSplineSolver0", skipSelect = True)
		nodeList[14] = mc.createNode("composeMatrix",	n=f"cmx_jointOrient_splineDriver0", skipSelect = True)
		nodeList[15] = mc.createNode("multMatrix",	n=f"mxm_splineTangent_jSplineSolver0", skipSelect = True)
		nodeList[16] = mc.createNode("aimMatrix",	n=f"aim_splineDriverFwd_splineDriver0", skipSelect = True)
		nodeList[17] = mc.createNode("multMatrix",	n=f"mxm_splineTangent_jRevSplineChain0", skipSelect = True)
		nodeList[18] = mc.createNode("composeMatrix",	n=f"cmx_dualSplineVector_jRevSplineChain0", skipSelect = True)
		nodeList[19] = mc.createNode("multMatrix",	n=f"mxm_splineDriver_splineDriver0", skipSelect = True)
		nodeList[20] = mc.createNode("pickMatrix",	n=f"pmx_parentInverseRotate_splineDriver0", skipSelect = True)
		nodeList[21] = mc.createNode("inverseMatrix",	n=f"imx_worldPointInverse_jSplineSolver0", skipSelect = True)
		nodeList[22] = mc.createNode("inverseMatrix",	n=f"imx_worldPointInverse_jRevSplineChain0", skipSelect = True)
		nodeList[23] = mc.createNode("decomposeMatrix",	n=f"dmx_worldMatrix_jRevSplineChain0", skipSelect = True)
		nodeList[25] = mc.createNode("decomposeMatrix",	n=f"dmx_worldMatrix_jSplineSolver0", skipSelect = True)
		nodeList[26] = mc.createNode("multMatrix",	n=f"mxm_splineForward_jSplineSolver0", skipSelect = True)
		nodeList[27] = mc.createNode("pickMatrix",	n=f"pmx_splineForward_jSplineSolver0", skipSelect = True)
		nodeList[28] = mc.createNode("decomposeMatrix",	n=f"dmx_jointDriver_splineDriver0", skipSelect = True)
		nodeList[29] = mc.createNode("multMatrix",	n=f"mxm_splineForward_jRevSplineChain0", skipSelect = True)
		nodeList[32] = mc.createNode("pickMatrix",	n=f"pmx_splineForward_jRevSplineChain0", skipSelect = True)
		nodeList[33] = mc.createNode("pickMatrix",	n=f"pmx_worldPoint_jSplineSolver0", skipSelect = True)
		nodeList[34] = mc.createNode("pickMatrix",	n=f"pmx_worldPoint_jRevSplineChain0", skipSelect = True)
		nodeList[35] = mc.createNode("composeMatrix",	n=f"cmx_scale_jRevSplineChain0", skipSelect = True)

		nodeList[36] = mc.createNode("composeMatrix",	n=f"cmx_downstreamTranslate_jSplineSolver0", skipSelect = True)
		mc.connectAttr(f"{nodeList[41]}.translate", f"{nodeList[36]}.inputTranslate",	 f=True) # jSplineSolver1.translate -> cmx_downstreamTranslate_jSplineSolver0.inputTranslate
		nodeList[39] = mc.createNode("composeMatrix",	n=f"cmx_downstreamTranslate_jRevSplineChain0", skipSelect = True)
		mc.connectAttr(f"{nodeList[40]}.translate", 	f"{nodeList[39]}.inputTranslate",	 f=True) # jRevSplineChain1.translate -> cmx_downstreamTranslate_jRevSplineChain0.inputTranslate
		
		mc.connectAttr(f"{nodeList[2]}.ikRootSwitch", f"{nodeList[9]}.target[0].weight",	 f=True) # net_fkikBlend_annotate.ikRootSwitch -> bmx_splineDriver_splineDriver0.target[0].weight

		mc.setAttr(f'{nodeList[12]}.secondaryMode', 1 , type='enum') # aim_splineDriverRev_splineDriver0.secondaryMode
		mc.setAttr(f'{nodeList[16]}.secondaryMode', 1 , type='enum') # aim_splineDriverFwd_splineDriver0.secondaryMode
		mc.setAttr(f'{nodeList[16]}.secondaryInputAxisY', 0.0 , type='double') # aim_splineDriverFwd_splineDriver0.secondaryInputAxisY
		mc.setAttr(f'{nodeList[16]}.secondaryInputAxisZ', -1.0 , type='double') # aim_splineDriverFwd_splineDriver0.secondaryInputAxisZ
		mc.setAttr(f'{nodeList[20]}.useTranslate', False ) # pmx_parentInverseRotate_splineDriver0.useTranslate
		mc.setAttr(f'{nodeList[20]}.useScale', False ) # pmx_parentInverseRotate_splineDriver0.useScale
		mc.setAttr(f'{nodeList[20]}.useShear', False ) # pmx_parentInverseRotate_splineDriver0.useShear
		mc.setAttr(f'{nodeList[27]}.useRotate', False ) # pmx_splineForward_jSplineSolver0.useRotate
		mc.setAttr(f'{nodeList[32]}.useRotate', False ) # pmx_splineForward_jRevSplineChain0.useRotate
		mc.setAttr(f'{nodeList[33]}.useRotate', False ) # pmx_worldPoint_jSplineSolver0.useRotate
		mc.setAttr(f'{nodeList[33]}.useScale', False ) # pmx_worldPoint_jSplineSolver0.useScale
		mc.setAttr(f'{nodeList[33]}.useShear', False ) # pmx_worldPoint_jSplineSolver0.useShear
		mc.setAttr(f'{nodeList[34]}.useRotate', False ) # pmx_worldPoint_jRevSplineChain0.useRotate
		mc.setAttr(f'{nodeList[34]}.useScale', False ) # pmx_worldPoint_jRevSplineChain0.useScale
		mc.setAttr(f'{nodeList[34]}.useShear', False ) # pmx_worldPoint_jRevSplineChain0.useShear

		# Dynamic Attributes for nodeList[19] : mxm_splineDriver_splineDriver0 ========================== 
		mc.addAttr(nodeList[19], ln='forwardOrient', at='matrix'                     	, hidden = False, readable = True, writable = True, keyable = False)
		mc.connectAttr(f"{nodeList[19]}.forwardOrient", f"{nodeList[19]}.matrixIn[0]",	 f=True) # mxm_splineDriver_splineDriver0.forwardOrient -> mxm_splineDriver_splineDriver0.matrixIn[0]
		mc.connectAttr(f"{nodeList[9]}.outputMatrix", 	f"{nodeList[19]}.matrixIn[1]",	 f=True) # bmx_splineDriver_splineDriver0.outputMatrix -> mxm_splineDriver_splineDriver0.matrixIn[1]
		mc.connectAttr(f"{nodeList[20]}.outputMatrix", 	f"{nodeList[19]}.matrixIn[2]",	 f=True) # pmx_parentInverseRotate_splineDriver0.outputMatrix -> mxm_splineDriver_splineDriver0.matrixIn[2]
		mc.connectAttr(f"{nodeList[8]}.outputMatrix", 	f"{nodeList[19]}.matrixIn[3]",	 f=True) # imx_jointOrientInverse_splineDriver0.outputMatrix -> mxm_splineDriver_splineDriver0.matrixIn[3]
		# Dynamic Attributes for nodeList[26] : mxm_splineForward_jSplineSolver0 ========================== 
		mc.addAttr(nodeList[26], ln='forwardVector', at='matrix'                     	, hidden = False, readable = True, writable = True, keyable = False)
		mc.setAttr(f'{nodeList[26]}.forwardVector', 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0, 0.0, 1.0, type='matrix') # dynamic attribute setAttr
		mc.connectAttr(f"{nodeList[36]}.outputMatrix", 	f"{nodeList[26]}.matrixIn[0]",	 f=True) # cmx_downstreamTranslate_jSplineSolver0.outputMatrix -> mxm_splineForward_jSplineSolver0.matrixIn[0]
		mc.connectAttr(f"{nodeList[31]}.worldMatrix", 	f"{nodeList[26]}.matrixIn[1]",	 f=True) # jSplineSolver0.worldMatrix -> mxm_splineForward_jSplineSolver0.matrixIn[1]
		
		mc.connectAttr(f"{nodeList[1]}.outputCurve", f"{nodeList[11]}.inputCurve",	 f=True) # cRev_tangentCurve_splineDriver0.outputCurve -> npoc_revDualSplineVector_jSplineSolver0.inputCurve
		mc.connectAttr(f"{nodeList[23]}.outputTranslate", f"{nodeList[11]}.inPosition",	 f=True) # dmx_worldMatrix_jRevSplineChain0.outputTranslate -> npoc_revDualSplineVector_jSplineSolver0.inPosition
		mc.connectAttr(f"{nodeList[0]}.outputCurve", f"{nodeList[13]}.inputCurve",	 f=True) # siso_tangentCurve_splineDriver0.outputCurve -> npoc_fwdDualSplineVector_jSplineSolver0.inputCurve
		mc.connectAttr(f"{nodeList[25]}.outputTranslate", f"{nodeList[13]}.inPosition",	 f=True) # dmx_worldMatrix_jSplineSolver0.outputTranslate -> npoc_fwdDualSplineVector_jSplineSolver0.inPosition
		mc.connectAttr(f"{nodeList[21]}.outputMatrix", 	f"{nodeList[15]}.matrixIn[0]",	 f=True) # imx_worldPointInverse_jSplineSolver0.outputMatrix -> mxm_splineTangent_jSplineSolver0.matrixIn[0]
		mc.connectAttr(f"{nodeList[10]}.outputMatrix", 	f"{nodeList[15]}.matrixIn[1]",	 f=True) # cmx_dualSplineVector_jSplineSolver0.outputMatrix -> mxm_splineTangent_jSplineSolver0.matrixIn[1]
		mc.connectAttr(f"{nodeList[33]}.outputMatrix", 	f"{nodeList[15]}.matrixIn[2]",	 f=True) # pmx_worldPoint_jSplineSolver0.outputMatrix -> mxm_splineTangent_jSplineSolver0.matrixIn[2]
		mc.connectAttr(f"{nodeList[22]}.outputMatrix", 	f"{nodeList[17]}.matrixIn[0]",	 f=True) # imx_worldPointInverse_jRevSplineChain0.outputMatrix -> mxm_splineTangent_jRevSplineChain0.matrixIn[0]
		mc.connectAttr(f"{nodeList[18]}.outputMatrix", 	f"{nodeList[17]}.matrixIn[1]",	 f=True) # cmx_dualSplineVector_jRevSplineChain0.outputMatrix -> mxm_splineTangent_jRevSplineChain0.matrixIn[1]
		mc.connectAttr(f"{nodeList[34]}.outputMatrix", 	f"{nodeList[17]}.matrixIn[2]",	 f=True) # pmx_worldPoint_jRevSplineChain0.outputMatrix -> mxm_splineTangent_jRevSplineChain0.matrixIn[2]
		mc.connectAttr(f"{nodeList[39]}.outputMatrix", 	f"{nodeList[29]}.matrixIn[0]",	 f=True) # cmx_downstreamTranslate_jRevSplineChain0.outputMatrix -> mxm_splineForward_jRevSplineChain0.matrixIn[0]
		mc.connectAttr(f"{nodeList[30]}.worldMatrix", 	f"{nodeList[29]}.matrixIn[1]",	 f=True) # jRevSplineChain0.worldMatrix -> mxm_splineForward_jRevSplineChain0.matrixIn[1]
		mc.connectAttr(f"{nodeList[11]}.position", 	f"{nodeList[18]}.inputTranslate",	 f=True) # npoc_revDualSplineVector_jSplineSolver0.position -> cmx_dualSplineVector_jRevSplineChain0.inputTranslate
		mc.connectAttr(f"{nodeList[13]}.position", 	f"{nodeList[10]}.inputTranslate",	 f=True) # npoc_fwdDualSplineVector_jSplineSolver0.position -> cmx_dualSplineVector_jSplineSolver0.inputTranslate
		mc.connectAttr(f"{nodeList[14]}.outputMatrix", 	f"{nodeList[8]}.inputMatrix",	 f=True) # cmx_jointOrient_splineDriver0.outputMatrix -> imx_jointOrientInverse_splineDriver0.inputMatrix
		mc.connectAttr(f"{nodeList[15]}.matrixSum", 	f"{nodeList[16]}.secondaryTargetMatrix",	 f=True) # mxm_splineTangent_jSplineSolver0.matrixSum -> aim_splineDriverFwd_splineDriver0.secondaryTargetMatrix
		mc.connectAttr(f"{nodeList[16]}.secondaryInputAxis", f"{nodeList[12]}.secondaryInputAxis",	 f=True) # aim_splineDriverFwd_splineDriver0.secondaryInputAxis -> aim_splineDriverRev_splineDriver0.secondaryInputAxis
		mc.connectAttr(f"{nodeList[16]}.outputMatrix", 	f"{nodeList[9]}.inputMatrix",	 f=True) # aim_splineDriverFwd_splineDriver0.outputMatrix -> bmx_splineDriver_splineDriver0.inputMatrix
		mc.connectAttr(f"{nodeList[17]}.matrixSum", 	f"{nodeList[12]}.secondaryTargetMatrix",	 f=True) # mxm_splineTangent_jRevSplineChain0.matrixSum -> aim_splineDriverRev_splineDriver0.secondaryTargetMatrix
		mc.connectAttr(f"{nodeList[19]}.matrixSum", 	f"{nodeList[28]}.inputMatrix",	 f=True) # mxm_splineDriver_splineDriver0.matrixSum -> dmx_jointDriver_splineDriver0.inputMatrix
		mc.connectAttr(f"{nodeList[24]}.jointOrient", 	f"{nodeList[14]}.inputRotate",	 f=True) # splineDriver0.jointOrient -> cmx_jointOrient_splineDriver0.inputRotate
		mc.connectAttr(f"{nodeList[24]}.parentInverseMatrix", f"{nodeList[20]}.inputMatrix",	 f=True) # splineDriver0.parentInverseMatrix -> pmx_parentInverseRotate_splineDriver0.inputMatrix
		mc.connectAttr(f"{nodeList[26]}.matrixSum", 	f"{nodeList[27]}.inputMatrix",	 f=True) # mxm_splineForward_jSplineSolver0.matrixSum -> pmx_splineForward_jSplineSolver0.inputMatrix
		mc.connectAttr(f"{nodeList[27]}.outputMatrix", 	f"{nodeList[16]}.primaryTargetMatrix",	 f=True) # pmx_splineForward_jSplineSolver0.outputMatrix -> aim_splineDriverFwd_splineDriver0.primaryTargetMatrix
		mc.connectAttr(f"{nodeList[28]}.outputRotate", 	f"{nodeList[24]}.rotate",	 f=True) # dmx_jointDriver_splineDriver0.outputRotate -> splineDriver0.rotate
		mc.connectAttr(f"{nodeList[28]}.outputScale", 	f"{nodeList[24]}.scale",	 f=True) # dmx_jointDriver_splineDriver0.outputScale -> splineDriver0.scale
		mc.connectAttr(f"{nodeList[29]}.matrixSum", 	f"{nodeList[32]}.inputMatrix",	 f=True) # mxm_splineForward_jRevSplineChain0.matrixSum -> pmx_splineForward_jRevSplineChain0.inputMatrix
		mc.connectAttr(f"{nodeList[30]}.scale", 	f"{nodeList[35]}.inputScale",	 f=True) # jRevSplineChain0.scale -> cmx_scale_jRevSplineChain0.inputScale
		mc.connectAttr(f"{nodeList[30]}.worldMatrix", 	f"{nodeList[23]}.inputMatrix",	 f=True) # jRevSplineChain0.worldMatrix -> dmx_worldMatrix_jRevSplineChain0.inputMatrix
		mc.connectAttr(f"{nodeList[30]}.worldMatrix", 	f"{nodeList[34]}.inputMatrix",	 f=True) # jRevSplineChain0.worldMatrix -> pmx_worldPoint_jRevSplineChain0.inputMatrix
		mc.connectAttr(f"{nodeList[31]}.worldMatrix", 	f"{nodeList[25]}.inputMatrix",	 f=True) # jSplineSolver0.worldMatrix -> dmx_worldMatrix_jSplineSolver0.inputMatrix
		mc.connectAttr(f"{nodeList[31]}.worldMatrix", 	f"{nodeList[33]}.inputMatrix",	 f=True) # jSplineSolver0.worldMatrix -> pmx_worldPoint_jSplineSolver0.inputMatrix
		mc.connectAttr(f"{nodeList[32]}.outputMatrix", 	f"{nodeList[12]}.primaryTargetMatrix",	 f=True) # pmx_splineForward_jRevSplineChain0.outputMatrix -> aim_splineDriverRev_splineDriver0.primaryTargetMatrix
		mc.connectAttr(f"{nodeList[33]}.outputMatrix", 	f"{nodeList[21]}.inputMatrix",	 f=True) # pmx_worldPoint_jSplineSolver0.outputMatrix -> imx_worldPointInverse_jSplineSolver0.inputMatrix
		mc.connectAttr(f"{nodeList[33]}.outputMatrix", 	f"{nodeList[16]}.inputMatrix",	 f=True) # pmx_worldPoint_jSplineSolver0.outputMatrix -> aim_splineDriverFwd_splineDriver0.inputMatrix
		mc.connectAttr(f"{nodeList[34]}.outputMatrix", 	f"{nodeList[12]}.inputMatrix",	 f=True) # pmx_worldPoint_jRevSplineChain0.outputMatrix -> aim_splineDriverRev_splineDriver0.inputMatrix
		mc.connectAttr(f"{nodeList[34]}.outputMatrix", 	f"{nodeList[22]}.inputMatrix",	 f=True) # pmx_worldPoint_jRevSplineChain0.outputMatrix -> imx_worldPointInverse_jRevSplineChain0.inputMatrix
		
		if not i: # if this is the 0th thing in the list
			# 0th nodes
			nodeList[3] = mc.createNode("decomposeMatrix",	n=f"dmx_dualSplineRevOffsetTrans_splineDriver0", skipSelect = True)
			nodeList[4] = mc.createNode("multMatrix",	n=f"mxm_dualSplineRevOffsetTrans_splineDriver0", skipSelect = True)
			nodeList[5] = mc.createNode("blendMatrix",	n=f"bmx_dualSplineRevOffsetTrans_splineDriver0", skipSelect = True)
			nodeList[6] = mc.createNode("multMatrix",	n=f"mxm_splineRevDriver_jRevSplineChain0", skipSelect = True)
			nodeList[7] = mc.createNode("pickMatrix",	n=f"pmx_translate_jSplineSolver0", skipSelect = True)
			mc.setAttr(f'{nodeList[7]}.useRotate', False ) # pmx_translate_jSplineSolver0.useRotate
			mc.setAttr(f'{nodeList[7]}.useScale', False ) # pmx_translate_jSplineSolver0.useScale
			mc.setAttr(f'{nodeList[7]}.useShear', False ) # pmx_translate_jSplineSolver0.useShear
			mc.connectAttr(f"{nodeList[3]}.outputTranslate", f"{nodeList[24]}.translate",	 f=True) # dmx_dualSplineRevOffsetTrans_splineDriver0.outputTranslate -> splineDriver0.translate
			mc.connectAttr(f"{nodeList[4]}.matrixSum", f"{nodeList[5]}.target[0].targetMatrix",	 f=True) # mxm_dualSplineRevOffsetTrans_splineDriver0.matrixSum -> bmx_dualSplineRevOffsetTrans_splineDriver0.target[0].targetMatrix
			mc.connectAttr(f"{nodeList[5]}.outputMatrix", f"{nodeList[3]}.inputMatrix",	 f=True) # bmx_dualSplineRevOffsetTrans_splineDriver0.outputMatrix -> dmx_dualSplineRevOffsetTrans_splineDriver0.inputMatrix
			mc.connectAttr(f"{nodeList[6]}.matrixSum", f"{nodeList[9]}.target[0].targetMatrix",	 f=True) # mxm_splineRevDriver_jRevSplineChain0.matrixSum -> bmx_splineDriver_splineDriver0.target[0].targetMatrix
			mc.connectAttr(f"{nodeList[7]}.outputMatrix", f"{nodeList[4]}.matrixIn[1]",	 f=True) # pmx_translate_jSplineSolver0.outputMatrix -> mxm_dualSplineRevOffsetTrans_splineDriver0.matrixIn[1]
			mc.connectAttr(f"{nodeList[30]}.worldMatrix", f"{nodeList[4]}.matrixIn[0]",	 f=True) # jRevSplineChain0.worldMatrix -> mxm_dualSplineRevOffsetTrans_splineDriver0.matrixIn[0]
			mc.connectAttr(f"{nodeList[2]}.ikRootSwitch", f"{nodeList[5]}.target[0].weight",	 f=True) # net_fkikBlend_annotate.ikRootSwitch -> bmx_dualSplineRevOffsetTrans_splineDriver0.target[0].weight
			mc.connectAttr(f"{nodeList[12]}.outputMatrix", f"{nodeList[6]}.matrixIn[0]",	 f=True) # aim_splineDriverRev_splineDriver0.outputMatrix -> mxm_splineRevDriver_jRevSplineChain0.matrixIn[0]
			mc.connectAttr(f"{nodeList[35]}.outputMatrix", f"{nodeList[6]}.matrixIn[1]",	 f=True) # cmx_scale_jRevSplineChain0.outputMatrix -> mxm_splineRevDriver_jRevSplineChain0.matrixIn[1]
			mc.connectAttr(f"{nodeList[31]}.worldInverseMatrix", f"{nodeList[7]}.inputMatrix",	 f=True) # jSplineSolver0.worldInverseMatrix -> pmx_translate_jSplineSolver0.inputMatrix
			pass
		else: # if this is the 1st and later: do downstream connections
			# downstream plugs, [-1] -> [0]
			mc.connectAttr(f"{downwardConnect[0]}.secondaryInputAxis", f"{nodeList[37]}.secondaryInputAxis",	 f=True) # aim_splineDriverRev_splineDriver0.secondaryInputAxis -> aim_splineDriverRev_splineDriver1.secondaryInputAxis
			mc.connectAttr(f"{downwardConnect[1]}.secondaryInputAxis", f"{nodeList[38]}.secondaryInputAxis",	 f=True) # aim_splineDriverFwd_splineDriver0.secondaryInputAxis -> aim_splineDriverFwd_splineDriver1.secondaryInputAxis
			mc.connectAttr(f"{downwardConnect[2]}.forwardOrient", f"{nodeList[42]}.forwardOrient",	 f=True) # mxm_splineDriver_splineDriver0.forwardOrient -> mxm_splineDriver_splineDriver1.forwardOrient
			pass

		# prepare for next loop
		downwardConnect[0] = nodeList[37] # rev_aimMatrix
		downwardConnect[1] = nodeList[38] # fwd_aimMatrix
		downwardConnect[2] = nodeList[42] # result_multMatrix
		pass
	# end of script
	return f"{nodeList[2]}.ikRootSwitch"
