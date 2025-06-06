import maya.cmds as mc
import maya.api.OpenMaya as om2

# position: expects name of joint to be oriented. must be joint
# forward: expects name of any transform in scene, where the x-axis of the joint will point to
# other: expects name of any transform in scene, to construct a plane from 3 points to align the tangent axis (z-axis)
# return: the world-space euler rotation result, for informational purposes
def orient3Point(position, forward, other, flip=False):
	try:
		assert mc.nodeType(position) == "joint" # test if type is joint
	except:
		raise AssertionError(f"input object not a joint: {position}")
	# ==== maths =============
	toDeg =    57.29577951308232 # A * 180/pi
	toRad = 0.017453292519943295 # A * pi/180
	p0 = om2.MVector( mc.getAttr(f"{position}.worldMatrix")[-4:-1] ) # the joint itself
	p1 = om2.MVector( mc.getAttr(f"{forward }.worldMatrix")[-4:-1] ) # the point where the joint will be facing
	p2 = om2.MVector( mc.getAttr(f"{other   }.worldMatrix")[-4:-1] ) # the tangent plane to align perpendicular to its z-axis

	vFwd = (p1-p0).normal() # forward vector
	vPln = (p2-p0).normal() # coplanar vector
	vNrm = None
	if flip:
		vNrm = (vPln ^ vFwd).normal() # planar normal
	else:
		vNrm = (vFwd ^ vPln).normal() # planar normal
	
	qFwd = om2.MQuaternion( om2.MVector(1,0,0), vFwd, 1) # initial forward quaternion
	qFwdZ = om2.MQuaternion( om2.MVector(1,0,0), om2.MVector(0,0,1), 1) * qFwd # "z-axis" of initial forward quaternion, NOT the planar z-axis
	#	rotate z-axis by forward quaternion

	alignPlane = om2.MPlane().setPlane(vFwd, 0) # plane perpendicular to x-axis
	vFwdZ = (om2.MVector(1,0,0).rotateBy(qFwdZ)).normal() # z-axis normal of initial rotation, is definitely on this plane
	vNrm # planar normal vector, NOT z-axis; just a reminder
	# point on plane relative to space = space vector - rejection vector
	#                     rejection vector = distance from plane * normal vector
	planeFwdZ = (vFwdZ - (alignPlane.distanceToPoint(vFwdZ) * alignPlane.normal())).normal() # initial normal from x-axis alignment
	planeNrm  = (vNrm  - (alignPlane.distanceToPoint(vNrm)  * alignPlane.normal())).normal() # correct normal from plane
	qAlign = om2.MQuaternion(planeFwdZ, planeNrm, 1) # realignment rotation adjustment
	
	qOrient = qFwd * qAlign # coplanar joint orient - result

	# scene units sanitisation: angles can be set to either degrees or radians
	angleUnit = mc.currentUnit(q=True, angle=True)
	posCurrentRotate = list(mc.getAttr(f"{position}.rotate")[0])
	if angleUnit == 'deg': # scene units in degrees, convert to radians
		for i in range (3):
			posCurrentRotate[i] = posCurrentRotate[i]*toRad
	posCurrentRotate = om2.MEulerRotation(*posCurrentRotate, om2.MEulerRotation.kXYZ)
	qOrient = posCurrentRotate.inverse().asQuaternion() * qOrient

	getEuler = qOrient.asEulerRotation()
	orient = [getEuler.x, getEuler.y, getEuler.z]
	if angleUnit == 'deg': # result in radians, convert to scene units if degrees
		for i in range(3):
			orient[i] = orient[i] * toDeg

	# ==== parent handler =============
	# unparents the joint and its children to set joint orient in world space, just to simplify everything
	# 	using ths script to reorient rigged joints isn't advised at the moment, due to many complexities with other nodes like IK or constraints or skinning
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