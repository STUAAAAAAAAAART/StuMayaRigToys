# Dual Finger IK

a single-control IK system for 3-section fingers

the 3 sections of the finger from the base to the tip are the Proximal, Medial, and Distal sections. the joints correspond to the points of rotation, plus the fingertip at the end, from the base of the finger to its tip.

while a simple non-trivial IK system involves 3 joints, a regular finger has 4 joints. this system uses two 3-joint IK systems to solve all 4 joints:
- the second IK system driving the Medial and Distal sections (last 3 joints)
- the first IK system solving for the Proximal section and an imaginary section towards the last joint.
	- essentially the second IK system reduces the last 2 sections into 1 section and sits on that imaginary section, allowing for the remaining unaddressed joints to be solved as a non-trivial IK

this IK system condenses poses like pointing and finger wagging and surface location to a single point

# mechanics

when a finger is curled or straightened, the simplest measurement to describe the finger is the length from the base of the finger to the fingertip.

using this distance, the length of the imaginary section of the first IK system is proportionally scaled. as the second IK system rests along this section, the Medial and Distal sections of the finger are also curled. changing this curl distance drives the two IK systems in tandem, effectivly proving a way to aim and extend a finger from just a single point (with the option of directly using a FK controller, either as an alternative control, or an offset of the IK result)

# script
- script expects an unrigged 4-joint (or 3-sectioned finger), as all the IKFK controls and driver joints will be enumerated
- script expects the input joints to be neatly oriented before running

# test scene
- tbd

# current limitations:
- deliberate flipping of medial-distal sections in pinching poses not covered in this rig at the moment
	- pose explaination: make small circle with index finger and thumb and touch the ends together. pinch together and rotate the distal section of the index finger
	- other pose actions include rock-climbing grips, typing, pressing actions 
	- this may require a third IK space to set up a reverse-"foot" for the distal joint
- secondary IK system retracts immediately when the IK target length is immediately shorter than length of finger chain, which may not be natural for certain resting poses where the medial-distal bend is not equally rotated with the proximal-medial bend.
	- current workaround is a manual FK offset, but:
	- a possible implementation would be a blend between having the secondary IK system active and fully extended, to dampen or even disable the medial-distal bend