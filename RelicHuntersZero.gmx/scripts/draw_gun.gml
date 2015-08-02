///draw_gun(obj)

if (instance_exists(weapon1)) with (weapon1) isActive = false;
if (instance_exists(weapon2)) with (weapon2) isActive = false;
if instance_exists(argument0) 
{
    argument0.isActive = true;
    myGun = argument0;
}
else return false;
    
    
    
    /* OLD
    
    with (class_gun) isActive = false;
    with (obj_gloves) isActive = false;
    with (obj_buckler) isActive = false;
    if instance_exists(argument0) 
    {
        argument0.isActive = true;
        myGun = argument0;
    }
    else return false;
    
