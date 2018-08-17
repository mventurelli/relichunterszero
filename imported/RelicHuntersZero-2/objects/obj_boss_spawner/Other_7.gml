if (sprite_index == spr_boss_egg_crack)
{
    myCroc = instance_create_layer(x,y,"Interactive",obj_boss);
    
    sprite_index = spr_boss_egg_idle;
    image_index = 0;
}

