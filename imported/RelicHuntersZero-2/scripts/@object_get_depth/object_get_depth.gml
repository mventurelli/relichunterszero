/// @description Returns the depth of the specified object.
/// @param {Number} obj The index of the object to check
/// @return {Number} depth of the object

var objID = argument0;
var ret = 0;
if (objID >= 0) && (objID < array_length_1d(global.__objectID2Depth)) {
	ret = global.__objectID2Depth[objID];
} // end if
return ret;