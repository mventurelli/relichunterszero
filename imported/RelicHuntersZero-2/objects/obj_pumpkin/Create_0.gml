event_inherited();

maxhp = 125;
sprite = spr_pumpkin;
sprite_hit = spr_pumpkin_hit;
sprite_dirt = spr_crate_dirt;

breakObject = fx_pumpkin_break;

depth = -y+96;

wall_calculate_hp_ranges();

reflection_object_setup(0,spr_crate_reflection,image_index);
shadow_object_setup(0,-1,-1,global.default_shadow_yscale);


