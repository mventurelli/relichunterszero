///Draw Override

draw_self();

draw_sprite_ext(sprite,sprite_subimage,x,y+draw_height,1,1,sprite_angle,image_blend,1);
reflection_add_sprite_update(sprite,sprite_subimage,x,y-draw_height,1,1,sprite_angle,image_blend,1);
