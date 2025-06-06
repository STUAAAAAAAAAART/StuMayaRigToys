import maya.cmds as mc
#import maya.api.OpenMaya as om2

#===========================
# MAYA SCENE SETUP FOR TEST
#=========================== 

mc.createNode("joint", n="root", skipSelect = True)
# ==== JOINT ORIENT MUST BE ORTHOGONAL TO SCENE AXES
mc.setAttr("root.jointOrient", -90, 0, 0) # Z-up joint in Y-up scene


mc.createNode("joint", n="charBase", skipSelect = True)
# ==== JOINT ORIENT MUST BE ORTHOGONAL TO SCENE AXES
mc.setAttr("charBase.jointOrient", -90, 0, 0) # Z-up joint in Y-up scene
mc.setAttr("charBase.translate", 0, 5, 0)


mc.createNode("joint", n="rootHandTargetIK0", skipSelect = True)
# ==== JOINT ORIENT MUST BE ORTHOGONAL TO SCENE AXES
mc.setAttr("rootHandTargetIK0.jointOrient", -90, 0, 0) # Z-up joint in Y-up scene
mc.setAttr("rootHandTargetIK0.translate", 5, 5, -2)

mc.createNode("joint", n="rootHandTargetIK1", p="rootHandTargetIK0", skipSelect = True)
mc.setAttr("rootHandTargetIK0.jointOrient", 0, 0, 0) # reset end joint orient to parent joint
mc.setAttr("rootHandTargetIK0.translate", 4, 0, 0)


mc.parent("rootHandTargetIK0", "charBase", "root", r=False)

# or set up something similar from the object this script makes in the scene
# NOTE RESTRICTIONS IN COMMENTS ABOVE