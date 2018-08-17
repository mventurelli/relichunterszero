///Main Draw

draw_self();

draw_sprite_ext(sprite,sprite_subimage,x,y+draw_height,1,1,image_angle,image_blend,alpha);
reflection_add_sprite_update(sprite,sprite_subimage,x,y-draw_height,1,1,image_angle,image_blend,1);



