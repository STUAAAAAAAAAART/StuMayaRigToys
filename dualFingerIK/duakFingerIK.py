# scripterStu: start print
# date created: UTC 0800 2025.05.29 1755HRS 

import maya.cmds as mc
import maya.api.OpenMaya as om2

# activeSelection = om2.MGlobal.getActiveSelectionList()

# duplicateHierarchySelection ==============================================================================================
def dupHierSelLite(start:str, end:str) -> str:
	oldParent = mc.ls(start,long=True)[0]
	oldTarget = mc.ls(end,long=True)[0]
	toDelete = []
	while True:
		loopAround = False
		checkList = mc.listRelatives(checker, ad=False, f=True)
		try:
			getTarget = checkList.index(oldTarget)
			fillList = checkList.copy()
			del fillList[getTarget]
			toDelete.extend(fillList)
			fillList  = mc.listRelatives(oldTarget, ad=False, f=True)
			if fillList != None:
				toDelete.extend(fillList)
			break
		except:
			for item in checkList:
				childEnum = mc.listRelatives(item, ad=True, f=True)
				try:
					childEnum.index(oldTarget)
					getTarget = checkList.index(item)
					fillList = checkList.copy()
					del fillList[getTarget]
					toDelete.extend(fillList)
					checker = item
					loopAround = True
				except:
					pass
		if loopAround:
			continue
		else:
			raise ValueError(f"DupHierSection - crawl failed, troubleshoot: {start, end}")
	newParent = mc.ls(
		mc.duplicate(oldParent)[0],
		long=True
		)[0]
	for i in range(len(toDelete)):
		toDelete[i] = toDelete[i].replace(oldParent,newParent,1)
	return newParent
# orient3Point ==============================================================================================
def orient3Point(position, forward, other, flip=False):
	try:
		assert mc.nodeType(position) == "joint" # test if type is joint
	except:
		raise AssertionError(f"input object not a joint: {position}")
	p0 = om2.MVector( mc.getAttr(f"{position}.worldMatrix")[-4:-1] )
	p1 = om2.MVector( mc.getAttr(f"{forward }.worldMatrix")[-4:-1] )
	p2 = om2.MVector( mc.getAttr(f"{other   }.worldMatrix")[-4:-1] )
	vFwd = (p1-p0).normal() # forward vector
	vPln = (p2-p0).normal() # coplanar vector
	vNrm = None
	if flip: vNrm = (vPln ^ vFwd).normal() # planar normal
	else: vNrm = (vFwd ^ vPln).normal() # planar normal
	qFwd = om2.MQuaternion( om2.MVector(1,0,0), vFwd, 1) # initial forward quaternion
	qFwdZ = om2.MQuaternion( om2.MVector(1,0,0), om2.MVector(0,0,1), 1) * qFwd # "z-axis" of initial forward quaternion
	alignPlane = om2.MPlane().setPlane(vFwd, 0) # plane perpendicular to triangle z-axis
	vFwdZ = (om2.MVector(1,0,0).rotateBy(qFwdZ)).normal() # point on plane relative to space = space vector - rejection vector
	planeFwdZ = (vFwdZ - (alignPlane.distanceToPoint(vFwdZ) * alignPlane.normal())).normal() # initial normal from x-axis alignment
	planeNrm = (vNrm - (alignPlane.distanceToPoint(vNrm) * alignPlane.normal())).normal() # correct normal from plane
	# ==== final result =============
	qAlign = om2.MQuaternion(planeFwdZ, planeNrm, 1) # realignment rotation adjustment
	qOrient = qFwd * qAlign # coplanar joint orient - result
	getEuler = qOrient.asEulerRotation()
	orient = [getEuler.x, getEuler.y, getEuler.z]
	angleUnit = mc.currentUnit(q=True, angle=True)
	if angleUnit == 'deg': # result in radians, convert to scene units
		for i in range(3):
			orient[i] = om2.MAngle(orient[i],om2.MAngle.kRadians).asDegrees()
	# ==== parent handler =============
	getParentName = mc.listRelatives(position, p=True, f=True)
	if getParentName: # if not None, contains [string]
		getParentName = getParentName[0] # unpack string from list
	getChildrenNames = mc.listRelatives(position, c=True, f=True) or [] # just relative names, two nodes with a common parent can not have the same name
	holdSelf : om2.MSelectionList = om2.MSelectionList().add(position) # true pointer to object, not a bare string of temporary name
	mslChildren : om2.MSelectionList = om2.MSelectionList()
	for node in getChildrenNames:
		mslChildren.add(node)
	# ==== run =============
	activeSelection = om2.MGlobal.getActiveSelectionList() # selection sanitisation: gets real current selection, for some reason this script will select the last joint at times 
	if getChildrenNames: # if not []
		mc.parent(*getChildrenNames, w=True) # unparent children
	if getParentName: # if not None
		mc.parent(holdSelf.getSelectionStrings(0), w=True) # unparent from parent
	mc.joint(holdSelf.getSelectionStrings(0), e=True, o=orient) # apply orient of this joint
	if getParentName: # if not None
		mc.parent(holdSelf.getSelectionStrings(0), getParentName) # reparent to parent
		mc.rename(holdSelf.getSelectionStrings(0), position.split("|")[-1]) # reassert name
	if getChildrenNames: # if not []
		mc.parent(*mslChildren.getSelectionStrings(), holdSelf.getSelectionStrings(0)) # reparent children
		for i in range(len(getChildrenNames)): # reassert names
			mc.rename(mslChildren.getSelectionStrings(i), getChildrenNames[i].split("|")[-1])
	mc.select(activeSelection.getSelectionStrings()) # reassert original scene selection
	return orient
# ===========================================================================================================================

# rigGroup: the group to hold the DAG utility nodes in this rigging operation
# controlGroup: the main group wehre all other control groups reside
# handName: the group wehre the finger controllers reside
# fingerList: the unrigged finger joints - this script will enumerate the FK and IK and curl joints
# return: name of holdMatrix node for connection to offsetParentMatrix offset of hand IK controller 
def fingerDualIK(rigGroup:str, controlGroup:str, handName:str, fingerList:str) -> str:
	jointList = [None] * 15
	nodeList = [None] * 120



	# nodeList[109] = mc.createNode("transform",	n=f"rigRoot",  skipSelect = True) # 
	nodeList[109] = "rigRoot"

	# jointList[4] = "jFinger0" # incoming: ['root', 'dmx_driver_jFinger0'] - outgoing: ['jFinger1', 'curl_jFinger0', 'ikDriver_jFinger0', 'cmx_fingerBaseOffset0', 'mxm_fingerBaseOffset0', 'mxm_fkOPM_jFinger0', 'mxm_handKnuckleRoll0', 'mxm_ikOffsetOPM_jFinger0', 'c_finger0_fingerBlend']
	# jointList[6] = "jFinger1" # incoming: ['jFinger0', 'dmx_driver_jFinger1'] - outgoing: ['jFinger2', 'curl_jFinger1', 'ikDriver_jFinger1', 'mxm_ikOffsetOPM_jFinger1', 'mxm_fkOPM_jFinger1']
	# jointList[8] = "jFinger2" # incoming: ['jFinger1', 'dmx_driver_jFinger2'] - outgoing: ['jFinger3', 'curl_jFinger2', 'ikDriver_jFinger2', 'mxm_ikOffsetOPM_jFinger2', 'mxm_fkOPM_jFinger2']
	# jointList[11] = "jFinger3" # incoming: ['jFinger2', 'dmx_driver_jFinger3'] - outgoing: ['curl_jFinger3', 'ikDriver_jFinger3', 'mxm_ikOffsetOPM_jFinger3', 'mxm_fkOPM_jFinger3']
	
	# nodeList[26] = mc.createNode("transform",	n=f"g_controls", p=nodeList[109],  skipSelect = True) # parent: rigRoot
	# nodeList[27] = mc.createNode("transform",	n=f"r_fingerLogic", p=nodeList[109],  skipSelect = True) # parent: rigRoot
	# nodeList[119] = mc.createNode("transform",	n=handName, p=nodeList[26],  skipSelect = True) # parent: g_controls

	jointList[4] = fingerList[0]
	jointList[6] = fingerList[1] 
	jointList[8] = fingerList[2] 
	jointList[11] = fingerList[3] 

	nodeList[26] = controlGroup # "g_controls"
	nodeList[27] = rigGroup # "r_fingerLogic"
	nodeList[119] = handName
	if not mc.objExists(nodeList[26]):
		nodeList[26] = mc.createNode("transform",	n=nodeList[26], p=nodeList[109],  skipSelect = True) # parent: rigRoot
	if not mc.objExists(nodeList[27]):
		nodeList[27] = mc.createNode("transform",	n=nodeList[27], p=nodeList[109],  skipSelect = True) # parent: rigRoot
	if not mc.objExists(nodeList[119]):
		nodeList[119] = mc.createNode("transform",	n=nodeList[119], p=nodeList[26],  skipSelect = True) # parent: g_controls

	# IK DRIVERS
	ikDriverJointsMSL : om2.MSelectionList = om2.MSelectionList()
	ikDriverJointsMSL.add( dupHierSelLite(fingerList[0], fingerList[-1]) )
	getDriverIK = mc.listRelatives(ikDriverJointsMSL.getSelectionStrings(0), ad=True)
	for node in getDriverIK:
		ikDriverJointsMSL.add(node)
	del getDriverIK

	# CURL DRIVERS
	fkCurlMSL : om2.MSelectionList = om2.MSelectionList()
	dupForCurls = mc.duplicate(ikDriverJointsMSL[0])
	for node in dupForCurls:
		fkCurlMSL.add(node)
	del dupForCurls
	# reparent to group

	# Advanced Finger IK joints
	ikAdvFingerMSL : om2.MSelectionList = om2.MSelectionList()
	ikAdvFingerMSL.add(mc.duplicate(ikDriverJointsMSL.getSelectionStrings(1), po=True)) # at medial, parent: ik root
	ikAdvFingerMSL.add(mc.duplicate(ikDriverJointsMSL.getSelectionStrings(3), po=True)) # at fingertip
	mc.parent(ikAdvFingerMSL.getSelectionStrings(1), ikAdvFingerMSL.getSelectionStrings(0)) # make chain for advanced IK
	mc.parent(ikAdvFingerMSL.getSelectionStrings(0), ikDriverJointsMSL.getSelectionStrings(0)) # put advanced IK into main ik driver chain
	for i in range(2): # renames
		mc.rename(ikAdvFingerMSL.getSelectionStrings(i), f"{fingerList[0]}_ikDualFinger{i}")	
	orient3Point(ikAdvFingerMSL.getSelectionStrings(0),ikAdvFingerMSL.getSelectionStrings(1),ikAdvFingerMSL.getSelectionStrings(0)) # align advanced finger joint at medial point
	mc.setAttr(f"{ikAdvFingerMSL.getSelectionStrings(1)}.jointOrient", 0,0,0) # reset advanced finger joint at fingertip

	for i in range(4): # rename ik driver and curl joints
		mc.rename(ikDriverJointsMSL.getSelectionStrings(i), f"ikDriver_{fingerList[i]}") # rename ik Driver Joints 
		mc.rename(fkCurlMSL.getSelectionStrings(i),         f"curl_{fingerList[i]}") # rename curl Driver joints


	# list of joints
	# jointList[5] = "root" # incoming: ['nurbsCircle2'] - outgoing: ['jFinger0']

	jointList[0] = ikDriverJointsMSL.getSelectionStrings(0) # "ikDriver_jFinger0" # incoming: ['mxm_fingerBaseOffset0', 'jFinger0'] - outgoing: ['ikh_primary_finger0', 'mxm_restPose_jFingerIKDriver0', 'ikHandle6_poleVectorConstraint1', 'aim_noFlip0', 'mxm_noFlip0', 'mxm_aimAxisZ', 'cmx_restPose_jFingerIKDriver0', 'jFingerIkBase1', 'ikDriver_jFinger1', 'cmx_ikDriver_jFinger0'] # IK joint : ikh_secondary_finger0
	jointList[1] = ikDriverJointsMSL.getSelectionStrings(1) # "ikDriver_jFinger1" # incoming: ['ikDriver_jFinger0', 'jFinger1'] - outgoing: ['ikh_secondary_finger0', 'ikHandle5_poleVectorConstraint1', 'add_pmdFinger0', 'ikDriver_jFinger2', 'cmx_ikDriver_jFinger1']
	jointList[2] = ikDriverJointsMSL.getSelectionStrings(2) # "ikDriver_jFinger2" # incoming: ['ikDriver_jFinger1', 'jFinger2'] - outgoing: ['ikDriver_jFinger3', 'add_mdFinger0', 'cmx_ikDriver_jFinger2']
	jointList[3] = ikDriverJointsMSL.getSelectionStrings(3) # "ikDriver_jFinger3" # incoming: ['ikDriver_jFinger2', 'jFinger3'] - outgoing: ['add_mdFinger0', 'effector5', 'cmx_ikDriver_jFinger3'] # IK joint : ikh_secondary_finger0
	jointList[13] = ikAdvFingerMSL.getSelectionStrings(0) # "jFingerIkBase1" # incoming: ['ikDriver_jFinger0'] - outgoing: ['jFingerIkBase2'] # IK joint : ikh_primary_finger0
	jointList[14] = ikAdvFingerMSL.getSelectionStrings(1) # "jFingerIkBase2" # incoming: ['jFingerIkBase1', 'netLerp0', 'add_mdFinger0', 'dbt_hFloor2'] - outgoing: ['effector6']
	
	jointList[10] = fkCurlMSL.getSelectionStrings(0) # "curl_jFinger0" # incoming: ['mxm_fingerBaseOffset0', 'jFinger0'] - outgoing: ['curl_jFinger1', 'cmx_curl_jFinger0']
	jointList[7] = fkCurlMSL.getSelectionStrings(1) # "curl_jFinger1" # incoming: ['curl_jFinger0', 'jFinger1'] - outgoing: ['curl_jFinger2', 'mxm_lengthCurlTipBase_finger0', 'cmx_curl_jFinger1']
	jointList[9] = fkCurlMSL.getSelectionStrings(2) # "curl_jFinger2" # incoming: ['curl_jFinger1', 'jFinger2'] - outgoing: ['curl_jFinger3', 'mxm_lengthCurlTipMed_finger0', 'cmx_curl_jFinger2']
	jointList[12] = fkCurlMSL.getSelectionStrings(3) # "curl_jFinger3" # incoming: ['curl_jFinger2', 'jFinger3'] - outgoing: ['mxm_lengthCurlTipMed_finger0', 'cmx_curl_jFinger3']


	# create nodes
	# nodeList[19] = jointList[5] # joint - root, parent: 
	nodeList[18] = jointList[4] # joint - jFinger0, parent: root
	nodeList[25] = jointList[6] # joint - jFinger1, parent: jFinger0
	nodeList[41] = jointList[8] # joint - jFinger2, parent: jFinger1
	nodeList[51] = jointList[11] # joint - jFinger3, parent: jFinger2

	nodeList[0] = jointList[0] # joint - ikDriver_jFinger0, parent: r_fingerLogic
	nodeList[8] = jointList[1] # joint - ikDriver_jFinger1, parent: ikDriver_jFinger0
	nodeList[9] = jointList[2] # joint - ikDriver_jFinger2, parent: ikDriver_jFinger1
	nodeList[10] = jointList[3] # joint - ikDriver_jFinger3, parent: ikDriver_jFinger2
	nodeList[77] = jointList[13] # joint - jFingerIkBase1, parent: ikDriver_jFinger0
	nodeList[80] = jointList[14] # joint - jFingerIkBase2, parent: jFingerIkBase1

	nodeList[50] = jointList[10] # joint - curl_jFinger0, parent: r_fingerClosed
	nodeList[40] = jointList[7] # joint - curl_jFinger1, parent: curl_jFinger0
	nodeList[49] = jointList[9] # joint - curl_jFinger2, parent: curl_jFinger1
	nodeList[57] = jointList[12] # joint - curl_jFinger3, parent: curl_jFinger2

	# nodeList[16] = mc.createNode("transform",	n=f"nurbsCircle2", p=nodeList[119],  skipSelect = True) # parent of shape: g_controls
	# nodeList[17] = mc.createNode("nurbsCurve",	n=f"{nodeList[16]}Shape", p=nodeList[16], skipSelect = True) # transform: nurbsCircle2
	# mc.setAttr(nodeList[17]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [4.7982373409884725e-17, 0.7836116248912246, -0.7836116248912246], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.7836116248912246], [-6.7857323231109146e-17, 5.7448982375248304e-17, 1.1081941875543881], [-4.7982373409884725e-17, -0.7836116248912246, 0.7836116248912246], [-6.7973144778085889e-33, -1.1081941875543884, 1.1100856969603225e-16], [4.7982373409884725e-17, -0.78361162489122438, -0.7836116248912246], [6.7857323231109146e-17, -1.511240500779959e-16, -1.1081941875543881], [4.7982373409884725e-17, 0.7836116248912246, -0.7836116248912246], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.7836116248912246], type = "nurbsCurve")

	nodeList[20] = mc.createNode("transform",	n=f"c_fingerBlendIK_{jointList[4]}", p=nodeList[119],  skipSelect = True) # parent of shape: g_controls
	nodeList[21] = mc.createNode("nurbsCurve",	n=f"{nodeList[20]}Shape", p=nodeList[20], skipSelect = True) # transform: c_{jointList[4]}_fingerBlend
	mc.setAttr(nodeList[21]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [1.7547923106721823, 1.398973189111048, -1.5014744976391721e-17], [2.0000017047088221, 1.5005422457423141, -1.3002109345137845e-33], [2.2452110987454641, 1.398973189111048, 1.5014744976391721e-17], [2.3467801553767278, 1.1537637950744073, 2.1234055981186456e-17], [2.2452110987454641, 0.90855440103776608, 1.5014744976391721e-17], [2.0000017047088221, 0.80698534440650149, 2.1270299102713017e-33], [1.7547923106721823, 0.9085544010377663, -1.5014744976391721e-17], [1.6532232540409173, 1.1537637950744071, -2.1234055981186456e-17], [1.7547923106721823, 1.398973189111048, -1.5014744976391721e-17], [2.0000017047088221, 1.5005422457423141, -1.3002109345137845e-33], [2.2452110987454641, 1.398973189111048, 1.5014744976391721e-17], type = "nurbsCurve")
	nodeList[23] = mc.createNode("transform",	n=f"j{jointList[8]}_ikOffset", p=nodeList[119],  skipSelect = True) # parent of shape: g_controls
	nodeList[24] = mc.createNode("nurbsCurve",	n=f"{nodeList[23]}Shape", p=nodeList[23], skipSelect = True) # transform: j{jointList[8]}_ikOffset
	mc.setAttr(nodeList[24]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], [-6.7857323231109146e-17, 5.7448982375248304e-17, 1.1081941875543881], [-4.7982373409884725e-17, -0.78361162489122449, 0.78361162489122449], [-6.7973144778085889e-33, -1.1081941875543884, 1.1100856969603225e-16], [4.7982373409884725e-17, -0.78361162489122438, -0.78361162489122449], [6.7857323231109146e-17, -1.511240500779959e-16, -1.1081941875543881], [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], type = "nurbsCurve")
	nodeList[45] = mc.createNode("transform",	n=f"c_handKnuckle_{jointList[4]}", p=nodeList[119],  skipSelect = True) # parent of shape: g_controls
	nodeList[46] = mc.createNode("nurbsCurve",	n=f"{nodeList[45]}Shape", p=nodeList[45], skipSelect = True) # transform: c_handKnuckle_{jointList[4]}
	mc.setAttr(nodeList[46]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [-0.7836116248912246, 0.7836116248912246, -4.7982373409884725e-17], [-6.7857323231109122e-17, 1.1081941875543877, -4.1550626846842558e-33], [0.7836116248912246, 0.78361162489122438, 4.7982373409884725e-17], [1.1081941875543881, 5.7448982375248304e-17, 6.7857323231109146e-17], [0.7836116248912246, -0.7836116248912246, 4.7982373409884725e-17], [1.1100856969603225e-16, -1.1081941875543884, 6.7973144778085889e-33], [-0.7836116248912246, -0.78361162489122438, -4.7982373409884725e-17], [-1.1081941875543881, -1.511240500779959e-16, -6.7857323231109146e-17], [-0.7836116248912246, 0.7836116248912246, -4.7982373409884725e-17], [-6.7857323231109122e-17, 1.1081941875543877, -4.1550626846842558e-33], [0.7836116248912246, 0.78361162489122438, 4.7982373409884725e-17], type = "nurbsCurve")
	nodeList[36] = mc.createNode("transform",	n=f"c_j{jointList[4]}_FK", p=nodeList[119],  skipSelect = True) # parent of shape: g_controls
	nodeList[37] = mc.createNode("nurbsCurve",	n=f"{nodeList[36]}Shape", p=nodeList[36], skipSelect = True) # transform: c_j{jointList[4]}_FK
	mc.setAttr(nodeList[37]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], [-6.7857323231109146e-17, 5.7448982375248304e-17, 1.1081941875543881], [-4.7982373409884725e-17, -0.78361162489122449, 0.78361162489122449], [-6.7973144778085889e-33, -1.1081941875543884, 1.1100856969603225e-16], [4.7982373409884725e-17, -0.78361162489122438, -0.78361162489122449], [6.7857323231109146e-17, -1.511240500779959e-16, -1.1081941875543881], [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], type = "nurbsCurve")
	nodeList[14] = mc.createNode("transform",	n=f"c_j{jointList[6]}_FK", p=nodeList[119],  skipSelect = True) # parent of shape: g_controls
	nodeList[15] = mc.createNode("nurbsCurve",	n=f"{nodeList[14]}Shape", p=nodeList[14], skipSelect = True) # transform: c_j{jointList[6]}_FK
	mc.setAttr(nodeList[15]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], [-6.7857323231109146e-17, 5.7448982375248304e-17, 1.1081941875543881], [-4.7982373409884725e-17, -0.78361162489122449, 0.78361162489122449], [-6.7973144778085889e-33, -1.1081941875543884, 1.1100856969603225e-16], [4.7982373409884725e-17, -0.78361162489122438, -0.78361162489122449], [6.7857323231109146e-17, -1.511240500779959e-16, -1.1081941875543881], [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], type = "nurbsCurve")
	nodeList[38] = mc.createNode("transform",	n=f"c_j{jointList[8]}_FK", p=nodeList[119],  skipSelect = True) # parent of shape: g_controls
	nodeList[39] = mc.createNode("nurbsCurve",	n=f"{nodeList[38]}Shape", p=nodeList[38], skipSelect = True) # transform: c_j{jointList[8]}_FK
	mc.setAttr(nodeList[39]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], [-6.7857323231109146e-17, 5.7448982375248304e-17, 1.1081941875543881], [-4.7982373409884725e-17, -0.78361162489122449, 0.78361162489122449], [-6.7973144778085889e-33, -1.1081941875543884, 1.1100856969603225e-16], [4.7982373409884725e-17, -0.78361162489122438, -0.78361162489122449], [6.7857323231109146e-17, -1.511240500779959e-16, -1.1081941875543881], [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], type = "nurbsCurve")
	nodeList[47] = mc.createNode("transform",	n=f"c_j{jointList[11]}_FK", p=nodeList[119],  skipSelect = True) # parent of shape: g_controls
	nodeList[48] = mc.createNode("nurbsCurve",	n=f"{nodeList[47]}Shape", p=nodeList[47], skipSelect = True) # transform: c_j{jointList[11]}_FK
	mc.setAttr(nodeList[48]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], [-6.7857323231109146e-17, 5.7448982375248304e-17, 1.1081941875543881], [-4.7982373409884725e-17, -0.78361162489122449, 0.78361162489122449], [-6.7973144778085889e-33, -1.1081941875543884, 1.1100856969603225e-16], [4.7982373409884725e-17, -0.78361162489122438, -0.78361162489122449], [6.7857323231109146e-17, -1.511240500779959e-16, -1.1081941875543881], [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], type = "nurbsCurve")
	nodeList[54] = mc.createNode("transform",	n=f"c_{jointList[4]}_IK", p=nodeList[109],  skipSelect = True) # parent of shape: rigRoot
	nodeList[55] = mc.createNode("nurbsCurve",	n=f"{nodeList[54]}Shape", p=nodeList[54], skipSelect = True) # transform: c_{jointList[4]}_IK
	mc.setAttr(nodeList[55]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [4.7982373409884725e-17, 0.7836116248912246, -0.7836116248912246], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.7836116248912246], [-6.7857323231109146e-17, 5.7448982375248304e-17, 1.1081941875543881], [-4.7982373409884725e-17, -0.7836116248912246, 0.7836116248912246], [-6.7973144778085889e-33, -1.1081941875543884, 1.1100856969603225e-16], [4.7982373409884725e-17, -0.78361162489122438, -0.7836116248912246], [6.7857323231109146e-17, -1.511240500779959e-16, -1.1081941875543881], [4.7982373409884725e-17, 0.7836116248912246, -0.7836116248912246], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.7836116248912246], type = "nurbsCurve")
	nodeList[63] = mc.createNode("transform",	n=f"j{jointList[11]}_ikOffset", p=nodeList[119],  skipSelect = True) # parent of shape: g_controls
	nodeList[64] = mc.createNode("nurbsCurve",	n=f"{nodeList[63]}Shape", p=nodeList[63], skipSelect = True) # transform: j{jointList[11]}_ikOffset
	mc.setAttr(nodeList[64]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], [-6.7857323231109146e-17, 5.7448982375248304e-17, 1.1081941875543881], [-4.7982373409884725e-17, -0.78361162489122449, 0.78361162489122449], [-6.7973144778085889e-33, -1.1081941875543884, 1.1100856969603225e-16], [4.7982373409884725e-17, -0.78361162489122438, -0.78361162489122449], [6.7857323231109146e-17, -1.511240500779959e-16, -1.1081941875543881], [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], type = "nurbsCurve")
	nodeList[65] = mc.createNode("transform",	n=f"j{jointList[6]}_ikOffset", p=nodeList[119],  skipSelect = True) # parent of shape: g_controls
	nodeList[66] = mc.createNode("nurbsCurve",	n=f"{nodeList[65]}Shape", p=nodeList[65], skipSelect = True) # transform: j{jointList[6]}_ikOffset
	mc.setAttr(nodeList[66]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], [-6.7857323231109146e-17, 5.7448982375248304e-17, 1.1081941875543881], [-4.7982373409884725e-17, -0.78361162489122449, 0.78361162489122449], [-6.7973144778085889e-33, -1.1081941875543884, 1.1100856969603225e-16], [4.7982373409884725e-17, -0.78361162489122438, -0.78361162489122449], [6.7857323231109146e-17, -1.511240500779959e-16, -1.1081941875543881], [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], type = "nurbsCurve")
	nodeList[67] = mc.createNode("transform",	n=f"j{jointList[4]}_ikOffset", p=nodeList[119],  skipSelect = True) # parent of shape: g_controls
	nodeList[68] = mc.createNode("nurbsCurve",	n=f"{nodeList[67]}Shape", p=nodeList[67], skipSelect = True) # transform: j{jointList[4]}_ikOffset
	mc.setAttr(nodeList[68]+".cc", 3, 8, 2, False, 3, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 13, 11, [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], [-6.7857323231109146e-17, 5.7448982375248304e-17, 1.1081941875543881], [-4.7982373409884725e-17, -0.78361162489122449, 0.78361162489122449], [-6.7973144778085889e-33, -1.1081941875543884, 1.1100856969603225e-16], [4.7982373409884725e-17, -0.78361162489122438, -0.78361162489122449], [6.7857323231109146e-17, -1.511240500779959e-16, -1.1081941875543881], [4.7982373409884725e-17, 0.7836116248912246, -0.78361162489122449], [4.1550626846842558e-33, 1.1081941875543877, -6.7857323231109122e-17], [-4.7982373409884725e-17, 0.78361162489122438, 0.78361162489122449], type = "nurbsCurve")
	nodeList[95] = mc.createNode("transform",	n=f"locNoFlipPvEnd_{jointList[4]}", p=nodeList[77],  skipSelect = True) # parent of shape: jFingerIkBase1
	nodeList[56] = mc.createNode("locator",	n=f"{nodeList[95]}Shape", p=nodeList[95], skipSelect = True)
	nodeList[96] = mc.createNode("transform",	n=f"locNoFlipPvBase_{jointList[4]}", p=nodeList[27],  skipSelect = True) # parent of shape: r_fingerLogic
	nodeList[97] = mc.createNode("locator",	n=f"{nodeList[96]}Shape", p=nodeList[96], skipSelect = True) # transform: locNoFlipPvBase
	# check maya scene for shape node type, might be polymesh or NURBS surface

	nodeList[22] = mc.createNode("floatCondition",	n=f"visibility_fkik_{jointList[4]}", skipSelect = True)
	nodeList[1] = mc.createNode("composeMatrix",	n=f"cmx_translate_{jointList[4]}", skipSelect = True) #

	nodeList[53] = mc.createNode("holdMatrix",	n=f"hmx_ikHandControlOffsetAnnotate_{jointList[4]}", skipSelect = True)
	nodeList[58] = mc.createNode("multMatrix",	n=f"mxm_opmControllerIK_{jointList[4]}", skipSelect = True)
	nodeList[2] = mc.createNode("blendMatrix",	n=f"bmx_curl_j{jointList[4]}", skipSelect = True)
	nodeList[3] = mc.createNode("blendMatrix",	n=f"bmx_ikDriver_j{jointList[4]}", skipSelect = True)
	nodeList[4] = mc.createNode("multMatrix",	n=f"mxm_ikDriver_j{jointList[4]}", skipSelect = True)
	nodeList[5] = mc.createNode("decomposeMatrix",	n=f"dmx_driver_j{jointList[4]}", skipSelect = True)
	nodeList[7] = mc.createNode("multMatrix",	n=f"mxm_fingerBaseOffset0", skipSelect = True)
	nodeList[52] = mc.createNode("composeMatrix",	n=f"cmx_splayKnuckle_{jointList[4]}", skipSelect = True)
	nodeList[59] = mc.createNode("multMatrix",	n=f"mxm_lengthCurlTipBase_{jointList[4]}", skipSelect = True)
	nodeList[60] = mc.createNode("multMatrix",	n=f"mxm_restPose_jFingerIKDriver0", skipSelect = True)
	nodeList[61] = mc.createNode("addDoubleLinear",	n=f"add_md{jointList[4]}", skipSelect = True)
	nodeList[62] = mc.createNode("multMatrix",	n=f"mxm_lengthCurlTipMed_{jointList[4]}", skipSelect = True)
	nodeList[69] = mc.createNode("composeMatrix",	n=f"cmx_restPose_jFingerIKDriver0", skipSelect = True)
	nodeList[98] = mc.createNode("composeMatrix",	n=f"cmx_fkDriver_j{jointList[4]}", skipSelect = True)
	nodeList[103] = mc.createNode("composeMatrix",	n=f"cmx_ikOffset_j{jointList[4]}", skipSelect = True)
	nodeList[106] = mc.createNode("composeMatrix",	n=f"cmx_ikDriver_j{jointList[4]}", skipSelect = True)
	nodeList[110] = mc.createNode("multMatrix",	n=f"mxm_ikOffsetOPM_j{jointList[4]}", skipSelect = True)
	nodeList[113] = mc.createNode("multMatrix",	n=f"mxm_fkOPM_j{jointList[4]}", skipSelect = True)
	nodeList[93] = mc.createNode("composeMatrix",	n=f"cmx_curl_j{jointList[4]}", skipSelect = True)

	nodeList[6] = mc.createNode("decomposeMatrix",	n=f"dmx_driver_j{jointList[6]}", skipSelect = True)
	nodeList[11] = mc.createNode("blendMatrix",	n=f"bmx_curl_j{jointList[6]}", skipSelect = True)
	nodeList[12] = mc.createNode("blendMatrix",	n=f"bmx_ikDriver_j{jointList[6]}", skipSelect = True)
	nodeList[13] = mc.createNode("composeMatrix",	n=f"cmx_fkDriver_j{jointList[6]}", skipSelect = True)
	nodeList[86] = mc.createNode("composeMatrix",	n=f"cmx_ikOffset_j{jointList[6]}", skipSelect = True)
	nodeList[87] = mc.createNode("composeMatrix",	n=f"cmx_ikDriver_j{jointList[6]}", skipSelect = True)
	nodeList[105] = mc.createNode("multMatrix",	n=f"mxm_ikDriver_j{jointList[6]}", skipSelect = True)
	nodeList[117] = mc.createNode("multMatrix",	n=f"mxm_ikOffsetOPM_j{jointList[6]}", skipSelect = True)
	nodeList[118] = mc.createNode("multMatrix",	n=f"mxm_fkOPM_j{jointList[6]}", skipSelect = True)
	nodeList[107] = mc.createNode("composeMatrix",	n=f"cmx_curl_j{jointList[6]}", skipSelect = True)

	nodeList[28] = mc.createNode("composeMatrix",	n=f"cmx_ikOffset_j{jointList[8]}", skipSelect = True)
	nodeList[29] = mc.createNode("multMatrix",	n=f"mxm_ikDriver_j{jointList[8]}", skipSelect = True)
	nodeList[30] = mc.createNode("composeMatrix",	n=f"cmx_ikDriver_j{jointList[8]}", skipSelect = True)
	nodeList[31] = mc.createNode("blendMatrix",	n=f"bmx_ikDriver_j{jointList[8]}", skipSelect = True)
	nodeList[34] = mc.createNode("blendMatrix",	n=f"bmx_curl_j{jointList[8]}", skipSelect = True)
	nodeList[43] = mc.createNode("decomposeMatrix",	n=f"dmx_driver_j{jointList[8]}", skipSelect = True)
	nodeList[114] = mc.createNode("multMatrix",	n=f"mxm_ikOffsetOPM_j{jointList[8]}", skipSelect = True)
	nodeList[102] = mc.createNode("composeMatrix",	n=f"cmx_fkDriver_j{jointList[8]}", skipSelect = True)
	nodeList[79] = mc.createNode("multMatrix",	n=f"mxm_fkOPM_j{jointList[8]}", skipSelect = True)

	nodeList[32] = mc.createNode("multMatrix",	n=f"mxm_ikDriver_j{jointList[11]}", skipSelect = True)
	nodeList[33] = mc.createNode("composeMatrix",	n=f"cmx_ikDriver_j{jointList[11]}", skipSelect = True)
	nodeList[35] = mc.createNode("blendMatrix",	n=f"bmx_ikDriver_j{jointList[11]}", skipSelect = True)
	nodeList[42] = mc.createNode("blendMatrix",	n=f"bmx_curl_j{jointList[11]}", skipSelect = True)
	nodeList[44] = mc.createNode("decomposeMatrix",	n=f"dmx_driver_j{jointList[11]}", skipSelect = True)
	nodeList[108] = mc.createNode("composeMatrix",	n=f"cmx_curl_j{jointList[8]}", skipSelect = True)
	nodeList[82] = mc.createNode("multMatrix",	n=f"mxm_fkOPM_j{jointList[11]}", skipSelect = True)
	nodeList[100] = mc.createNode("composeMatrix",	n=f"cmx_ikOffset_j{jointList[11]}", skipSelect = True)
	nodeList[101] = mc.createNode("composeMatrix",	n=f"cmx_fkDriver_j{jointList[11]}", skipSelect = True)
	nodeList[83] = mc.createNode("multMatrix",	n=f"mxm_ikOffsetOPM_j{jointList[11]}", skipSelect = True)

	nodeList[70] = mc.createNode("distanceBetween",	n=f"dbt_hFloor1_{jointList[4]}", skipSelect = True)
	nodeList[71] = mc.createNode("distanceBetween",	n=f"dbt_ikLength_{jointList[4]}", skipSelect = True)
	nodeList[72] = mc.createNode("addDoubleLinear",	n=f"pmd_add_{jointList[4]}", skipSelect = True)
	nodeList[73] = mc.createNode("distanceBetween",	n=f"dbt_hFloor2_{jointList[4]}", skipSelect = True)

	nodeList[74] = mc.createNode("network",	n=f"netInvLerp_{jointList[4]}", skipSelect = True)
	nodeList[76] = mc.createNode("aimMatrix",	n=f"aim_noFlip_{jointList[4]}", skipSelect = True)
	nodeList[81] = mc.createNode("pickMatrix",	n=f"pmx_noFlip_{jointList[4]}", skipSelect = True)
	nodeList[84] = mc.createNode("multMatrix",	n=f"mxm_noFlip_{jointList[4]}", skipSelect = True)

	nodeList[75] = mc.createNode("multMatrix",	n=f"mxm_aimAxisZ_{jointList[4]}", skipSelect = True)

	nodeList[78] = mc.createNode("network",	n=f"netLerp_{jointList[4]}", skipSelect = True)
	nodeList[85] = mc.createNode("plusMinusAverage",	n=f"pma_netLerpDiff_{jointList[4]}", skipSelect = True)
	nodeList[92] = mc.createNode("plusMinusAverage",	n=f"pma_netInvLerpDiffs_{jointList[4]}", skipSelect = True)
	nodeList[94] = mc.createNode("composeMatrix",	n=f"cmx_curl_{jointList[11]}", skipSelect = True)
	nodeList[99] = mc.createNode("multDoubleLinear",	n=f"multDL_netLerpK_{jointList[4]}", skipSelect = True)
	nodeList[104] = mc.createNode("multiplyDivide",	n=f"divide_netInvLerp_{jointList[4]}", skipSelect = True)
	nodeList[111] = mc.createNode("multMatrix",	n=f"mxm_handKnuckleRoll_{jointList[4]}", skipSelect = True)
	nodeList[115] = mc.createNode("addDoubleLinear",	n=f"adl_netLerpResult_{jointList[4]}", skipSelect = True)

	nodeList[88] = f'ikh_primary_{jointList[4]}' # ikhandle, ikRPsolver
	nodeList[89] = f'ike_primary_{jointList[4]}' # ikEffector
	nodeList[112] = f'pvc_primary_{jointList[4]}' # poleVectorConstraint

	nodeList[90] = f'ikh_secondary_{jointList[4]}' # ikhandle, ikRPsolver
	nodeList[91] = f'ike_secondary_{jointList[4]}' # ikEffector
	nodeList[116] = f'pvc_secondary_{jointList[4]}' # poleVectorConstraint
	# complex node creation (e.g. ikHandles, constraints)
	nodeList[88], stuTempEffector = mc.ikHandle(n=nodeList[88], sj=nodeList[0], ee=nodeList[80], solver='ikRPsolver')
	# ikHandle: ikh_primary_finger0 ; start/end joints: ['ikDriver_jFinger0', 'jFingerIkBase2'] ; ikSolver_ ikRPsolver
	nodeList[89] = mc.rename(stuTempEffector, nodeList[89]) # ikEffector node - effector6

	nodeList[90], stuTempEffector = mc.ikHandle(n=nodeList[90], sj=nodeList[8], ee=nodeList[10], solver='ikRPsolver')
	# ikHandle: ikh_secondary_finger0 ; start/end joints: ['ikDriver_jFinger1', 'ikDriver_jFinger3'] ; ikSolver_ ikRPsolver
	nodeList[91] = mc.rename(stuTempEffector, nodeList[91]) # ikEffector node - effector5

	nodeList[112] = mc.poleVectorConstraint(nodeList[96], nodeList[88], n=nodeList[112], mo=False ) # ikHandle6_poleVectorConstraint1
	nodeList[116] = mc.poleVectorConstraint(nodeList[95], nodeList[90], n=nodeList[116], mo=False ) # ikHandle5_poleVectorConstraint1

	# reparent new DAG nodes; use r=True to move to parent (clears transform)
	# !!! DOUBLE-CHECK AND EDIT BEFORE RUNNING SCRIPT !!!
	# mc.parent(nodeList[119], nodeList[109], r=True ) # child: g_controls -> parent: rigRoot 
	# mc.parent(nodeList[27], nodeList[109], r=True ) # child: r_fingerLogic -> parent: rigRoot 
	mc.parent(nodeList[54], nodeList[109], r=True ) # child: c_finger0_IK -> parent: rigRoot

	mc.parent(nodeList[95], nodeList[77], r=True ) # child: locNoFlipPvEnd -> parent: jFingerIkBase1 

	# mc.parent(nodeList[16], nodeList[119], r=True ) # child: nurbsCircle2 -> parent: handName 
	mc.parent(nodeList[45], nodeList[119], r=True ) # child: c_handKnuckle_finger0 -> parent: handName 
	mc.parent(nodeList[20], nodeList[119], r=True ) # child: c_finger0_fingerBlend -> parent: handName 
	mc.parent(nodeList[36], nodeList[119], r=True ) # child: c_jFinger0_FK -> parent: handName 
	mc.parent(nodeList[14], nodeList[119], r=True ) # child: c_jFinger1_FK -> parent: handName 
	mc.parent(nodeList[38], nodeList[119], r=True ) # child: c_jFinger2_FK -> parent: handName 
	mc.parent(nodeList[47], nodeList[119], r=True ) # child: c_jFinger3_FK -> parent: handName 
	mc.parent(nodeList[67], nodeList[119], r=True ) # child: jFinger0_ikOffset -> parent: handName 
	mc.parent(nodeList[65], nodeList[119], r=True ) # child: jFinger1_ikOffset -> parent: handName 
	mc.parent(nodeList[23], nodeList[119], r=True ) # child: jFinger2_ikOffset -> parent: handName 
	mc.parent(nodeList[63], nodeList[119], r=True ) # child: jFinger3_ikOffset -> parent: handName 

	mc.parent(nodeList[88], nodeList[27], r=True ) # child: ikh_primary_finger0 -> parent: r_fingerLogic 
	mc.parent(nodeList[90], nodeList[27], r=True ) # child: ikh_secondary_finger0 -> parent: r_fingerLogic 
	mc.parent(nodeList[96], nodeList[27], r=True ) # child: locNoFlipPvBase -> parent: r_fingerLogic 

	# custom attributes
	# Dynamic Attributes for nodeList[20] : c_finger0_fingerBlend ========================== 
	mc.addAttr(nodeList[20], ln='blendFinger', at='double2'                   	, hidden = False, readable = True, writable = True, keyable = True)
	mc.addAttr(nodeList[20], ln='curlBlend', at='double', p='blendFinger'  	, hasMinValue = True, minValue = 0.0, hasMaxValue = True, maxValue = 1.0, defaultValue = 0.0, hidden = False, readable = True, writable = True, keyable = True)
	mc.setAttr(f'{nodeList[20]}.curlBlend', 1.0, type='double') # dynamic attribute setAttr
	mc.addAttr(nodeList[20], ln='fkikBlend', at='double', p='blendFinger'  	, hasMinValue = True, minValue = 0.0, hasMaxValue = True, maxValue = 1.0, defaultValue = 0.0, hidden = False, readable = True, writable = True, keyable = True)
	mc.setAttr(f'{nodeList[20]}.fkikBlend', 1.0, type='double') # dynamic attribute setAttr
	mc.connectAttr(f"{nodeList[20]}.fkikBlend", f"{nodeList[31]}.target[0].weight",	 f=True) # c_finger0_fingerBlend.fkikBlend -> bmx_ikDriver_jFinger2.target[0].weight
	mc.connectAttr(f"{nodeList[20]}.fkikBlend", f"{nodeList[22]}.condition",	 f=True) # c_finger0_fingerBlend.fkikBlend -> visibility_fkik_finger.condition
	mc.connectAttr(f"{nodeList[20]}.fkikBlend", f"{nodeList[35]}.target[0].weight",	 f=True) # c_finger0_fingerBlend.fkikBlend -> bmx_ikDriver_jFinger3.target[0].weight
	mc.connectAttr(f"{nodeList[20]}.fkikBlend", f"{nodeList[3]}.target[0].weight",	 f=True) # c_finger0_fingerBlend.fkikBlend -> bmx_ikDriver_jFinger0.target[0].weight
	mc.connectAttr(f"{nodeList[20]}.fkikBlend", f"{nodeList[12]}.target[0].weight",	 f=True) # c_finger0_fingerBlend.fkikBlend -> bmx_ikDriver_jFinger1.target[0].weight
	mc.connectAttr(f"{nodeList[20]}.curlBlend", f"{nodeList[2]}.target[0].weight",	 f=True) # c_finger0_fingerBlend.curlBlend -> bmx_curl_jFinger0.target[0].weight
	mc.connectAttr(f"{nodeList[20]}.curlBlend", f"{nodeList[11]}.target[0].weight",	 f=True) # c_finger0_fingerBlend.curlBlend -> bmx_curl_jFinger1.target[0].weight
	mc.connectAttr(f"{nodeList[20]}.curlBlend", f"{nodeList[34]}.target[0].weight",	 f=True) # c_finger0_fingerBlend.curlBlend -> bmx_curl_jFinger2.target[0].weight
	# Dynamic Attributes for nodeList[54] : c_finger0_IK ========================== 
	mc.addAttr(nodeList[54], ln='restOffset', at='matrix'                  	, hidden = False, readable = True, writable = True, keyable = False)
	mc.setAttr(f'{nodeList[54]}.restOffset', 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 12.0, 0.0, 0.0, 1.0, type='matrix') # dynamic attribute setAttr
	mc.connectAttr(f"{nodeList[54]}.restOffset", f"{nodeList[58]}.matrixIn[0]",	 f=True) # c_finger0_IK.restOffset -> mxm_opm_finger0_IK.matrixIn[0]
	# Dynamic Attributes for nodeList[74] : netInvLerp0 ========================== 
	mc.addAttr(nodeList[74], ln='A', at='double'         	, defaultValue = 0.0, hidden = False, readable = True, writable = True, keyable = False)
	mc.addAttr(nodeList[74], ln='B', at='double'         	, defaultValue = 0.0, hidden = False, readable = True, writable = True, keyable = False)
	mc.addAttr(nodeList[74], ln='V', at='double'         	, defaultValue = 0.0, hidden = False, readable = True, writable = True, keyable = False)
	mc.addAttr(nodeList[74], ln='zResult', at='double'               	, defaultValue = 0.0, hidden = False, readable = True, writable = True, keyable = False)
	mc.connectAttr(f"{nodeList[70]}.distance", f"{nodeList[74]}.A",	 f=True) # dbt_hFloor1.distance -> netInvLerp0.A
	mc.connectAttr(f"{nodeList[71]}.distance", f"{nodeList[74]}.V",	 f=True) # dbt_ikLengthFinger0.distance -> netInvLerp0.V
	mc.connectAttr(f"{nodeList[72]}.output", f"{nodeList[74]}.B",	 f=True) # add_pmdFinger0.output -> netInvLerp0.B
	mc.connectAttr(f"{nodeList[74]}.A", f"{nodeList[92]}.input2D[1].input2Dx",	 f=True) # netInvLerp0.A -> netInvLerp0_pma_diffs.input2D[1].input2Dx
	mc.connectAttr(f"{nodeList[74]}.A", f"{nodeList[92]}.input2D[1].input2Dy",	 f=True) # netInvLerp0.A -> netInvLerp0_pma_diffs.input2D[1].input2Dy
	mc.connectAttr(f"{nodeList[74]}.B", f"{nodeList[92]}.input2D[0].input2Dy",	 f=True) # netInvLerp0.B -> netInvLerp0_pma_diffs.input2D[0].input2Dy
	mc.connectAttr(f"{nodeList[74]}.V", f"{nodeList[92]}.input2D[0].input2Dx",	 f=True) # netInvLerp0.V -> netInvLerp0_pma_diffs.input2D[0].input2Dx
	mc.connectAttr(f"{nodeList[104]}.outputX", f"{nodeList[74]}.zResult",	 f=True) # netInvLerp0_divide.outputX -> netInvLerp0.zResult
	# Dynamic Attributes for nodeList[75] : mxm_aimAxisZ ========================== 
	mc.addAttr(nodeList[75], ln='offsetZ', at='matrix'               	, hidden = False, readable = True, writable = True, keyable = False)
	mc.setAttr(f'{nodeList[75]}.offsetZ', 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 1.0, type='matrix') # dynamic attribute setAttr
	mc.connectAttr(f"{nodeList[75]}.offsetZ", f"{nodeList[75]}.matrixIn[0]",	 f=True) # mxm_aimAxisZ.offsetZ -> mxm_aimAxisZ.matrixIn[0]
	# Dynamic Attributes for nodeList[78] : netLerp0 ========================== 
	mc.addAttr(nodeList[78], ln='A', at='double'         	, defaultValue = 0.0, hidden = False, readable = True, writable = True, keyable = False)
	mc.addAttr(nodeList[78], ln='B', at='double'         	, defaultValue = 0.0, hidden = False, readable = True, writable = True, keyable = False)
	mc.addAttr(nodeList[78], ln='t', at='double'         	, defaultValue = 0.0, hidden = False, readable = True, writable = True, keyable = False)
	mc.addAttr(nodeList[78], ln='zResult', at='double'               	, defaultValue = 0.0, hidden = False, readable = True, writable = True, keyable = False)
	mc.connectAttr(f"{nodeList[61]}.output", f"{nodeList[78]}.B",	 f=True) # add_mdFinger0.output -> netLerp0.B
	mc.connectAttr(f"{nodeList[73]}.distance", f"{nodeList[78]}.A",	 f=True) # dbt_hFloor2.distance -> netLerp0.A
	mc.connectAttr(f"{nodeList[74]}.zResult", f"{nodeList[78]}.t",	 f=True) # netInvLerp0.zResult -> netLerp0.t
	mc.connectAttr(f"{nodeList[78]}.A", f"{nodeList[85]}.input1D[1]",	 f=True) # netLerp0.A -> netLerp0_pma_diff.input1D[1]
	mc.connectAttr(f"{nodeList[78]}.A", f"{nodeList[115]}.input1",	 f=True) # netLerp0.A -> netLerp0_adl_result.input1
	mc.connectAttr(f"{nodeList[78]}.B", f"{nodeList[85]}.input1D[0]",	 f=True) # netLerp0.B -> netLerp0_pma_diff.input1D[0]
	mc.connectAttr(f"{nodeList[78]}.t", f"{nodeList[99]}.input1",	 f=True) # netLerp0.t -> netLerp0_multDL_K.input1
	mc.connectAttr(f"{nodeList[78]}.zResult", f"{nodeList[80]}.translateX",	 f=True) # netLerp0.zResult -> jFingerIkBase2.translateX
	mc.connectAttr(f"{nodeList[115]}.output", f"{nodeList[78]}.zResult",	 f=True) # netLerp0_adl_result.output -> netLerp0.zResult
	# Dynamic Attributes for nodeList[84] : mxm_noFlip0 ========================== 
	mc.addAttr(nodeList[84], ln='offsetY', at='matrix'               	, hidden = False, readable = True, writable = True, keyable = False)
	mc.setAttr(f'{nodeList[84]}.offsetY', 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 2.0, 0.0, 1.0, type='matrix') # dynamic attribute setAttr
	mc.connectAttr(f"{nodeList[84]}.offsetY", f"{nodeList[84]}.matrixIn[0]",	 f=True) # mxm_noFlip0.offsetY -> mxm_noFlip0.matrixIn[0]

	# write attributes
	mc.color(f'{nodeList[20]}', rgb=(1.0, 0.0, 0.0)) # c_finger0_fingerBlend - wireframe colour
	mc.color(f'{nodeList[45]}', rgb=(0.0, 0.5, 0.5)) # c_handKnuckle_finger0 - wireframe colour
	mc.color(f'{nodeList[54]}', rgb=(1.0, 1.0, 0.0)) # c_finger0_IK - wireframe colour

	mc.setAttr(f'{nodeList[20]}.translateX', lock=True) # c_finger0_fingerBlend.translateX
	mc.setAttr(f'{nodeList[20]}.translateX', keyable=False, channelBox=False) # c_finger0_fingerBlend.translateX
	mc.setAttr(f'{nodeList[20]}.translateY', lock=True) # c_finger0_fingerBlend.translateY
	mc.setAttr(f'{nodeList[20]}.translateY', keyable=False, channelBox=False) # c_finger0_fingerBlend.translateY
	mc.setAttr(f'{nodeList[20]}.translateZ', lock=True) # c_finger0_fingerBlend.translateZ
	mc.setAttr(f'{nodeList[20]}.translateZ', keyable=False, channelBox=False) # c_finger0_fingerBlend.translateZ
	mc.setAttr(f'{nodeList[20]}.rotateX', lock=True) # c_finger0_fingerBlend.rotateX
	mc.setAttr(f'{nodeList[20]}.rotateX', keyable=False, channelBox=False) # c_finger0_fingerBlend.rotateX
	mc.setAttr(f'{nodeList[20]}.rotateY', lock=True) # c_finger0_fingerBlend.rotateY
	mc.setAttr(f'{nodeList[20]}.rotateY', keyable=False, channelBox=False) # c_finger0_fingerBlend.rotateY
	mc.setAttr(f'{nodeList[20]}.rotateZ', lock=True) # c_finger0_fingerBlend.rotateZ
	mc.setAttr(f'{nodeList[20]}.rotateZ', keyable=False, channelBox=False) # c_finger0_fingerBlend.rotateZ
	mc.setAttr(f'{nodeList[20]}.scaleX', lock=True) # c_finger0_fingerBlend.scaleX
	mc.setAttr(f'{nodeList[20]}.scaleX', keyable=False, channelBox=False) # c_finger0_fingerBlend.scaleX
	mc.setAttr(f'{nodeList[20]}.scaleY', lock=True) # c_finger0_fingerBlend.scaleY
	mc.setAttr(f'{nodeList[20]}.scaleY', keyable=False, channelBox=False) # c_finger0_fingerBlend.scaleY
	mc.setAttr(f'{nodeList[20]}.scaleZ', lock=True) # c_finger0_fingerBlend.scaleZ
	mc.setAttr(f'{nodeList[20]}.scaleZ', keyable=False, channelBox=False) # c_finger0_fingerBlend.scaleZ
	mc.setAttr(f'{nodeList[22]}.floatA', 0.0 , type='float') # visibility_fkik_finger.floatA
	mc.setAttr(f'{nodeList[26]}.translateX', lock=True) # g_controls.translateX
	mc.setAttr(f'{nodeList[26]}.translateX', keyable=False, channelBox=False) # g_controls.translateX
	mc.setAttr(f'{nodeList[26]}.translateY', lock=True) # g_controls.translateY
	mc.setAttr(f'{nodeList[26]}.translateY', keyable=False, channelBox=False) # g_controls.translateY
	mc.setAttr(f'{nodeList[26]}.translateZ', lock=True) # g_controls.translateZ
	mc.setAttr(f'{nodeList[26]}.translateZ', keyable=False, channelBox=False) # g_controls.translateZ
	mc.setAttr(f'{nodeList[26]}.rotateX', lock=True) # g_controls.rotateX
	mc.setAttr(f'{nodeList[26]}.rotateX', keyable=False, channelBox=False) # g_controls.rotateX
	mc.setAttr(f'{nodeList[26]}.rotateY', lock=True) # g_controls.rotateY
	mc.setAttr(f'{nodeList[26]}.rotateY', keyable=False, channelBox=False) # g_controls.rotateY
	mc.setAttr(f'{nodeList[26]}.rotateZ', lock=True) # g_controls.rotateZ
	mc.setAttr(f'{nodeList[26]}.rotateZ', keyable=False, channelBox=False) # g_controls.rotateZ
	mc.setAttr(f'{nodeList[26]}.scaleX', lock=True) # g_controls.scaleX
	mc.setAttr(f'{nodeList[26]}.scaleX', keyable=False, channelBox=False) # g_controls.scaleX
	mc.setAttr(f'{nodeList[26]}.scaleY', lock=True) # g_controls.scaleY
	mc.setAttr(f'{nodeList[26]}.scaleY', keyable=False, channelBox=False) # g_controls.scaleY
	mc.setAttr(f'{nodeList[26]}.scaleZ', lock=True) # g_controls.scaleZ
	mc.setAttr(f'{nodeList[26]}.scaleZ', keyable=False, channelBox=False) # g_controls.scaleZ
	mc.setAttr(f'{nodeList[119]}.translateX', lock=True) # {handName}.translateX
	mc.setAttr(f'{nodeList[119]}.translateX', keyable=False, channelBox=False) # {handName}.translateX
	mc.setAttr(f'{nodeList[119]}.translateY', lock=True) # {handName}.translateY
	mc.setAttr(f'{nodeList[119]}.translateY', keyable=False, channelBox=False) # {handName}.translateY
	mc.setAttr(f'{nodeList[119]}.translateZ', lock=True) # {handName}.translateZ
	mc.setAttr(f'{nodeList[119]}.translateZ', keyable=False, channelBox=False) # {handName}.translateZ
	mc.setAttr(f'{nodeList[119]}.rotateX', lock=True) # {handName}.rotateX
	mc.setAttr(f'{nodeList[119]}.rotateX', keyable=False, channelBox=False) # {handName}.rotateX
	mc.setAttr(f'{nodeList[119]}.rotateY', lock=True) # {handName}.rotateY
	mc.setAttr(f'{nodeList[119]}.rotateY', keyable=False, channelBox=False) # {handName}.rotateY
	mc.setAttr(f'{nodeList[119]}.rotateZ', lock=True) # {handName}.rotateZ
	mc.setAttr(f'{nodeList[119]}.rotateZ', keyable=False, channelBox=False) # {handName}.rotateZ
	mc.setAttr(f'{nodeList[119]}.scaleX', lock=True) # {handName}.scaleX
	mc.setAttr(f'{nodeList[119]}.scaleX', keyable=False, channelBox=False) # {handName}.scaleX
	mc.setAttr(f'{nodeList[119]}.scaleY', lock=True) # {handName}.scaleY
	mc.setAttr(f'{nodeList[119]}.scaleY', keyable=False, channelBox=False) # {handName}.scaleY
	mc.setAttr(f'{nodeList[119]}.scaleZ', lock=True) # {handName}.scaleZ
	mc.setAttr(f'{nodeList[119]}.scaleZ', keyable=False, channelBox=False) # {handName}.scaleZ
	mc.setAttr(f'{nodeList[27]}.translateX', lock=True) # r_fingerLogic.translateX
	mc.setAttr(f'{nodeList[27]}.translateX', keyable=False, channelBox=False) # r_fingerLogic.translateX
	mc.setAttr(f'{nodeList[27]}.translateY', lock=True) # r_fingerLogic.translateY
	mc.setAttr(f'{nodeList[27]}.translateY', keyable=False, channelBox=False) # r_fingerLogic.translateY
	mc.setAttr(f'{nodeList[27]}.translateZ', lock=True) # r_fingerLogic.translateZ
	mc.setAttr(f'{nodeList[27]}.translateZ', keyable=False, channelBox=False) # r_fingerLogic.translateZ
	mc.setAttr(f'{nodeList[27]}.rotateX', lock=True) # r_fingerLogic.rotateX
	mc.setAttr(f'{nodeList[27]}.rotateX', keyable=False, channelBox=False) # r_fingerLogic.rotateX
	mc.setAttr(f'{nodeList[27]}.rotateY', lock=True) # r_fingerLogic.rotateY
	mc.setAttr(f'{nodeList[27]}.rotateY', keyable=False, channelBox=False) # r_fingerLogic.rotateY
	mc.setAttr(f'{nodeList[27]}.rotateZ', lock=True) # r_fingerLogic.rotateZ
	mc.setAttr(f'{nodeList[27]}.rotateZ', keyable=False, channelBox=False) # r_fingerLogic.rotateZ
	mc.setAttr(f'{nodeList[27]}.scaleX', lock=True) # r_fingerLogic.scaleX
	mc.setAttr(f'{nodeList[27]}.scaleX', keyable=False, channelBox=False) # r_fingerLogic.scaleX
	mc.setAttr(f'{nodeList[27]}.scaleY', lock=True) # r_fingerLogic.scaleY
	mc.setAttr(f'{nodeList[27]}.scaleY', keyable=False, channelBox=False) # r_fingerLogic.scaleY
	mc.setAttr(f'{nodeList[27]}.scaleZ', lock=True) # r_fingerLogic.scaleZ
	mc.setAttr(f'{nodeList[27]}.scaleZ', keyable=False, channelBox=False) # r_fingerLogic.scaleZ
	mc.setAttr(f'{nodeList[36]}.translateX', lock=True) # c_jFinger0_FK.translateX
	mc.setAttr(f'{nodeList[36]}.translateX', keyable=False, channelBox=False) # c_jFinger0_FK.translateX
	mc.setAttr(f'{nodeList[36]}.translateY', lock=True) # c_jFinger0_FK.translateY
	mc.setAttr(f'{nodeList[36]}.translateY', keyable=False, channelBox=False) # c_jFinger0_FK.translateY
	mc.setAttr(f'{nodeList[36]}.translateZ', lock=True) # c_jFinger0_FK.translateZ
	mc.setAttr(f'{nodeList[36]}.translateZ', keyable=False, channelBox=False) # c_jFinger0_FK.translateZ
	mc.setAttr(f'{nodeList[45]}.translateX', lock=True) # c_handKnuckle_finger0.translateX
	mc.setAttr(f'{nodeList[45]}.translateX', keyable=False, channelBox=False) # c_handKnuckle_finger0.translateX
	mc.setAttr(f'{nodeList[45]}.translateY', lock=True) # c_handKnuckle_finger0.translateY
	mc.setAttr(f'{nodeList[45]}.translateY', keyable=False, channelBox=False) # c_handKnuckle_finger0.translateY
	mc.setAttr(f'{nodeList[45]}.translateZ', lock=True) # c_handKnuckle_finger0.translateZ
	mc.setAttr(f'{nodeList[45]}.translateZ', keyable=False, channelBox=False) # c_handKnuckle_finger0.translateZ
	mc.setAttr(f'{nodeList[45]}.rotateZ', lock=True) # c_handKnuckle_finger0.rotateZ
	mc.setAttr(f'{nodeList[45]}.rotateZ', keyable=False, channelBox=False) # c_handKnuckle_finger0.rotateZ
	mc.setAttr(f'{nodeList[45]}.scaleX', lock=True) # c_handKnuckle_finger0.scaleX
	mc.setAttr(f'{nodeList[45]}.scaleX', keyable=False, channelBox=False) # c_handKnuckle_finger0.scaleX
	mc.setAttr(f'{nodeList[45]}.scaleY', lock=True) # c_handKnuckle_finger0.scaleY
	mc.setAttr(f'{nodeList[45]}.scaleY', keyable=False, channelBox=False) # c_handKnuckle_finger0.scaleY
	mc.setAttr(f'{nodeList[45]}.scaleZ', lock=True) # c_handKnuckle_finger0.scaleZ
	mc.setAttr(f'{nodeList[45]}.scaleZ', keyable=False, channelBox=False) # c_handKnuckle_finger0.scaleZ
	mc.setAttr(f'{nodeList[67]}.translateX', lock=True) # jFinger0_ikOffset.translateX
	mc.setAttr(f'{nodeList[67]}.translateX', keyable=False, channelBox=False) # jFinger0_ikOffset.translateX
	mc.setAttr(f'{nodeList[67]}.translateY', lock=True) # jFinger0_ikOffset.translateY
	mc.setAttr(f'{nodeList[67]}.translateY', keyable=False, channelBox=False) # jFinger0_ikOffset.translateY
	mc.setAttr(f'{nodeList[67]}.translateZ', lock=True) # jFinger0_ikOffset.translateZ
	mc.setAttr(f'{nodeList[67]}.translateZ', keyable=False, channelBox=False) # jFinger0_ikOffset.translateZ
	mc.setAttr(f'{nodeList[76]}.secondaryMode', 1 , type='enum') # aim_noFlip0.secondaryMode
	mc.setAttr(f'{nodeList[76]}.secondaryInputAxisY', 0.0 , type='double') # aim_noFlip0.secondaryInputAxisY
	mc.setAttr(f'{nodeList[76]}.secondaryInputAxisZ', 1.0 , type='double') # aim_noFlip0.secondaryInputAxisZ
	mc.setAttr(f'{nodeList[81]}.useTranslate', False ) # pmx_noFlip0.useTranslate
	mc.setAttr(f'{nodeList[81]}.useScale', False ) # pmx_noFlip0.useScale
	mc.setAttr(f'{nodeList[81]}.useShear', False ) # pmx_noFlip0.useShear
	mc.setAttr(f'{nodeList[85]}.operation', 2 , type='enum') # netLerp0_pma_diff.operation
	mc.setAttr(f'{nodeList[92]}.operation', 2 , type='enum') # netInvLerp0_pma_diffs.operation
	mc.setAttr(f'{nodeList[95]}.translateY', 3.0 , type='doubleLinear') # locNoFlipPvEnd.translateY
	mc.setAttr(f'{nodeList[104]}.operation', 2 , type='enum') # netInvLerp0_divide.operation
	mc.setAttr(f'{nodeList[109]}.translateX', lock=True) # rigRoot.translateX
	mc.setAttr(f'{nodeList[109]}.translateX', keyable=False, channelBox=False) # rigRoot.translateX
	mc.setAttr(f'{nodeList[109]}.translateY', lock=True) # rigRoot.translateY
	mc.setAttr(f'{nodeList[109]}.translateY', keyable=False, channelBox=False) # rigRoot.translateY
	mc.setAttr(f'{nodeList[109]}.translateZ', lock=True) # rigRoot.translateZ
	mc.setAttr(f'{nodeList[109]}.translateZ', keyable=False, channelBox=False) # rigRoot.translateZ
	mc.setAttr(f'{nodeList[109]}.rotateX', lock=True) # rigRoot.rotateX
	mc.setAttr(f'{nodeList[109]}.rotateX', keyable=False, channelBox=False) # rigRoot.rotateX
	mc.setAttr(f'{nodeList[109]}.rotateY', lock=True) # rigRoot.rotateY
	mc.setAttr(f'{nodeList[109]}.rotateY', keyable=False, channelBox=False) # rigRoot.rotateY
	mc.setAttr(f'{nodeList[109]}.rotateZ', lock=True) # rigRoot.rotateZ
	mc.setAttr(f'{nodeList[109]}.rotateZ', keyable=False, channelBox=False) # rigRoot.rotateZ
	mc.setAttr(f'{nodeList[109]}.scaleX', lock=True) # rigRoot.scaleX
	mc.setAttr(f'{nodeList[109]}.scaleX', keyable=False, channelBox=False) # rigRoot.scaleX
	mc.setAttr(f'{nodeList[109]}.scaleY', lock=True) # rigRoot.scaleY
	mc.setAttr(f'{nodeList[109]}.scaleY', keyable=False, channelBox=False) # rigRoot.scaleY
	mc.setAttr(f'{nodeList[109]}.scaleZ', lock=True) # rigRoot.scaleZ
	mc.setAttr(f'{nodeList[109]}.scaleZ', keyable=False, channelBox=False) # rigRoot.scaleZ

	# connect attributes
	mc.connectAttr(f"{nodeList[0]}.parentMatrix", f"{nodeList[60]}.matrixIn[1]",	 f=True) # ikDriver_jFinger0.parentMatrix -> mxm_restPose_jFingerIKDriver0.matrixIn[1]
	mc.connectAttr(f"{nodeList[0]}.parentMatrix", f"{nodeList[76]}.inputMatrix",	 f=True) # ikDriver_jFinger0.parentMatrix -> aim_noFlip0.inputMatrix
	mc.connectAttr(f"{nodeList[0]}.parentMatrix", f"{nodeList[84]}.matrixIn[3]",	 f=True) # ikDriver_jFinger0.parentMatrix -> mxm_noFlip0.matrixIn[3]
	mc.connectAttr(f"{nodeList[0]}.parentMatrix", f"{nodeList[75]}.matrixIn[1]",	 f=True) # ikDriver_jFinger0.parentMatrix -> mxm_aimAxisZ.matrixIn[1]
	mc.connectAttr(f"{nodeList[0]}.translate", f"{nodeList[69]}.inputTranslate",	 f=True) # ikDriver_jFinger0.translate -> cmx_restPose_jFingerIKDriver0.inputTranslate
	mc.connectAttr(f"{nodeList[0]}.jointOrient", f"{nodeList[69]}.inputRotate",	 f=True) # ikDriver_jFinger0.jointOrient -> cmx_restPose_jFingerIKDriver0.inputRotate
	# mc.connectAttr(f"{nodeList[0]}.scale", f"{nodeList[77]}.inverseScale",	 f=True) # ikDriver_jFinger0.scale -> jFingerIkBase1.inverseScale
	# mc.connectAttr(f"{nodeList[0]}.scale", f"{nodeList[8]}.inverseScale",	 f=True) # ikDriver_jFinger0.scale -> ikDriver_jFinger1.inverseScale
	mc.connectAttr(f"{nodeList[0]}.scale", f"{nodeList[69]}.inputScale",	 f=True) # ikDriver_jFinger0.scale -> cmx_restPose_jFingerIKDriver0.inputScale
	mc.connectAttr(f"{nodeList[0]}.rotate", f"{nodeList[106]}.inputRotate",	 f=True) # ikDriver_jFinger0.rotate -> cmx_ikDriver_jFinger0.inputRotate
	mc.connectAttr(f"{nodeList[1]}.outputMatrix", f"{nodeList[7]}.matrixIn[0]",	 f=True) # cmx_fingerBaseOffset0.outputMatrix -> mxm_fingerBaseOffset0.matrixIn[0]
	mc.connectAttr(f"{nodeList[2]}.outputMatrix", f"{nodeList[5]}.inputMatrix",	 f=True) # bmx_curl_jFinger0.outputMatrix -> dmx_driver_jFinger0.inputMatrix
	mc.connectAttr(f"{nodeList[3]}.outputMatrix", f"{nodeList[2]}.target[0].targetMatrix",	 f=True) # bmx_ikDriver_jFinger0.outputMatrix -> bmx_curl_jFinger0.target[0].targetMatrix
	mc.connectAttr(f"{nodeList[4]}.matrixSum", f"{nodeList[3]}.target[0].targetMatrix",	 f=True) # mxm_ikDriver_jFinger0.matrixSum -> bmx_ikDriver_jFinger0.target[0].targetMatrix
	mc.connectAttr(f"{nodeList[5]}.outputRotate", f"{nodeList[18]}.rotate",	 f=True) # dmx_driver_jFinger0.outputRotate -> jFinger0.rotate
	mc.connectAttr(f"{nodeList[6]}.outputRotate", f"{nodeList[25]}.rotate",	 f=True) # dmx_driver_jFinger1.outputRotate -> jFinger1.rotate
	mc.connectAttr(f"{nodeList[7]}.matrixSum", f"{nodeList[50]}.offsetParentMatrix",	 f=True) # mxm_fingerBaseOffset0.matrixSum -> curl_jFinger0.offsetParentMatrix
	mc.connectAttr(f"{nodeList[7]}.matrixSum", f"{nodeList[0]}.offsetParentMatrix",	 f=True) # mxm_fingerBaseOffset0.matrixSum -> ikDriver_jFinger0.offsetParentMatrix
	mc.connectAttr(f"{nodeList[8]}.translateX", f"{nodeList[72]}.input1",	 f=True) # ikDriver_jFinger1.translateX -> add_pmdFinger0.input1
	# mc.connectAttr(f"{nodeList[8]}.scale", f"{nodeList[9]}.inverseScale",	 f=True) # ikDriver_jFinger1.scale -> ikDriver_jFinger2.inverseScale
	mc.connectAttr(f"{nodeList[8]}.rotate", f"{nodeList[87]}.inputRotate",	 f=True) # ikDriver_jFinger1.rotate -> cmx_ikDriver_jFinger1.inputRotate
	# mc.connectAttr(f"{nodeList[9]}.scale", f"{nodeList[10]}.inverseScale",	 f=True) # ikDriver_jFinger2.scale -> ikDriver_jFinger3.inverseScale
	mc.connectAttr(f"{nodeList[9]}.translateX", f"{nodeList[61]}.input1",	 f=True) # ikDriver_jFinger2.translateX -> add_mdFinger0.input1
	mc.connectAttr(f"{nodeList[9]}.rotate", f"{nodeList[30]}.inputRotate",	 f=True) # ikDriver_jFinger2.rotate -> cmx_ikDriver_jFinger2.inputRotate
	mc.connectAttr(f"{nodeList[10]}.translateX", f"{nodeList[61]}.input2",	 f=True) # ikDriver_jFinger3.translateX -> add_mdFinger0.input2
	mc.connectAttr(f"{nodeList[10]}.translateX", f"{nodeList[91]}.translateX",	 f=True) # ikDriver_jFinger3.translateX -> effector5.translateX
	mc.connectAttr(f"{nodeList[10]}.translateY", f"{nodeList[91]}.translateY",	 f=True) # ikDriver_jFinger3.translateY -> effector5.translateY
	mc.connectAttr(f"{nodeList[10]}.translateZ", f"{nodeList[91]}.translateZ",	 f=True) # ikDriver_jFinger3.translateZ -> effector5.translateZ
	mc.connectAttr(f"{nodeList[10]}.offsetParentMatrix", f"{nodeList[91]}.offsetParentMatrix",	 f=True) # ikDriver_jFinger3.offsetParentMatrix -> effector5.offsetParentMatrix
	mc.connectAttr(f"{nodeList[10]}.rotate", f"{nodeList[33]}.inputRotate",	 f=True) # ikDriver_jFinger3.rotate -> cmx_ikDriver_jFinger3.inputRotate
	mc.connectAttr(f"{nodeList[11]}.outputMatrix", f"{nodeList[6]}.inputMatrix",	 f=True) # bmx_curl_jFinger1.outputMatrix -> dmx_driver_jFinger1.inputMatrix
	mc.connectAttr(f"{nodeList[12]}.outputMatrix", f"{nodeList[11]}.target[0].targetMatrix",	 f=True) # bmx_ikDriver_jFinger1.outputMatrix -> bmx_curl_jFinger1.target[0].targetMatrix
	mc.connectAttr(f"{nodeList[13]}.outputMatrix", f"{nodeList[12]}.inputMatrix",	 f=True) # cmx_fkDriver_jFinger1.outputMatrix -> bmx_ikDriver_jFinger1.inputMatrix
	mc.connectAttr(f"{nodeList[14]}.inverseMatrix", f"{nodeList[118]}.matrixIn[0]",	 f=True) # c_jFinger1_FK.inverseMatrix -> mxm_fkOPM_jFinger1.matrixIn[0]
	mc.connectAttr(f"{nodeList[14]}.rotate", f"{nodeList[13]}.inputRotate",	 f=True) # c_jFinger1_FK.rotate -> cmx_fkDriver_jFinger1.inputRotate
	# mc.connectAttr(f"{nodeList[16]}.rotate", f"{nodeList[19]}.rotate",	 f=True) # nurbsCircle2.rotate -> root.rotate
	# mc.connectAttr(f"{nodeList[18]}.scale", f"{nodeList[25]}.inverseScale",	 f=True) # jFinger0.scale -> jFinger1.inverseScale
	mc.connectAttr(f"{nodeList[18]}.jointOrient", f"{nodeList[50]}.jointOrient",	 f=True) # jFinger0.jointOrient -> curl_jFinger0.jointOrient
	mc.connectAttr(f"{nodeList[18]}.jointOrient", f"{nodeList[0]}.jointOrient",	 f=True) # jFinger0.jointOrient -> ikDriver_jFinger0.jointOrient
	mc.connectAttr(f"{nodeList[18]}.translate", f"{nodeList[1]}.inputTranslate",	 f=True) # jFinger0.translate -> cmx_fingerBaseOffset0.inputTranslate
	mc.connectAttr(f"{nodeList[18]}.parentMatrix", f"{nodeList[7]}.matrixIn[1]",	 f=True) # jFinger0.parentMatrix -> mxm_fingerBaseOffset0.matrixIn[1]
	mc.connectAttr(f"{nodeList[18]}.worldMatrix", f"{nodeList[113]}.matrixIn[1]",	 f=True) # jFinger0.worldMatrix -> mxm_fkOPM_jFinger0.matrixIn[1]
	mc.connectAttr(f"{nodeList[18]}.worldMatrix", f"{nodeList[111]}.matrixIn[1]",	 f=True) # jFinger0.worldMatrix -> mxm_handKnuckleRoll0.matrixIn[1]
	mc.connectAttr(f"{nodeList[18]}.worldMatrix", f"{nodeList[110]}.matrixIn[1]",	 f=True) # jFinger0.worldMatrix -> mxm_ikOffsetOPM_jFinger0.matrixIn[1]
	mc.connectAttr(f"{nodeList[18]}.worldMatrix", f"{nodeList[20]}.offsetParentMatrix",	 f=True) # jFinger0.worldMatrix -> c_finger0_fingerBlend.offsetParentMatrix
	# mc.connectAttr(f"{nodeList[19]}.scale", f"{nodeList[18]}.inverseScale",	 f=True) # root.scale -> jFinger0.inverseScale
	mc.connectAttr(f"{nodeList[22]}.outFloat", f"{nodeList[14]}.visibility",	 f=True) # visibility_fkik_finger.outFloat -> c_jFinger1_FK.visibility
	mc.connectAttr(f"{nodeList[22]}.outFloat", f"{nodeList[36]}.visibility",	 f=True) # visibility_fkik_finger.outFloat -> c_jFinger0_FK.visibility
	mc.connectAttr(f"{nodeList[22]}.outFloat", f"{nodeList[38]}.visibility",	 f=True) # visibility_fkik_finger.outFloat -> c_jFinger2_FK.visibility
	mc.connectAttr(f"{nodeList[22]}.outFloat", f"{nodeList[47]}.visibility",	 f=True) # visibility_fkik_finger.outFloat -> c_jFinger3_FK.visibility
	mc.connectAttr(f"{nodeList[22]}.condition", f"{nodeList[65]}.visibility",	 f=True) # visibility_fkik_finger.condition -> jFinger1_ikOffset.visibility
	mc.connectAttr(f"{nodeList[22]}.condition", f"{nodeList[67]}.visibility",	 f=True) # visibility_fkik_finger.condition -> jFinger0_ikOffset.visibility
	mc.connectAttr(f"{nodeList[22]}.condition", f"{nodeList[23]}.visibility",	 f=True) # visibility_fkik_finger.condition -> jFinger2_ikOffset.visibility
	mc.connectAttr(f"{nodeList[22]}.condition", f"{nodeList[63]}.visibility",	 f=True) # visibility_fkik_finger.condition -> jFinger3_ikOffset.visibility
	mc.connectAttr(f"{nodeList[22]}.condition", f"{nodeList[54]}.visibility",	 f=True) # visibility_fkik_finger.condition -> c_finger0_IK.visibility
	mc.connectAttr(f"{nodeList[23]}.rotate", f"{nodeList[28]}.inputRotate",	 f=True) # jFinger2_ikOffset.rotate -> cmx_ikOffset_jFinger2.inputRotate
	mc.connectAttr(f"{nodeList[23]}.inverseMatrix", f"{nodeList[114]}.matrixIn[0]",	 f=True) # jFinger2_ikOffset.inverseMatrix -> mxm_ikOffsetOPM_jFinger2.matrixIn[0]
	# mc.connectAttr(f"{nodeList[25]}.scale", f"{nodeList[41]}.inverseScale",	 f=True) # jFinger1.scale -> jFinger2.inverseScale
	mc.connectAttr(f"{nodeList[25]}.jointOrient", f"{nodeList[40]}.jointOrient",	 f=True) # jFinger1.jointOrient -> curl_jFinger1.jointOrient
	mc.connectAttr(f"{nodeList[25]}.jointOrient", f"{nodeList[8]}.jointOrient",	 f=True) # jFinger1.jointOrient -> ikDriver_jFinger1.jointOrient
	mc.connectAttr(f"{nodeList[25]}.worldMatrix", f"{nodeList[117]}.matrixIn[1]",	 f=True) # jFinger1.worldMatrix -> mxm_ikOffsetOPM_jFinger1.matrixIn[1]
	mc.connectAttr(f"{nodeList[25]}.worldMatrix", f"{nodeList[118]}.matrixIn[1]",	 f=True) # jFinger1.worldMatrix -> mxm_fkOPM_jFinger1.matrixIn[1]
	mc.connectAttr(f"{nodeList[28]}.outputMatrix", f"{nodeList[29]}.matrixIn[0]",	 f=True) # cmx_ikOffset_jFinger2.outputMatrix -> mxm_ikDriver_jFinger2.matrixIn[0]
	mc.connectAttr(f"{nodeList[29]}.matrixSum", f"{nodeList[31]}.target[0].targetMatrix",	 f=True) # mxm_ikDriver_jFinger2.matrixSum -> bmx_ikDriver_jFinger2.target[0].targetMatrix
	mc.connectAttr(f"{nodeList[30]}.outputMatrix", f"{nodeList[29]}.matrixIn[1]",	 f=True) # cmx_ikDriver_jFinger2.outputMatrix -> mxm_ikDriver_jFinger2.matrixIn[1]
	mc.connectAttr(f"{nodeList[31]}.outputMatrix", f"{nodeList[34]}.target[0].targetMatrix",	 f=True) # bmx_ikDriver_jFinger2.outputMatrix -> bmx_curl_jFinger2.target[0].targetMatrix
	mc.connectAttr(f"{nodeList[32]}.matrixSum", f"{nodeList[35]}.target[0].targetMatrix",	 f=True) # mxm_ikDriver_jFinger3.matrixSum -> bmx_ikDriver_jFinger3.target[0].targetMatrix
	mc.connectAttr(f"{nodeList[33]}.outputMatrix", f"{nodeList[32]}.matrixIn[1]",	 f=True) # cmx_ikDriver_jFinger3.outputMatrix -> mxm_ikDriver_jFinger3.matrixIn[1]
	mc.connectAttr(f"{nodeList[34]}.outputMatrix", f"{nodeList[43]}.inputMatrix",	 f=True) # bmx_curl_jFinger2.outputMatrix -> dmx_driver_jFinger2.inputMatrix
	mc.connectAttr(f"{nodeList[35]}.outputMatrix", f"{nodeList[42]}.target[0].targetMatrix",	 f=True) # bmx_ikDriver_jFinger3.outputMatrix -> bmx_curl_jFinger3.target[0].targetMatrix
	mc.connectAttr(f"{nodeList[36]}.rotate", f"{nodeList[98]}.inputRotate",	 f=True) # c_jFinger0_FK.rotate -> cmx_fkDriver_jFinger0.inputRotate
	mc.connectAttr(f"{nodeList[36]}.inverseMatrix", f"{nodeList[113]}.matrixIn[0]",	 f=True) # c_jFinger0_FK.inverseMatrix -> mxm_fkOPM_jFinger0.matrixIn[0]
	mc.connectAttr(f"{nodeList[38]}.inverseMatrix", f"{nodeList[79]}.matrixIn[0]",	 f=True) # c_jFinger2_FK.inverseMatrix -> mxm_fkOPM_jFinger2.matrixIn[0]
	mc.connectAttr(f"{nodeList[38]}.rotate", f"{nodeList[102]}.inputRotate",	 f=True) # c_jFinger2_FK.rotate -> cmx_fkDriver_jFinger2.inputRotate
	# mc.connectAttr(f"{nodeList[40]}.scale", f"{nodeList[49]}.inverseScale",	 f=True) # curl_jFinger1.scale -> curl_jFinger2.inverseScale
	mc.connectAttr(f"{nodeList[40]}.matrix", f"{nodeList[59]}.matrixIn[1]",	 f=True) # curl_jFinger1.matrix -> mxm_lengthCurlTipBase_finger0.matrixIn[1]
	mc.connectAttr(f"{nodeList[40]}.rotate", f"{nodeList[107]}.inputRotate",	 f=True) # curl_jFinger1.rotate -> cmx_curl_jFinger1.inputRotate
	# mc.connectAttr(f"{nodeList[41]}.scale", f"{nodeList[51]}.inverseScale",	 f=True) # jFinger2.scale -> jFinger3.inverseScale
	mc.connectAttr(f"{nodeList[41]}.jointOrient", f"{nodeList[49]}.jointOrient",	 f=True) # jFinger2.jointOrient -> curl_jFinger2.jointOrient
	mc.connectAttr(f"{nodeList[41]}.jointOrient", f"{nodeList[9]}.jointOrient",	 f=True) # jFinger2.jointOrient -> ikDriver_jFinger2.jointOrient
	mc.connectAttr(f"{nodeList[41]}.worldMatrix", f"{nodeList[114]}.matrixIn[1]",	 f=True) # jFinger2.worldMatrix -> mxm_ikOffsetOPM_jFinger2.matrixIn[1]
	mc.connectAttr(f"{nodeList[41]}.worldMatrix", f"{nodeList[79]}.matrixIn[1]",	 f=True) # jFinger2.worldMatrix -> mxm_fkOPM_jFinger2.matrixIn[1]
	mc.connectAttr(f"{nodeList[42]}.outputMatrix", f"{nodeList[44]}.inputMatrix",	 f=True) # bmx_curl_jFinger3.outputMatrix -> dmx_driver_jFinger3.inputMatrix
	mc.connectAttr(f"{nodeList[43]}.outputRotate", f"{nodeList[41]}.rotate",	 f=True) # dmx_driver_jFinger2.outputRotate -> jFinger2.rotate
	mc.connectAttr(f"{nodeList[44]}.outputRotate", f"{nodeList[51]}.rotate",	 f=True) # dmx_driver_jFinger3.outputRotate -> jFinger3.rotate
	mc.connectAttr(f"{nodeList[45]}.rotateY", f"{nodeList[52]}.inputRotateY",	 f=True) # c_handKnuckle_finger0.rotateY -> cmx_splayKnuckle_finger0.inputRotateY
	mc.connectAttr(f"{nodeList[45]}.rotateY", f"{nodeList[36]}.rotateY",	 f=True) # c_handKnuckle_finger0.rotateY -> c_jFinger0_FK.rotateY
	mc.connectAttr(f"{nodeList[45]}.inverseMatrix", f"{nodeList[111]}.matrixIn[0]",	 f=True) # c_handKnuckle_finger0.inverseMatrix -> mxm_handKnuckleRoll0.matrixIn[0]
	mc.connectAttr(f"{nodeList[47]}.inverseMatrix", f"{nodeList[82]}.matrixIn[0]",	 f=True) # c_jFinger3_FK.inverseMatrix -> mxm_fkOPM_jFinger3.matrixIn[0]
	mc.connectAttr(f"{nodeList[47]}.rotate", f"{nodeList[101]}.inputRotate",	 f=True) # c_jFinger3_FK.rotate -> cmx_fkDriver_jFinger3.inputRotate
	# mc.connectAttr(f"{nodeList[49]}.scale", f"{nodeList[57]}.inverseScale",	 f=True) # curl_jFinger2.scale -> curl_jFinger3.inverseScale
	mc.connectAttr(f"{nodeList[49]}.matrix", f"{nodeList[62]}.matrixIn[1]",	 f=True) # curl_jFinger2.matrix -> mxm_lengthCurlTipMed_finger0.matrixIn[1]
	mc.connectAttr(f"{nodeList[49]}.rotate", f"{nodeList[108]}.inputRotate",	 f=True) # curl_jFinger2.rotate -> cmx_curl_jFinger2.inputRotate
	# mc.connectAttr(f"{nodeList[50]}.scale", f"{nodeList[40]}.inverseScale",	 f=True) # curl_jFinger0.scale -> curl_jFinger1.inverseScale
	mc.connectAttr(f"{nodeList[50]}.rotate", f"{nodeList[93]}.inputRotate",	 f=True) # curl_jFinger0.rotate -> cmx_curl_jFinger0.inputRotate
	mc.connectAttr(f"{nodeList[51]}.jointOrient", f"{nodeList[57]}.jointOrient",	 f=True) # jFinger3.jointOrient -> curl_jFinger3.jointOrient
	mc.connectAttr(f"{nodeList[51]}.jointOrient", f"{nodeList[10]}.jointOrient",	 f=True) # jFinger3.jointOrient -> ikDriver_jFinger3.jointOrient
	mc.connectAttr(f"{nodeList[51]}.worldMatrix", f"{nodeList[83]}.matrixIn[1]",	 f=True) # jFinger3.worldMatrix -> mxm_ikOffsetOPM_jFinger3.matrixIn[1]
	mc.connectAttr(f"{nodeList[51]}.worldMatrix", f"{nodeList[82]}.matrixIn[1]",	 f=True) # jFinger3.worldMatrix -> mxm_fkOPM_jFinger3.matrixIn[1]
	mc.connectAttr(f"{nodeList[52]}.outputMatrix", f"{nodeList[58]}.matrixIn[1]",	 f=True) # cmx_splayKnuckle_finger0.outputMatrix -> mxm_opm_finger0_IK.matrixIn[1]
	mc.connectAttr(f"{nodeList[53]}.outMatrix", f"{nodeList[58]}.matrixIn[2]",	 f=True) # hmx_ikHandControlOffsetAnnotate_finger0.outMatrix -> mxm_opm_finger0_IK.matrixIn[2]
	mc.connectAttr(f"{nodeList[54]}.worldMatrix", f"{nodeList[90]}.offsetParentMatrix",	 f=True) # c_finger0_IK.worldMatrix -> ikh_secondary_finger0.offsetParentMatrix
	mc.connectAttr(f"{nodeList[54]}.worldMatrix", f"{nodeList[88]}.offsetParentMatrix",	 f=True) # c_finger0_IK.worldMatrix -> ikh_primary_finger0.offsetParentMatrix
	mc.connectAttr(f"{nodeList[54]}.worldMatrix", f"{nodeList[71]}.inMatrix2",	 f=True) # c_finger0_IK.worldMatrix -> dbt_ikLengthFinger0.inMatrix2
	mc.connectAttr(f"{nodeList[54]}.worldMatrix", f"{nodeList[76]}.primaryTargetMatrix",	 f=True) # c_finger0_IK.worldMatrix -> aim_noFlip0.primaryTargetMatrix
	mc.connectAttr(f"{nodeList[57]}.matrix", f"{nodeList[62]}.matrixIn[0]",	 f=True) # curl_jFinger3.matrix -> mxm_lengthCurlTipMed_finger0.matrixIn[0]
	mc.connectAttr(f"{nodeList[57]}.rotate", f"{nodeList[94]}.inputRotate",	 f=True) # curl_jFinger3.rotate -> cmx_curl_jFinger3.inputRotate
	mc.connectAttr(f"{nodeList[58]}.matrixSum", f"{nodeList[54]}.offsetParentMatrix",	 f=True) # mxm_opm_finger0_IK.matrixSum -> c_finger0_IK.offsetParentMatrix
	mc.connectAttr(f"{nodeList[59]}.matrixSum", f"{nodeList[70]}.inMatrix2",	 f=True) # mxm_lengthCurlTipBase_finger0.matrixSum -> dbt_hFloor1.inMatrix2
	mc.connectAttr(f"{nodeList[60]}.matrixSum", f"{nodeList[71]}.inMatrix1",	 f=True) # mxm_restPose_jFingerIKDriver0.matrixSum -> dbt_ikLengthFinger0.inMatrix1
	mc.connectAttr(f"{nodeList[61]}.output", f"{nodeList[80]}.maxTransXLimit",	 f=True) # add_mdFinger0.output -> jFingerIkBase2.maxTransXLimit
	mc.connectAttr(f"{nodeList[61]}.output", f"{nodeList[72]}.input2",	 f=True) # add_mdFinger0.output -> add_pmdFinger0.input2
	mc.connectAttr(f"{nodeList[62]}.matrixSum", f"{nodeList[59]}.matrixIn[0]",	 f=True) # mxm_lengthCurlTipMed_finger0.matrixSum -> mxm_lengthCurlTipBase_finger0.matrixIn[0]
	mc.connectAttr(f"{nodeList[62]}.matrixSum", f"{nodeList[73]}.inMatrix2",	 f=True) # mxm_lengthCurlTipMed_finger0.matrixSum -> dbt_hFloor2.inMatrix2
	mc.connectAttr(f"{nodeList[63]}.rotate", f"{nodeList[100]}.inputRotate",	 f=True) # jFinger3_ikOffset.rotate -> cmx_ikOffset_jFinger3.inputRotate
	mc.connectAttr(f"{nodeList[63]}.inverseMatrix", f"{nodeList[83]}.matrixIn[0]",	 f=True) # jFinger3_ikOffset.inverseMatrix -> mxm_ikOffsetOPM_jFinger3.matrixIn[0]
	mc.connectAttr(f"{nodeList[65]}.rotate", f"{nodeList[86]}.inputRotate",	 f=True) # jFinger1_ikOffset.rotate -> cmx_ikOffset_jFinger1.inputRotate
	mc.connectAttr(f"{nodeList[65]}.inverseMatrix", f"{nodeList[117]}.matrixIn[0]",	 f=True) # jFinger1_ikOffset.inverseMatrix -> mxm_ikOffsetOPM_jFinger1.matrixIn[0]
	mc.connectAttr(f"{nodeList[67]}.inverseMatrix", f"{nodeList[110]}.matrixIn[0]",	 f=True) # jFinger0_ikOffset.inverseMatrix -> mxm_ikOffsetOPM_jFinger0.matrixIn[0]
	mc.connectAttr(f"{nodeList[67]}.rotate", f"{nodeList[103]}.inputRotate",	 f=True) # jFinger0_ikOffset.rotate -> cmx_ikOffset_jFinger0.inputRotate
	mc.connectAttr(f"{nodeList[69]}.outputMatrix", f"{nodeList[60]}.matrixIn[0]",	 f=True) # cmx_restPose_jFingerIKDriver0.outputMatrix -> mxm_restPose_jFingerIKDriver0.matrixIn[0]
	mc.connectAttr(f"{nodeList[73]}.distance", f"{nodeList[80]}.minTransXLimit",	 f=True) # dbt_hFloor2.distance -> jFingerIkBase2.minTransXLimit
	mc.connectAttr(f"{nodeList[75]}.matrixSum", f"{nodeList[76]}.secondaryTargetMatrix",	 f=True) # mxm_aimAxisZ.matrixSum -> aim_noFlip0.secondaryTargetMatrix
	mc.connectAttr(f"{nodeList[76]}.outputMatrix", f"{nodeList[81]}.inputMatrix",	 f=True) # aim_noFlip0.outputMatrix -> pmx_noFlip0.inputMatrix
	# mc.connectAttr(f"{nodeList[77]}.scale", f"{nodeList[80]}.inverseScale",	 f=True) # jFingerIkBase1.scale -> jFingerIkBase2.inverseScale
	mc.connectAttr(f"{nodeList[79]}.matrixSum", f"{nodeList[38]}.offsetParentMatrix",	 f=True) # mxm_fkOPM_jFinger2.matrixSum -> c_jFinger2_FK.offsetParentMatrix
	mc.connectAttr(f"{nodeList[80]}.translateX", f"{nodeList[89]}.translateX",	 f=True) # jFingerIkBase2.translateX -> effector6.translateX
	mc.connectAttr(f"{nodeList[80]}.translateY", f"{nodeList[89]}.translateY",	 f=True) # jFingerIkBase2.translateY -> effector6.translateY
	mc.connectAttr(f"{nodeList[80]}.translateZ", f"{nodeList[89]}.translateZ",	 f=True) # jFingerIkBase2.translateZ -> effector6.translateZ
	mc.connectAttr(f"{nodeList[80]}.offsetParentMatrix", f"{nodeList[89]}.offsetParentMatrix",	 f=True) # jFingerIkBase2.offsetParentMatrix -> effector6.offsetParentMatrix
	mc.connectAttr(f"{nodeList[81]}.outputMatrix", f"{nodeList[84]}.matrixIn[2]",	 f=True) # pmx_noFlip0.outputMatrix -> mxm_noFlip0.matrixIn[2]
	mc.connectAttr(f"{nodeList[82]}.matrixSum", f"{nodeList[47]}.offsetParentMatrix",	 f=True) # mxm_fkOPM_jFinger3.matrixSum -> c_jFinger3_FK.offsetParentMatrix
	mc.connectAttr(f"{nodeList[83]}.matrixSum", f"{nodeList[63]}.offsetParentMatrix",	 f=True) # mxm_ikOffsetOPM_jFinger3.matrixSum -> jFinger3_ikOffset.offsetParentMatrix
	mc.connectAttr(f"{nodeList[84]}.matrixSum", f"{nodeList[96]}.offsetParentMatrix",	 f=True) # mxm_noFlip0.matrixSum -> locNoFlipPvBase.offsetParentMatrix
	mc.connectAttr(f"{nodeList[85]}.output1D", f"{nodeList[99]}.input2",	 f=True) # netLerp0_pma_diff.output1D -> netLerp0_multDL_K.input2
	mc.connectAttr(f"{nodeList[86]}.outputMatrix", f"{nodeList[105]}.matrixIn[0]",	 f=True) # cmx_ikOffset_jFinger1.outputMatrix -> mxm_ikDriver_jFinger1.matrixIn[0]
	mc.connectAttr(f"{nodeList[87]}.outputMatrix", f"{nodeList[105]}.matrixIn[1]",	 f=True) # cmx_ikDriver_jFinger1.outputMatrix -> mxm_ikDriver_jFinger1.matrixIn[1]
	mc.connectAttr(f"{nodeList[92]}.output2Dy", f"{nodeList[104]}.input2X",	 f=True) # netInvLerp0_pma_diffs.output2Dy -> netInvLerp0_divide.input2X
	mc.connectAttr(f"{nodeList[92]}.output2Dx", f"{nodeList[104]}.input1X",	 f=True) # netInvLerp0_pma_diffs.output2Dx -> netInvLerp0_divide.input1X
	mc.connectAttr(f"{nodeList[93]}.outputMatrix", f"{nodeList[2]}.inputMatrix",	 f=True) # cmx_curl_jFinger0.outputMatrix -> bmx_curl_jFinger0.inputMatrix
	mc.connectAttr(f"{nodeList[94]}.outputMatrix", f"{nodeList[42]}.inputMatrix",	 f=True) # cmx_curl_jFinger3.outputMatrix -> bmx_curl_jFinger3.inputMatrix
	mc.connectAttr(f"{nodeList[98]}.outputMatrix", f"{nodeList[3]}.inputMatrix",	 f=True) # cmx_fkDriver_jFinger0.outputMatrix -> bmx_ikDriver_jFinger0.inputMatrix
	mc.connectAttr(f"{nodeList[99]}.output", f"{nodeList[115]}.input2",	 f=True) # netLerp0_multDL_K.output -> netLerp0_adl_result.input2
	mc.connectAttr(f"{nodeList[100]}.outputMatrix", f"{nodeList[32]}.matrixIn[0]",	 f=True) # cmx_ikOffset_jFinger3.outputMatrix -> mxm_ikDriver_jFinger3.matrixIn[0]
	mc.connectAttr(f"{nodeList[101]}.outputMatrix", f"{nodeList[35]}.inputMatrix",	 f=True) # cmx_fkDriver_jFinger3.outputMatrix -> bmx_ikDriver_jFinger3.inputMatrix
	mc.connectAttr(f"{nodeList[102]}.outputMatrix", f"{nodeList[31]}.inputMatrix",	 f=True) # cmx_fkDriver_jFinger2.outputMatrix -> bmx_ikDriver_jFinger2.inputMatrix
	mc.connectAttr(f"{nodeList[103]}.outputMatrix", f"{nodeList[4]}.matrixIn[0]",	 f=True) # cmx_ikOffset_jFinger0.outputMatrix -> mxm_ikDriver_jFinger0.matrixIn[0]
	mc.connectAttr(f"{nodeList[105]}.matrixSum", f"{nodeList[12]}.target[0].targetMatrix",	 f=True) # mxm_ikDriver_jFinger1.matrixSum -> bmx_ikDriver_jFinger1.target[0].targetMatrix
	mc.connectAttr(f"{nodeList[106]}.outputMatrix", f"{nodeList[4]}.matrixIn[1]",	 f=True) # cmx_ikDriver_jFinger0.outputMatrix -> mxm_ikDriver_jFinger0.matrixIn[1]
	mc.connectAttr(f"{nodeList[107]}.outputMatrix", f"{nodeList[11]}.inputMatrix",	 f=True) # cmx_curl_jFinger1.outputMatrix -> bmx_curl_jFinger1.inputMatrix
	mc.connectAttr(f"{nodeList[108]}.outputMatrix", f"{nodeList[34]}.inputMatrix",	 f=True) # cmx_curl_jFinger2.outputMatrix -> bmx_curl_jFinger2.inputMatrix
	mc.connectAttr(f"{nodeList[109]}.worldInverseMatrix", f"{nodeList[113]}.matrixIn[2]",	 f=True) # rigRoot.worldInverseMatrix -> mxm_fkOPM_jFinger0.matrixIn[2]
	mc.connectAttr(f"{nodeList[110]}.matrixSum", f"{nodeList[67]}.offsetParentMatrix",	 f=True) # mxm_ikOffsetOPM_jFinger0.matrixSum -> jFinger0_ikOffset.offsetParentMatrix
	mc.connectAttr(f"{nodeList[111]}.matrixSum", f"{nodeList[45]}.offsetParentMatrix",	 f=True) # mxm_handKnuckleRoll0.matrixSum -> c_handKnuckle_finger0.offsetParentMatrix
	mc.connectAttr(f"{nodeList[113]}.matrixSum", f"{nodeList[36]}.offsetParentMatrix",	 f=True) # mxm_fkOPM_jFinger0.matrixSum -> c_jFinger0_FK.offsetParentMatrix
	mc.connectAttr(f"{nodeList[114]}.matrixSum", f"{nodeList[23]}.offsetParentMatrix",	 f=True) # mxm_ikOffsetOPM_jFinger2.matrixSum -> jFinger2_ikOffset.offsetParentMatrix
	mc.connectAttr(f"{nodeList[117]}.matrixSum", f"{nodeList[65]}.offsetParentMatrix",	 f=True) # mxm_ikOffsetOPM_jFinger1.matrixSum -> jFinger1_ikOffset.offsetParentMatrix
	mc.connectAttr(f"{nodeList[118]}.matrixSum", f"{nodeList[14]}.offsetParentMatrix",	 f=True) # mxm_fkOPM_jFinger1.matrixSum -> c_jFinger1_FK.offsetParentMatrix

	# end of script
	return nodeList[53]