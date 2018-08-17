///shadow_init(default_yscale);
global.shadowList = ds_list_create();
global.customShadowList = ds_list_create();
global.shadowListTall = ds_list_create();
global.default_shadow_yscale = argument0;

global.shadow_sprite_subimage[0] = 0;
global.shadow_sprite_x[0] = 0;
global.shadow_sprite_y[0] = 0;
global.shadow_scale_x[0] = 0;
global.shadow_scale_y[0] = 0;
global.shadow_angle[0] = 0;
global.shadow_color[0] = 0;
global.shadow_alpha[0] = 0;

global.shadow_surface = noone;
global.shadow_surface_tall = noone;
