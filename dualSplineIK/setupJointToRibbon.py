import maya.cmds as mc
import maya.api.OpenMaya as om2

# ribbon, primaryCurveIso, secondaryCurveIso, revPrimaryCurveDAG = setupJointToRibbon(jointChain, width=0.5, primaryInMiddle=True)

def setupJointToRibbon(jointChain, width=0.5, primaryInMiddle=True) -> list:
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

	# get joint world matrices (EPs)
	jointListMatrix = []
	for joint in jointChain:
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
	ikRevCurve = mc.curve(n=f"spline_primaryCurveRev_{jointChain[0]}", ep=ikCurveReverseEP) # reverse IK spline driver curve
	
	# create curves and loft 
	primaryCurve   = mc.curve(ep=primaryListEP) # ribbon side 0
	secondaryCurve = mc.curve(ep=secondaryListEP) # ribbon side 1
	ribbonTransform = mc.loft(primaryCurve, secondaryCurve, n=f"nurbs_dualSplineIK_{jointChain[0]}", o=True,ch=False)[0]
	ribbonShape = mc.listRelatives(ribbonTransform, s=True)[0]

	checkLength = mc.arclen(tempCurve) - mc.arclen(f"{ribbonPrimaryISO}.outputCurve")
	

	# create and connect curveFromSurfaceIso nodes
	#////////////////
	# forward IK
	#////////////////
	primaryISO = mc.createNode("curveFromSurfaceIso",	n=f"siso_primaryCurve_{jointChain[0]}", skipSelect = True) # pass result to forward IK
	mc.setAttr(f'{primaryISO}.isoparmValue', primaryIsoParam , type='double')
	mc.connectAttr(f"{ribbonShape}.worldSpace", f"{primaryISO}.inputSurface",	 f=True)
	


	secondaryISO = mc.createNode("curveFromSurfaceIso",	n=f"siso_tangentCurve_{jointChain[0]}", skipSelect = True) # pass result to forward aimMatrix
	mc.setAttr(f'{secondaryISO}.isoparmValue', secondaryIsoParam , type='double')
	mc.connectAttr(f"{ribbonShape}.worldSpace", f"{secondaryISO}.inputSurface",	 f=True)

	# create and connect reversing nodes
	primaryReverse = mc.createNode("reverseCurve",	n=f"cRev_primaryCurve_{jointChain[0]}", skipSelect = True) 
	mc.connectAttr(f"{primaryISO}.outputCurve", f"{primaryReverse}.inputCurve",	 f=True)
	mc.connectAttr(f"{primaryReverse}.outputCurve", f"{ikRevCurve}.create",	 f=True) # pass ikRevCurve to reverseIK


	secondaryReverse = mc.createNode("reverseCurve",	n=f"cRev_tangentCurve_{jointChain[0]}", skipSelect = True) # pass result to reverse aimMatrix
	mc.connectAttr(f"{secondaryISO}.outputCurve", f"{secondaryReverse}.inputCurve",	 f=True) 

	# create spline IK solvers
	forwardIK = mc.ikHandle()
	reverseIK = mc.ikHandle()
	

	# close out

	mc.delete(primaryCurve, secondaryCurve) # cleanup
	return [ribbonShape, primaryISO, secondaryISO, primaryCurve]