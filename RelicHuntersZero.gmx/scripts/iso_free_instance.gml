//iso_free_instance(instanceID/objectIndex);
//Stops an instance from being reflected in reflection areas.
var index;
index = ds_list_find_index(global.isoReflectList, argument0);
if(index >= 0)
{
    //The instance is on the list, remove it
    ds_list_delete(global.isoReflectList, index);
    return true;
}
return false;
