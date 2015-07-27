///iso_reflectArea_define_ext(x1,y1,x2,y2);
//Add a reflection area to the game. The reflection area cover the
//area of the object's sprite. This function must be called again
//after changing the object's sprite to refresh the area reflected.
//Define new reflection area
rflExists = true;
rflActive = true;
rflError = false;
rflSurface = -1;
//Check if object is NOT already on the reflection area list
if(ds_list_find_index(global.isoReflectAreaList, id) < 0)
    ds_list_add(global.isoReflectAreaList, id);
//Get bounding box
rflX1 = argument0;
rflY1 = argument1;
rflX2 = argument2;
rflY2 = argument3;
return true;
