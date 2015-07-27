//iso_reflectArea_define();
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
rflX1 = x-sprite_xoffset;
rflY1 = y-sprite_yoffset;
rflX2 = x+sprite_width-sprite_xoffset;
rflY2 = y+sprite_height-sprite_yoffset;
return true;
