time++;

if (owner != noone) 
{
	if (time >= slowness)
	{
	    sprite_dash_fx = owner.sprite_dash_fx;
	    sprite_index = sprite_dash_fx;

	    x = owner.x;
	    y = owner.y;
    
	    image_xscale = owner.image_xscale;
    
	    time = 0;
	}
}
