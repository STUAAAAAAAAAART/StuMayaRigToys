# Root Motion Setup

- world manipulator system setup with root motion animation requirements in mind (specifically for game engines and game animation)
	- animation follows the mandatory root joint, and may "pop" back to root if root motion is not present in animation
	- more root point control may be desired in animations where the character goes between above-floor (e.g. walking) and below-floor (ledge climbing)
- should work on any root orientation (y-up or z-up, etc etc), so long as joint orient of root joint is orthogonal to scene axes
- floating root point for defining where the root should be in the animation
	- translate-only, for consistency
- joint definitions captured to child controllers to ensure controllers are zeroed-out while maintaining original joint lengths
	- child controllers are still free to translate afterwards (necessary for hips and tool IK target helper joints)
	- manual edit after operation is transform matrix attribute `.jointTranslateMatrix` under child controller

base code written using scene-to-python codegen as base, at [STUAAAAAAAAAART/mayaNodeToPython/](https://github.com/STUAAAAAAAAAART/mayaNodeToPython/)

## Devnotes
- controls created:
	- **World Manip**: moves all other controls
	- **Base Manip**: moves other controls after the root joint relative to World Manip center.
	- **Root Point**: moves root joint exclusively and independently without affecting downstream joints
	- controls of immediate children joints to root:
		- automatically created and named according to driven joints
		- each moves driven child joints 
- node `imx_worldOffsetMatrixForControlsIK` made as `offsetParentMatrix` base to drive downstream IK handle control offsets, and does not receive scale along the World and Base manips
	- to use: create `multMatrix` node and connect in the following numbered order:
	```
	[0] imx_wOMFCIK.outputMatrix
	[1] (point offset of IK controller)
	[2] imx_wOMFCIK.inputMatrix

	multMatrix.output = imx_wOMFCIK.inputMatrix * (point offset of IK controller) *  imx_wOMFCIK.outputMatrix

	connect multMatrix.output to offsetParentMatrix of IK controller - or assigned offset point of multiple IK controllers
	```
	- worldScale passed on with `.worldScalePassthrough` matrix attribute if needed
- `pmx_scaleWorldManipDoubleDriver` and `pmx_opm_rigBaseManip` : attribute `.useScale` should be opposite booleans of each other if behaviour is to be edited
	- inverting or NOT-ing from current setting will flip scale influence from World manip to Base manip
- script returns list of two `om2.MSelectionList`s:
	- MSL:
		- `imx_worldOffsetMatrixForControlsIK` - scene space offset from rig center
		- `mxm_opmFrom_worldManip` - rig space offset from root joint, for control offsets
		- `mxm_offsetTransformFrom_worldManip` - rig space transforms, for child joint driver logic
	- MSL:
		- **World manip**
		- **Root point**
		- **Base manip**
		- controls for each of the child joints (index [3] onwards)

## Limitations
- **scale**
	- defaults to maya inverse-scale behaviour (segment scale compensation), case left open for other solutions that manages this (either global on/off, or by sections)
	- scaling world manip will not scale rest of the model or rig
		- scaling not advised for animators unless rig is further set up for it (this script does not help with this as the rest of the control rig is not known)
		- scale is lock and hidden by default, use `( lockScale=False )` in main command to override
		- if scale of rig needs to be changed once and not on an animation basis, consider refactoring or rebuilding rig directly (including cleaning up root motion controls and re-running the script again)
- **joint orientation**
	- ***children joints of root joint MUST BE ORTHOGONAL*** to prevent scale-shearing mismatching artifacts (the thing where a scale is done above a rotated transform)
		- **script currently does not check for this. check joints before using** or consider editing script to check joint orientation
		- if a specific orient is a must, consider nesting under mandatory orientation joint.
- **joint definition**
	- ***joints MUST ONLY BE DEFINED THROUGH JOINT ORIENT AND TRANSLATE, and expects rotate and scale to be IN DEFAULT VALUES.*** make sure joint heirarchy is sanatised BEFORE running this script, as ths script **will only capture orents and translates on joints**
- **script**
	- currently assumes joints are `"root"` and all its immediate children: if there is a need to not rig all the children joints, consider altering function to get explicit list input and check if it's child of `"root"`
	- assumes the following transform group names exists in the scene:
		- `g_controls` - main group of all controls in rig
			- contains **World manip** and Rigging Operation group 
		- `g_rootMotion` - rigOp group for the controls created in this script
			- except **World manip**
		- if either not present, transforms will be made
	- if controls exists in scene by exact name, new controls will be created with default name rollover behaviour by maya

## inspired by
[this convo on bluesky](https://bsky.app/profile/jernst.bsky.social/post/3llzcbe46nk2t)