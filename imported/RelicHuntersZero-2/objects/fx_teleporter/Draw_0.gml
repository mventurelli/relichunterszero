if (owner != noone)
{
	if (owner.active)
	{
	    draw_self();
	    reflection_object_setup(25,-1,image_index);
	}
	else
	{
	    reflection_object_setup(25,sprite_index,3);
	}
}
else {
	reflection_object_setup(25,sprite_index,3);
}
