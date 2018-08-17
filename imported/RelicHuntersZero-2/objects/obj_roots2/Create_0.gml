event_inherited();

maxhp = 150;
sprite = spr_root2;
sprite_hit = spr_root2_hit;
sprite_dirt = spr_longbox_dirt;

breakSprite = spr_root2_break;

reflection_object_setup(-50,sprite_index,image_index);
shadow_object_setup(0,spr_longbox_reflection,image_index,global.default_shadow_yscale);

depth = -y+96;

wall_calculate_hp_ranges();