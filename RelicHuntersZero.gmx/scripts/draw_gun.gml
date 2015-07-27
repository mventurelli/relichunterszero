///draw_gun(obj)


    with (class_gun) isActive = false;
    with (obj_gloves) isActive = false;
    with (obj_buckler) isActive = false;
    if instance_exists(argument0) 
    {
        argument0.isActive = true;
        myGun = argument0;
    }
    else return false;
    