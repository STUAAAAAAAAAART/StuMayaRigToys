import maya.cmds as mc
import maya.api.OpenMaya as om2

def rootMotionSetup(controlGroupName="g_controls", rigOpName="g_rootMotion", lockScale=True):
	jointList = [None] * 2
	nodeList = [None] * 35
	try: # assert root joint
		jointList[0] = "root" # incoming: ['dmx_driver_root'] - outgoing: ['rigCore', 'joint3', 'pCube1', 'cmx_jointOrient_root', 'mxm_offsetTransformFrom_worldManip']
		assert mc.nodeType(jointList[0]) == "joint"
		nodeList[12] = jointList[0] # joint - root, parent
	except:
		raise AssertionError("rootMotionSetup: 'root' DAG object is not a joint")
	try: # assert it resides in scene root
		testRoot = mc.listRelatives(jointList[0], p=True)
		assert testRoot == None
		del testRoot
	except:
		raise AssertionError(f"rootMotionSetup: 'root' joint has parents - {testRoot}")
	rigList = []
	try: # assert the script has something to do
		rigList = mc.listRelatives(jointList[0], c=True, ad=False)
		assert rigList
	except: # do not let this script just rig the worldManip, this is overkill and don't make this a habit
		raise AssertionError("rootMotionSetup: no joints under 'root' joint found to rig")

	# ============ group setup
	if mc.objExists(controlGroupName):
		nodeList[2] = controlGroupName
	else:
		nodeList[2] = mc.createNode("transform",	n=controlGroupName,  skipSelect = True)
	if mc.objExists(rigOpName):
		nodeList[1] = rigOpName
	else:
		nodeList[1] = mc.createNode("transform",	n=rigOpName, p=nodeList[2],  skipSelect = True) # parent of shape: g_controls
	
	returnNodeDG : om2.MSelectionList = om2.MSelectionList()
	returnControls : om2.MSelectionList = om2.MSelectionList()

	# ============ main section
	nodeList[17] = mc.createNode("inverseMatrix",	n=f"imx_worldOffsetMatrixForControlsIK", skipSelect = True)
	nodeList[14] = mc.createNode("multMatrix",	n=f"mxm_opmFrom_worldManip", skipSelect = True)
	nodeList[19] = mc.createNode("multMatrix",	n=f"mxm_offsetTransformFrom_worldManip", skipSelect = True)
	# Dynamic Attributes for nodeList[17] : imx_worldOffsetMatrixForControlsIK ========================== 
	mc.addAttr(nodeList[17], ln='scalePassthroughMatrix', at='matrix', hidden = False, readable = True, writable = True, keyable = False)
	
	returnNodeDG.add(nodeList[17]) # imx_worldOffsetMatrixForControlsIK
	returnNodeDG.add(nodeList[14]) # mxm_opmFrom_worldManip
	returnNodeDG.add(nodeList[19]) # mxm_offsetTransformFrom_worldManip

	nodeList[15] = mc.createNode("transform",	n=f"c_worldManip", p=nodeList[2],  skipSelect = True) # parent of shape: g_controls
	nodeList[16] = mc.createNode("nurbsCurve",	n=f"{nodeList[15]}Shape", p=nodeList[15], skipSelect = True) # transform: c_worldManip
	mc.setAttr(nodeList[16]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [-1.5672232497824492, 4.7982373409884725e-17, -1.567223249782449], [-2.2163883751087754, 4.1550626846842558e-33, -1.3571464646221824e-16], [-1.5672232497824488, -4.7982373409884725e-17, 1.567223249782449], [-1.1489796475049661e-16, -6.7857323231109146e-17, 2.2163883751087763], [1.567223249782449, -4.7982373409884725e-17, 1.567223249782449], [2.2163883751087767, -6.7973144778085889e-33, 2.2201713939206452e-16], [1.5672232497824488, 4.7982373409884725e-17, -1.567223249782449], [3.022481001559918e-16, 6.7857323231109146e-17, -2.2163883751087763], [-1.5672232497824492, 4.7982373409884725e-17, -1.567223249782449], [-2.2163883751087754, 4.1550626846842558e-33, -1.3571464646221824e-16], [-1.5672232497824488, -4.7982373409884725e-17, 1.567223249782449], type = "nurbsCurve")
	
	nodeList[20] = mc.createNode("transform",	n=f"c_rigBaseManip", p=nodeList[1],  skipSelect = True) # parent of shape: g_rootMotion
	nodeList[21] = mc.createNode("nurbsCurve",	n=f"{nodeList[20]}Shape", p=nodeList[20], skipSelect = True) # transform: c_rigBaseManip
	mc.setAttr(nodeList[21]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [-0.7836116248912246, 4.7982373409884725e-17, -0.78361162489122449], [-1.1081941875543877, 4.1550626846842558e-33, -6.7857323231109122e-17], [-0.78361162489122438, -4.7982373409884725e-17, 0.78361162489122449], [-5.7448982375248304e-17, -6.7857323231109146e-17, 1.1081941875543881], [0.78361162489122449, -4.7982373409884725e-17, 0.78361162489122449], [1.1081941875543884, -6.7973144778085889e-33, 1.1100856969603225e-16], [0.78361162489122438, 4.7982373409884725e-17, -0.78361162489122449], [1.511240500779959e-16, 6.7857323231109146e-17, -1.1081941875543881], [-0.7836116248912246, 4.7982373409884725e-17, -0.78361162489122449], [-1.1081941875543877, 4.1550626846842558e-33, -6.7857323231109122e-17], [-0.78361162489122438, -4.7982373409884725e-17, 0.78361162489122449], type = "nurbsCurve")

	nodeList[10] = mc.createNode("transform",	n=f"c_rootPoint", p=nodeList[1],  skipSelect = True) # parent of shape: g_rootMotion
	nodeList[11] = mc.createNode("nurbsCurve",	n=f"{nodeList[10]}Shape", p=nodeList[10], skipSelect = True) # transform: c_rootPoint
	mc.setAttr(nodeList[11]+".cc", 1, 48, 0, False, 3, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48], 49, 49, [1, 0, 0], [0.035355338454246522, 0.035355341434478764, 0], [0, 1, 0], [0, 0.035355341434478764, 0.035355338454246522], [0, 0, 1], [0.035355338454246522, 0, 0.035355341434478764], [0, 0.035355341434478764, 0.035355338454246522], [0.035355338454246522, 0.035355341434478764, 0], [0.035355338454246522, 0, 0.035355341434478764], [1, 0, 0], [0.035355338454246522, -0.035355341434478764, 0], [0, -1, 0], [0, -0.035355341434478764, 0.035355338454246522], [0.035355338454246522, -0.035355341434478764, 0], [0.035355338454246522, 0, 0.035355341434478764], [0, -0.035355341434478764, 0.035355338454246522], [0, 0, 1], [-0.035355335474014281, 0, 0.035355341434478764], [-1, 0, 0], [-0.035355335474014281, -0.035355341434478764, 0], [-0.035355335474014281, 0, 0.035355341434478764], [0, -0.035355341434478764, 0.035355338454246522], [-0.035355335474014281, -0.035355341434478764, 0], [0, -1, 0], [0, -0.035355338454246522, -0.035355341434478764], [0, 0, -1], [-0.035355335474014281, 0, -0.035355341434478764], [0, -0.035355341434478764, -0.035355335474014281], [-0.035355335474014281, -0.035355341434478764, 0], [-0.035355335474014281, 0, -0.035355341434478764], [-1, 0, 0], [-0.035355335474014281, 0.035355341434478764, 0], [-0.035355335474014281, 0, 0.035355341434478764], [0, 0.035355341434478764, 0.035355338454246522], [-0.035355335474014281, 0.035355341434478764, 0], [0, 1, 0], [0, 0.035355338454246522, -0.035355341434478764], [-0.035355335474014281, 0.035355341434478764, 0], [-0.035355335474014281, 0, -0.035355341434478764], [0, 0.035355338454246522, -0.035355341434478764], [0, 0, -1], [0.035355338454246522, 0, -0.035355341434478764], [0, -0.035355341434478764, -0.035355335474014281], [0.035355338454246522, -0.035355341434478764, 0], [0.035355338454246522, 0, -0.035355341434478764], [0.035355338454246522, 0.035355341434478764, 0], [0, 0.035355338454246522, -0.035355341434478764], [0.035355338454246522, 0, -0.035355341434478764], [1, 0, 0], type = "nurbsCurve")
	mc.color(nodeList[10], rgb=(0.5503355860710144, 0.5503355860710144, 0.0) ) # c_rootPoint

	returnControls.add(nodeList[15]) # c_worldManip
	returnControls.add(nodeList[10]) # c_rootPoint
	returnControls.add(nodeList[20]) # c_rigBaseManip

	if lockScale:
		# =========== control group
		mc.setAttr(f'{nodeList[2]}.translateX', lock=True)
		mc.setAttr(f'{nodeList[2]}.translateX', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[2]}.translateY', lock=True)
		mc.setAttr(f'{nodeList[2]}.translateY', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[2]}.translateZ', lock=True)
		mc.setAttr(f'{nodeList[2]}.translateZ', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[2]}.rotateX', lock=True)
		mc.setAttr(f'{nodeList[2]}.rotateX', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[2]}.rotateY', lock=True)
		mc.setAttr(f'{nodeList[2]}.rotateY', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[2]}.rotateZ', lock=True)
		mc.setAttr(f'{nodeList[2]}.rotateZ', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[2]}.scaleX', lock=True)
		mc.setAttr(f'{nodeList[2]}.scaleX', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[2]}.scaleY', lock=True)
		mc.setAttr(f'{nodeList[2]}.scaleY', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[2]}.scaleZ', lock=True)
		mc.setAttr(f'{nodeList[2]}.scaleZ', keyable=False, channelBox=False)
		# =========== rigOp group
		mc.setAttr(f'{nodeList[1]}.translateX', lock=True)
		mc.setAttr(f'{nodeList[1]}.translateX', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[1]}.translateY', lock=True)
		mc.setAttr(f'{nodeList[1]}.translateY', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[1]}.translateZ', lock=True)
		mc.setAttr(f'{nodeList[1]}.translateZ', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[1]}.rotateX', lock=True)
		mc.setAttr(f'{nodeList[1]}.rotateX', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[1]}.rotateY', lock=True)
		mc.setAttr(f'{nodeList[1]}.rotateY', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[1]}.rotateZ', lock=True)
		mc.setAttr(f'{nodeList[1]}.rotateZ', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[1]}.scaleX', lock=True)
		mc.setAttr(f'{nodeList[1]}.scaleX', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[1]}.scaleY', lock=True)
		mc.setAttr(f'{nodeList[1]}.scaleY', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[1]}.scaleZ', lock=True)
		mc.setAttr(f'{nodeList[1]}.scaleZ', keyable=False, channelBox=False)
		# =========== rootPoint control
		mc.setAttr(f'{nodeList[10]}.rotateX', lock=True)
		mc.setAttr(f'{nodeList[10]}.rotateX', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[10]}.rotateY', lock=True)
		mc.setAttr(f'{nodeList[10]}.rotateY', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[10]}.rotateZ', lock=True)
		mc.setAttr(f'{nodeList[10]}.rotateZ', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[10]}.scaleX', lock=True)
		mc.setAttr(f'{nodeList[10]}.scaleX', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[10]}.scaleY', lock=True)
		mc.setAttr(f'{nodeList[10]}.scaleY', keyable=False, channelBox=False)
		mc.setAttr(f'{nodeList[10]}.scaleZ', lock=True)
		mc.setAttr(f'{nodeList[10]}.scaleZ', keyable=False, channelBox=False)

	nodeList[0] = mc.createNode("pickMatrix",	n=f"pmx_trans_rootPoint", skipSelect = True)
	mc.setAttr(f'{nodeList[0]}.useRotate', False) # pmx_trans_rootPoint.useRotate
	mc.setAttr(f'{nodeList[0]}.useScale', False) # pmx_trans_rootPoint.useScale
	mc.setAttr(f'{nodeList[0]}.useShear', False) # pmx_trans_rootPoint.useShear
	nodeList[3] = mc.createNode("multMatrix",	n=f"mxm_logic_root", skipSelect = True)
	nodeList[4] = mc.createNode("pickMatrix",	n=f"pmx_logicRotScale_root", skipSelect = True)
	mc.setAttr(f'{nodeList[4]}.useTranslate', False) # pmx_logicRotScale_root.useTranslate
	nodeList[5] = mc.createNode("decomposeMatrix",	n=f"dmx_driver_root", skipSelect = True)
	nodeList[6] = mc.createNode("multMatrix",	n=f"mxm_driver_root", skipSelect = True)
	nodeList[7] = mc.createNode("pickMatrix",	n=f"pmx_logicTrans_root", skipSelect = True)
	mc.setAttr(f'{nodeList[7]}.useRotate', False) # pmx_logicTrans_root.useRotate
	mc.setAttr(f'{nodeList[7]}.useScale', False) # pmx_logicTrans_root.useScale
	mc.setAttr(f'{nodeList[7]}.useShear', False) # pmx_logicTrans_root.useShear
	nodeList[8] = mc.createNode("composeMatrix",	n=f"cmx_jointOrient_root", skipSelect = True)
	nodeList[9] = mc.createNode("inverseMatrix",	n=f"imx_jointOrientInverse_root", skipSelect = True)
	nodeList[13] = mc.createNode("pickMatrix",	n=f"pmx_scaleWorldManipDoubleDriver", skipSelect = True)
	mc.setAttr(f'{nodeList[13]}.useTranslate', False) # pmx_scaleWorldManipDoubleDriver.useTranslate
	mc.setAttr(f'{nodeList[13]}.useRotate', False) # pmx_scaleWorldManipDoubleDriver.useRotate
	mc.setAttr(f'{nodeList[13]}.useShear', False) # pmx_scaleWorldManipDoubleDriver.useShear
	nodeList[18] = mc.createNode("multMatrix",	n=f"mxm_worldBaseTransform", skipSelect = True)
	nodeList[22] = mc.createNode("pickMatrix",	n=f"pmx_worldBaseScale", skipSelect = True)
	mc.setAttr(f'{nodeList[22]}.useTranslate', False) # pmx_worldBaseScale.useTranslate
	mc.setAttr(f'{nodeList[22]}.useRotate', False) # pmx_worldBaseScale.useRotate
	mc.setAttr(f'{nodeList[22]}.useShear', False) # pmx_worldBaseScale.useShear
	nodeList[23] = mc.createNode("pickMatrix",	n=f"pmx_opm_rigBaseManip", skipSelect = True)
	mc.setAttr(f'{nodeList[23]}.useScale', False) # pmx_opm_rigBaseManip.useScale

#	mc.parent(nodeList[1], nodeList[2], r=True ) # child: g_rootMotion -> parent: g_controls 
#	mc.parent(nodeList[10], nodeList[1], r=True ) # child: c_rootPoint -> parent: g_rootMotion 
#	mc.parent(nodeList[15], nodeList[2], r=True ) # child: c_worldManip -> parent: g_controls 
#	mc.parent(nodeList[20], nodeList[1], r=True ) # child: c_rigBaseManip -> parent: g_rootMotion
	
	mc.connectAttr(f"{nodeList[0]}.outputMatrix", f"{nodeList[3]}.matrixIn[0]",	 f=True) # pmx_trans_rootPoint.outputMatrix -> mxm_logic_root.matrixIn[0]
	mc.connectAttr(f"{nodeList[3]}.matrixSum", f"{nodeList[7]}.inputMatrix",	 f=True) # mxm_logic_root.matrixSum -> pmx_logicTrans_root.inputMatrix
	mc.connectAttr(f"{nodeList[3]}.matrixSum", f"{nodeList[4]}.inputMatrix",	 f=True) # mxm_logic_root.matrixSum -> pmx_logicRotScale_root.inputMatrix
	mc.connectAttr(f"{nodeList[4]}.outputMatrix", f"{nodeList[6]}.matrixIn[2]",	 f=True) # pmx_logicRotScale_root.outputMatrix -> mxm_driver_root.matrixIn[2]
	mc.connectAttr(f"{nodeList[5]}.outputScale", f"{nodeList[12]}.scale",	 f=True) # dmx_driver_root.outputScale -> root.scale
	mc.connectAttr(f"{nodeList[5]}.outputTranslate", f"{nodeList[12]}.translate",	 f=True) # dmx_driver_root.outputTranslate -> root.translate
	mc.connectAttr(f"{nodeList[5]}.outputRotate", f"{nodeList[12]}.rotate",	 f=True) # dmx_driver_root.outputRotate -> root.rotate
	mc.connectAttr(f"{nodeList[6]}.matrixSum", f"{nodeList[5]}.inputMatrix",	 f=True) # mxm_driver_root.matrixSum -> dmx_driver_root.inputMatrix
	mc.connectAttr(f"{nodeList[7]}.outputMatrix", f"{nodeList[6]}.matrixIn[4]",	 f=True) # pmx_logicTrans_root.outputMatrix -> mxm_driver_root.matrixIn[4]
	mc.connectAttr(f"{nodeList[8]}.outputMatrix", f"{nodeList[9]}.inputMatrix",	 f=True) # cmx_jointOrient_root.outputMatrix -> imx_jointOrientInverse_root.inputMatrix
	mc.connectAttr(f"{nodeList[8]}.outputMatrix", f"{nodeList[14]}.matrixIn[0]",	 f=True) # cmx_jointOrient_root.outputMatrix -> mxm_opmFrom_worldManip.matrixIn[0]
	mc.connectAttr(f"{nodeList[8]}.outputMatrix", f"{nodeList[19]}.matrixIn[0]",	 f=True) # cmx_jointOrient_root.outputMatrix -> mxm_offsetTransformFrom_worldManip.matrixIn[0]
	mc.connectAttr(f"{nodeList[9]}.inputMatrix", f"{nodeList[6]}.matrixIn[1]",	 f=True) # imx_jointOrientInverse_root.inputMatrix -> mxm_driver_root.matrixIn[1]
	mc.connectAttr(f"{nodeList[9]}.outputMatrix", f"{nodeList[6]}.matrixIn[3]",	 f=True) # imx_jointOrientInverse_root.outputMatrix -> mxm_driver_root.matrixIn[3]
	mc.connectAttr(f"{nodeList[10]}.matrix", f"{nodeList[0]}.inputMatrix",	 f=True) # c_rootPoint.matrix -> pmx_trans_rootPoint.inputMatrix
	mc.connectAttr(f"{nodeList[12]}.jointOrient", f"{nodeList[8]}.inputRotate",	 f=True) # root.jointOrient -> cmx_jointOrient_root.inputRotate
	mc.connectAttr(f"{nodeList[12]}.inverseMatrix", f"{nodeList[19]}.matrixIn[2]",	 f=True) # root.inverseMatrix -> mxm_offsetTransformFrom_worldManip.matrixIn[2]
	mc.connectAttr(f"{nodeList[13]}.outputMatrix", f"{nodeList[6]}.matrixIn[0]",	 f=True) # pmx_scaleWorldManipDoubleDriver.outputMatrix -> mxm_driver_root.matrixIn[0]
	mc.connectAttr(f"{nodeList[15]}.matrix", f"{nodeList[3]}.matrixIn[1]",	 f=True) # c_worldManip.matrix -> mxm_logic_root.matrixIn[1]
	mc.connectAttr(f"{nodeList[15]}.matrix", f"{nodeList[10]}.offsetParentMatrix",	 f=True) # c_worldManip.matrix -> c_rootPoint.offsetParentMatrix
	mc.connectAttr(f"{nodeList[15]}.matrix", f"{nodeList[23]}.inputMatrix",	 f=True) # c_worldManip.matrix -> pmx_opm_rigBaseManip.inputMatrix
	mc.connectAttr(f"{nodeList[15]}.matrix", f"{nodeList[18]}.matrixIn[1]",	 f=True) # c_worldManip.matrix -> mxm_worldBaseTransform.matrixIn[1]
	mc.connectAttr(f"{nodeList[18]}.matrixSum", f"{nodeList[19]}.matrixIn[1]",	 f=True) # mxm_worldBaseTransform.matrixSum -> mxm_offsetTransformFrom_worldManip.matrixIn[1]
	mc.connectAttr(f"{nodeList[18]}.matrixSum", f"{nodeList[14]}.matrixIn[1]",	 f=True) # mxm_worldBaseTransform.matrixSum -> mxm_opmFrom_worldManip.matrixIn[1]
	mc.connectAttr(f"{nodeList[18]}.matrixSum", f"{nodeList[17]}.inputMatrix",	 f=True) # mxm_worldBaseTransform.matrixSum -> imx_worldOffsetMatrixForControlsIK.inputMatrix
	mc.connectAttr(f"{nodeList[18]}.matrixSum", f"{nodeList[22]}.inputMatrix",	 f=True) # mxm_worldBaseTransform.matrixSum -> pmx_worldBaseScale.inputMatrix
	mc.connectAttr(f"{nodeList[20]}.matrix", f"{nodeList[18]}.matrixIn[0]",	 f=True) # c_rigBaseManip.matrix -> mxm_worldBaseTransform.matrixIn[0]
	mc.connectAttr(f"{nodeList[20]}.matrix", f"{nodeList[13]}.inputMatrix",	 f=True) # c_rigBaseManip.matrix -> pmx_scaleWorldManipDoubleDriver.inputMatrix
	mc.connectAttr(f"{nodeList[22]}.outputMatrix", f"{nodeList[17]}.scalePassthroughMatrix",	 f=True) # pmx_worldBaseScale.outputMatrix -> imx_worldOffsetMatrixForControlsIK.scalePassthroughMatrix
	mc.connectAttr(f"{nodeList[23]}.outputMatrix", f"{nodeList[20]}.offsetParentMatrix",	 f=True) # pmx_opm_rigBaseManip.outputMatrix -> c_rigBaseManip.offsetParentMatrix	

	# ============ multi section
	# nL 24 25 26 27 28 29 30 31 32 33 34
	for jointName in rigList:
		jointList[1] = jointName # incoming: ['root', 'dmx_driver_rigCore'] - outgoing: ['pCube2', 'cmx_jointOrient_rigCore']
		nodeList[29] = jointList[1] # name of joint that's child of root joint

		nodeList[25] = mc.createNode("transform",	n=f"c_{nodeList[29]}", p=nodeList[1],  skipSelect = True) # parent of shape: g_rootMotion
		nodeList[26] = mc.createNode("nurbsCurve",	n=f"{nodeList[25]}Shape", p=nodeList[25], skipSelect = True) # transform: c_{nodeList[29]}Manip
		mc.setAttr(nodeList[26]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [-0.7836116248912246, 0.78361162489122449, 4.7982373409884725e-17], [-1.1081941875543877, 6.7857323231109122e-17, 4.1550626846842558e-33], [-0.78361162489122438, -0.78361162489122449, -4.7982373409884725e-17], [-5.7448982375248304e-17, -1.1081941875543881, -6.7857323231109146e-17], [0.78361162489122449, -0.78361162489122449, -4.7982373409884725e-17], [1.1081941875543884, -1.1100856969603225e-16, -6.7973144778085889e-33], [0.78361162489122438, 0.78361162489122449, 4.7982373409884725e-17], [1.511240500779959e-16, 1.1081941875543881, 6.7857323231109146e-17], [-0.7836116248912246, 0.78361162489122449, 4.7982373409884725e-17], [-1.1081941875543877, 6.7857323231109122e-17, 4.1550626846842558e-33], [-0.78361162489122438, -0.78361162489122449, -4.7982373409884725e-17], type = "nurbsCurve")
		nodeList[24] = mc.createNode("multMatrix",	n=f"mxm_opm_{nodeList[29]}", skipSelect = True)
		# Dynamic Attributes for nodeList[25] : c_rigCoreManip ========================== 
		mc.addAttr(nodeList[25], ln='jointTranslateMatrix', at='matrix'                            	, hidden = False, readable = True, writable = True, keyable = False)
		
		getJointTranslate = mc.getAttr(f'{nodeList[29]}.translate')[0] # get child joint translate 
		mc.setAttr(f'{nodeList[25]}.jointTranslateMatrix', 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, *getJointTranslate, 1.0, type='matrix') # dynamic attribute setAttr
	
		returnControls.add(nodeList[25]) # control for child joint

		nodeList[27] = mc.createNode("decomposeMatrix",	n=f"dmx_driver_{nodeList[29]}", skipSelect = True)
		nodeList[28] = mc.createNode("multMatrix",	n=f"mxm_logic_{nodeList[29]}", skipSelect = True)
		nodeList[30] = mc.createNode("pickMatrix",	n=f"pmx_logicTrans_{nodeList[29]}", skipSelect = True)
		mc.setAttr(f'{nodeList[30]}.useRotate', False) # pmx_logicTrans_rigCore.useRotate
		mc.setAttr(f'{nodeList[30]}.useScale', False) # pmx_logicTrans_rigCore.useScale
		mc.setAttr(f'{nodeList[30]}.useShear', False) # pmx_logicTrans_rigCore.useShear
		nodeList[31] = mc.createNode("pickMatrix",	n=f"pmx_logicRotScale_{nodeList[29]}", skipSelect = True)
		mc.setAttr(f'{nodeList[31]}.useTranslate', False) # pmx_logicRotScale_rigCore.useTranslate
		mc.setAttr(f'{nodeList[31]}.useShear', False) # pmx_logicRotScale_rigCore.useShear
		nodeList[32] = mc.createNode("composeMatrix",	n=f"cmx_jointOrient_{nodeList[29]}", skipSelect = True)
		nodeList[33] = mc.createNode("inverseMatrix",	n=f"imx_jointOrientInverse_{nodeList[29]}", skipSelect = True)
		nodeList[34] = mc.createNode("multMatrix",	n=f"mxm_driver_{nodeList[29]}", skipSelect = True)
		
#		mc.parent(nodeList[25], nodeList[1], r=True ) # child: c_rigCoreManip -> parent: g_rootMotion 

		mc.connectAttr(f"{nodeList[12]}.scale", f"{nodeList[29]}.inverseScale",	 f=True) # root.scale -> rigCore.inverseScale
		
		mc.connectAttr(f"{nodeList[28]}.matrixSum", f"{nodeList[31]}.inputMatrix",	 f=True) # mxm_logic_rigCore.matrixSum -> pmx_logicRotScale_rigCore.inputMatrix
		mc.connectAttr(f"{nodeList[29]}.jointOrient", f"{nodeList[32]}.inputRotate",	 f=True) # rigCore.jointOrient -> cmx_jointOrient_rigCore.inputRotate
		mc.connectAttr(f"{nodeList[32]}.outputMatrix", f"{nodeList[33]}.inputMatrix",	 f=True) # cmx_jointOrient_rigCore.outputMatrix -> imx_jointOrientInverse_rigCore.inputMatrix

		mc.connectAttr(f"{nodeList[25]}.jointTranslateMatrix", 	f"{nodeList[24]}.matrixIn[0]",	 f=True) # c_rigCoreManip.jointTranslateMatrix -> mxm_opm_rigCoreManip.matrixIn[0]
		mc.connectAttr(f"{nodeList[14]}.matrixSum", 			f"{nodeList[24]}.matrixIn[1]",	 f=True) # mxm_opmFrom_worldManip.matrixSum -> mxm_opm_rigCoreManip.matrixIn[1]
		mc.connectAttr(f"{nodeList[24]}.matrixSum", f"{nodeList[25]}.offsetParentMatrix",	 f=True) # mxm_opm_rigCoreManip.matrixSum -> c_rigCoreManip.offsetParentMatrix
		
		mc.connectAttr(f"{nodeList[33]}.inputMatrix", 			f"{nodeList[28]}.matrixIn[0]",	 f=True) # imx_jointOrientInverse_rigCore.inputMatrix -> mxm_logic_rigCore.matrixIn[0]
		mc.connectAttr(f"{nodeList[25]}.matrix", 				f"{nodeList[28]}.matrixIn[1]",	 f=True) # c_rigCoreManip.matrix -> mxm_logic_rigCore.matrixIn[1]
		mc.connectAttr(f"{nodeList[25]}.jointTranslateMatrix", 	f"{nodeList[28]}.matrixIn[2]",	 f=True) # c_rigCoreManip.jointTranslateMatrix -> mxm_logic_rigCore.matrixIn[2]
		mc.connectAttr(f"{nodeList[19]}.matrixSum", 			f"{nodeList[28]}.matrixIn[3]",	 f=True) # mxm_offsetTransformFrom_worldManip.matrixSum -> mxm_logic_rigCore.matrixIn[3]
		mc.connectAttr(f"{nodeList[28]}.matrixSum", f"{nodeList[30]}.inputMatrix",	 f=True) # mxm_logic_rigCore.matrixSum -> pmx_logicTrans_rigCore.inputMatrix
		
		mc.connectAttr(f"{nodeList[31]}.outputMatrix", f"{nodeList[34]}.matrixIn[0]",	 f=True) # pmx_logicRotScale_rigCore.outputMatrix -> mxm_driver_rigCore.matrixIn[0]
		mc.connectAttr(f"{nodeList[33]}.outputMatrix", f"{nodeList[34]}.matrixIn[1]",	 f=True) # imx_jointOrientInverse_rigCore.outputMatrix -> mxm_driver_rigCore.matrixIn[1]
		mc.connectAttr(f"{nodeList[30]}.outputMatrix", f"{nodeList[34]}.matrixIn[2]",	 f=True) # pmx_logicTrans_rigCore.outputMatrix -> mxm_driver_rigCore.matrixIn[2]
		mc.connectAttr(f"{nodeList[34]}.matrixSum", f"{nodeList[27]}.inputMatrix",	 f=True) # mxm_driver_rigCore.matrixSum -> dmx_driver_rigCore.inputMatrix
		
		mc.connectAttr(f"{nodeList[27]}.outputTranslate", 	f"{nodeList[29]}.translate",	 f=True) # dmx_driver_rigCore.outputTranslate -> rigCore.translate
		mc.connectAttr(f"{nodeList[27]}.outputRotate", 		f"{nodeList[29]}.rotate",	 f=True) # dmx_driver_rigCore.outputRotate -> rigCore.rotate
		mc.connectAttr(f"{nodeList[27]}.outputScale", 		f"{nodeList[29]}.scale",	 f=True) # dmx_driver_rigCore.outputScale -> rigCore.scale

		pass

	# end of script
	return [returnNodeDG,returnControls]