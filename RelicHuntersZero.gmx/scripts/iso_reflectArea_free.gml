//iso_reflectArea_free();
//Frees a reflection area from memory.
var index;
//Check if the reflection area still exists
if(rflExists)
{
    //Define new reflection area
    rflExists = false;
    rflActive = false;
    rflError = false;
    //Remove from reflection area list
    index = ds_list_find_index(global.isoReflectAreaList, id);
    if(index != -1)
        ds_list_delete(global.isoReflectAreaList, index);
    //Delete surface
    if(surface_exists(rflSurface))
        surface_free(rflSurface);
    rflSurface = -1;
    return true;
}
return false;
