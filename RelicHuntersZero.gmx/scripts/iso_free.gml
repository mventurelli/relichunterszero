//iso_free();
//Frees the Isometric Reflections engine from memory.
var aa,ii;
//Free surfaces that are still in use
for(aa = ds_list_size(global.isoReflectAreaList)-1;  aa >= 0;  aa -= 1)
{
    //Get id of reflection area instance
    ii = ds_list_find_value(global.isoReflectAreaList, aa);
    //Free reflection area
    with(ii)  iso_reflectArea_free();
}
//Free data structures
if(global.isoReflectList >= 0)
    ds_list_destroy(global.isoReflectList);
if(global.isoReflectAreaList >= 0)
    ds_list_destroy(global.isoReflectAreaList);
//Reset variables
global.isoReflectList = -1;
return true;
