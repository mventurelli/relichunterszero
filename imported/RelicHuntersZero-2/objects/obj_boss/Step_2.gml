///Depth Adjustment & death
depth = -y;
if (my_gun != noone)
{
    my_gun.depth = depth-2;
}


//death
if hp <= 0
{
    repeat(coins) instance_create_layer(x,y,"Interactive",obj_pickup_coin);
	repeat (coins) instance_create_layer(x,y,"Interactive",obj_pickup_scrap);
    
    myCorpse = instance_create_layer(x,y,"Interactive",fx_corpse_boss);
    myCorpse.image_xscale = image_xscale;
    myCorpse.image_yscale = image_yscale;
    
    if (pushed)
    {
        myCorpse.speed = push_speed*2 * delta_time * ms_to_s_60;
        myCorpse.direction = push_direction;
    }
	
    instance_destroy();
}
