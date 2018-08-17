///Global Quality Init
global.reflections = false;
global.persistent_objects = false;
global.shadows = false;

///Reflections
reflection_init();

reflection_add_object(class_player);
reflection_add_object(class_enemy);
reflection_add_object(class_gun);
reflection_add_object(obj_gloves);
reflection_add_object(obj_buckler);
reflection_add_object(class_gun_enemy);
reflection_add_object(class_projectile);
reflection_add_object(class_grenadeNew);
reflection_add_object(obj_wall);
reflection_add_object(obj_wall_stage3);
reflection_add_object(obj_ass);
reflection_add_object(class_character_swap);
reflection_add_object(class_pickup_weapon);
reflection_add_object(class_pickup_ammo);
reflection_add_object(class_pickup_health);
reflection_add_object(fx_teleporter);
reflection_add_object(obj_bigwindow);

reflection_define_area(0,0,room_width,room_height);


///Persistent Objects
global.persistent_draw = noone;

/*global.persistent_draw = surface_create(room_width,room_height);
surface_set_target(global.persistent_draw);
draw_clear_alpha(c_black, 0);
surface_reset_target();


/* */
///Shockwave Shader Init
/*
global.shock_enabled = false;
global.shock_positionX = mouse_x - view_xview;
global.shock_positionY = mouse_y - view_yview;

draw_set_color(c_white);

uni_time = shader_get_uniform(shd_shockwave,"time");
var_time_var = 0;

uni_mouse_pos = shader_get_uniform(shd_shockwave,"mouse_pos");

//uni_mouse_pos = shader_get_uniform(shd_shockwave,"mouse_pos");
//var_mouse_pos_x = mouse_x - view_xview;
//var_mouse_pos_y = mouse_y - view_yview;

uni_resolution = shader_get_uniform(shd_shockwave,"resolution");
var_resolution_x = view_wview;
var_resolution_y = view_hview;

uni_shock_amplitude = shader_get_uniform(shd_shockwave,"shock_amplitude");
var_shock_amplitude = 10;

uni_shock_refraction = shader_get_uniform(shd_shockwave,"shock_refraction");
var_shock_refraction = 0.8;

uni_shock_width = shader_get_uniform(shd_shockwave,"shock_width");
var_shock_width = 0.1;

shader_enabled = true;
full_screen_effect = true;



/* */
///Shadows

shadow_init(0.4);

shadow_add_object(class_player);
shadow_add_object(class_enemy);
shadow_add_object(obj_boss_spawner);
shadow_add_object(class_generator);
shadow_add_object(obj_kamikazelite_flying);
shadow_add_object_tall(obj_wall_stage1);
shadow_add_object_tall(obj_wall_stage2);
shadow_add_object_tall(obj_wall_stage4);
shadow_add_object_tall(obj_wall_halloween);

tall_object = instance_create_layer(x,y,"Interactive_Over",controller_shadow_tall);
//tall_object = instance_create_layer(x,y,"Interactive",controller_shadow_tall);

///Clean-Up

global.surface_view_offset_shadows = 300;
global.surface_view_offset_reflections = 500;

if surface_exists(global.persistent_draw) surface_free(global.persistent_draw);
if surface_exists(global.reflection_surface) surface_free(global.reflection_surface);
if surface_exists(global.shadow_surface) surface_free(global.shadow_surface);


/* */
/*  */
