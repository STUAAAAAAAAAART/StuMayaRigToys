```py
jointChain = [joint0, joint1, ...]

ikSplineDriver = mc.duplicate(jointChain, po=False)
# rename driver joints accordingly
ikFwdSplineSolver = mc.duplicate(jointChain, po=False)
# rename solver joints accordingly
ribbon, primaryCurveIso, secondaryCurveIso, revPrimaryCurveDAG = setupJointToRibbon(jointChain, width=0.5, primaryInMiddle=True)
# revPrimaryCurveDAG = [transform, curveShape]
forwardSolverHandle, forwardEffector = mc.ikHandle(ikFwdSplineSolver[0], ikFwdSplineSolver[-1], revPrimaryCurveDAG[0]) # temporary curve
mc.connectAttr(f"{primaryCurveISO}.outputCurve", f"{ikFwdSplineSolver}.inCurve", f=True)
# rename forward effector accordingly

ikRevSplineSolver= reverseJointChainDriver(ikFwdSplineSolver, "reverseSplineSolverChainNameHere")
reverseSolverHandle, reverseEffector = mc.ikHandle(ikRevSplineSolver[0], ikRevSplineSolver[-1], revPrimaryCurveDAG)
# rename reverse effector accordingly

ikSplineDriver, ikFwdSplineSolver, ikRevSplineSolver, primaryCurveIso, secondaryCurveIso = setupDualSplineRootSwitchIK(jointChain)
holdsSplineRootAttr = setupDualSplineRootSwitch(ikSplineDriver, ikFwdSplineSolver, ikRevSplineSolver, primaryCurveIso, secondaryCurveIso)

simpleFinaliseIK(jointChain, ikSplineDriver) # finish by adding FK offsets and FK blend to IK system
```

# Dual Spline IK

> !!! STILL BEING WORKED ON !!! 

uses a NURBS surface ribbon to manage driver curves, and is itself deformed by skinned controller joints

controller joints does not have to be in a chain and should be treated as 3 separate IK controllers

## impetus

normally in maya, a splineIK system with a single curve will encounter sphere-quadrant(?) rotation flipping, especially if the driver curve is bent to face behind or rolled.

this flipping behaviour is unintuitive and undesired from a control perspective, and will be encounted frequently from a simple 90 or 180 degree rotation

maya includes roll attributes in the ikHandle nodes, but this is also not 100% reliable as all it does is offset the rotation value of the joints, and is not aware of any alignments or its directionality

**the problem is that the joints along a single vector or curve does not have enough information to align itself to a known tangent, and without knowing an alignment there is an infinite way to represent the roll position through its forward facing vector, and defaults to the quadrant methods relative to the scene**

the solution is to add a second similar curve as a target tangent, and have the points along the spline driver joint chain aim its tangent to the nearest point of the tangent curve. this will solve the flipping, as the tangent curve can only flip when the main controls desire it to flip.

the result rotation drivers numerically overrides the joint orient of the driven spine, to not get in the way of the forward-and-tangent calculation logic

# rig alsorithm
- get ribbon of rig, where first edge passes through the IK solver joint chain
- normal spline IK of `curveFromSurfaceIso` of the first edge, to get IK solver joint chain positions
- `nearestPointOnCurve` on `curveFromSurfaceIso` of the secondary edge, to get a tangent vector from joint positions
- `aimMatrix` using forward vector (translate vector from next joint in line) and tangent vector, to get world-space rotation
- cast result world-space rotation to driven joint chain (transform = -(jointOrient) * -(parentMatrix) * resultRotation)

# maya wishlist

ideally, the splineIK system in maya should include means to geometrically define the tangent vector, either through the use of a second curve, or the use of a primary surface instead of a primary curve. the splineIK system as it stands is only useful to align a joint chain to a curve, but is missing means to address the roll-orientation along the curve in an absolute manner.

this way, the amount of node-based calculation of the tangent vectors can be removed, if the splineIK system can handle this logic itself

# note on included maya scene

- maya scene is proof of concept
- spline maths defaults to x-forward z-tangent/primary (z bends the back forward), and expects the chain of joint orientations to be coplanar
	- two ways to change/adjust the spline joint orientation direction maths (ideally do ONLY ONE of the following):
		- changing the `secondaryInputAxis` subattribute in the `aim_splineDriverFwd_{}` `aimMatrix` node
			- default: `[0,0,-1]`
		- changing the `forwardOrient` matrix attribute of the final `mxm_splineDriver_{}` result nodes, above just changing the joint orients of the spinal chain
			- default: rotate component `[0,0,0]` ; this is pre-offset by the default of the earlier `secondaryInputAxis`
- the script for this would require attended use (unlike most select-run-and-done scripts), as the shape of the control ribbon may require manual creation
	- current challenges to make it 100% unattended include:
		- finding the common plane of the spine chain, and making an offset curve perpendicular to the plane
		- skinning the driver ribbon to the control joints, in a way to absolutely minimise the need to manually paint weights
- the control ribbon should be treated like a skinned mesh, and should not be moved after being bound to any joint.
- the control joints should be placed on the control vertices of the curve/surface, and not along the curve/isoparm itself.

## limitations
- **important note for adapting stretchy-IK onto result**: per-joint scaling only works for lengths within the rig logic, and has to be scaled uniformly. scaling per-axis would result in inconsistent point behaviour
	- use the scale of the IK result driver to only drive the forward-axis of the driven joints on the result mesh side, then use external controls to drive the axes perpendicular to the forward axis
- root switching between splines currently does not pass nicely through the common curve at the moment, and only does a simple linear blend between positions
	- it's mostly minimal when the spline is roughly the same length as the joint chain, but the blend will be very evident at extreme differences in length
	- pushing an offset on the ikHandle when blending does not alleviate the problem when the length of the spline is a lot shorter than the chain
	- an ideal solution would have been to extend the control spline at both ends and interpolate parameter positions along the extended spline
		- at this rate a plugin to extend functionality of the spline IK system would be more tenable rather than to solve this with nodes
