/*iso_depth_bringToFront(instanceID/objectIndex);
 *Brings the added instance to the top of the depth stack.
 *In other words, the instance's reflections will be drawn 
 *above all others.
 */
var aa;
aa = ds_list_find_index(global.isoReflectList, argument0);
if(aa >= 0)
{
    ds_list_delete(global.isoReflectList, aa);
    ds_list_add(global.isoReflectList, argument0);
    return true;
}
return false;
