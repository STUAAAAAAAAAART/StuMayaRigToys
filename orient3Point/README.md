# orient a joint with 3 points

quickly orient a joint using points made by itself, a forward point, and a planar point

the third/planar point is required: while an x-axis can be easily aligned, there are an infinite possible alignments for the other axes due to the nature of rotating around the x-axis and the lack of a (relative) definition. using a third point defines a plane (using the normal of the plane so that it passes through the x-axis), defining two possible orients for the tangents (positive/negative)

the first few attempts involve:
- using matrices, but required writing matrix-to-euler-angle functions with the possibility of encountering infinite resultes at y = +/-90
- using numpy for maths purposes, but is not included with maya by default (can be added with mayapy pip, but will require setup outside of maya which may depend on user privilidges?)

but i ended up with using maya's built in quaternion classes, partly because it's a much simpler way to evaluate rotations, but primarily because maya has built-in matrix and quaternion classes via the openmaya API and utilising them was more convenient

# algorithm
- get worldspace points for position, forward, other
	- position: the joint to orient
	- forward: the point for the joint to face
	- other: the point to define an oriented rotation in 3D space
- create relative vectors from points:
	- (forward-position) forward vector and quaternion
	- (other-position) secondary vector and quaternion
- **first quaternion**: align world x-axis to forward vector 
- derive vector of both tangents relative to base of forward vector
	- rotating world z-axis by initial x-axis alignment - the initial tangent vector resulting from initial alignment
	- cross product (forward, secondary): planar normal - the correct/intended planar tangent vector
- create plane from forward axis
	- initial tangent and correct tangent both lay on this plane
- derive tangent normals relative to plane:
	- tangent normals must be made coplanar perpendicular to forward vector before quaternion, because doing so without being coplanar would make it rotate away from the forward vector
	- coplanar vector = local vector - rejection vector
		- rejection vector is the perpendicular distance from the plane to the local vector, derived by 
		- local vectors in this case are the initial tangent and the correct tangent 
- **second quaternion**: align initial tangent to planar tangent
- **result orient quaternion = primary quaternion * secondary quaternion**

the orientation is applied by temporarily disconnecting the hierachy of the joint to be oriented, then orienting it relative to worldspace, then rebuilding the hierachy. this was a lot more convenient than having to evaluate the quaternion needed relative to the joint's parent, and the counter-transforms (or orients) needed to keep its downstream hierachy (the children) in place and not get affected by the difference in orientation

the script should preserve relative naming of the nodes by queriny for all the names involved before unparenting and reparenting

# limitations
- this assumes x-forward z-tangent; using another orient definition (e.g. y-forward etc) would require a pre-orientation quaternion in the script (basically turning the x-axis to where it would be in another orient)