import maya.cmds as mc
import maya.api.OpenMaya as om2

# (passive): gets currently selected nodes in maya scene
# attr: longName of the attr to be added
# attributeType: attribute type of the attribute; see maya command codumentation for addAttr
# isDT: is this using a dataType flag instead of the attributeType flag?
def quickAddAttr(attr:str, attributeType:str, isDT=False):
	# not type safe!! function will not check if each item in selection is incompatible with mc.addatr or not!!
	activeSelection = om2.MGlobal.getActiveSelectionList()
	iterSelection = om2.MItSelectionList(activeSelection)
	returnList = []
	for node in iterSelection:
		try:
			if isDT:
				mc.addAttr(node.getStrings()[0], ln=attr, dt=attributeType)
			else:
				mc.addAttr(node.getStrings()[0], ln=attr, at=attributeType)
			returnList.append(f"{node.getStrings()[0]}.{attr}")
		except:
			print(f"quickAddAttr - WARN: addattr failed, skipping: {node.getStrings()[0]}.{attr}")
	iterSelection.reset()
	return returnList