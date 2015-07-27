//iso_reflect_instance(instanceID/objectIndex);
//Allows an instance to reflect in reflection areas.
if(ds_list_find_index(global.isoReflectList, argument0) < 0)
{
    //The instance is not on the list, add it
    ds_list_add(global.isoReflectList, argument0);
    return true;
}
return false;
