event_inherited();

breakObject = fx_barrel_break;

maxhp = 600;
hp = maxhp;

isVulnerable = false;

sprite = spr_generatorOff;
sprite_hit = spr_generator_hit;
sprite_dirt = spr_crate_dirt;
image_blend = c_red;

depth = -y;
image_speed = 0;

wall_calculate_hp_ranges();

reflection_object_setup(0,spr_crate_reflection,image_index);
shadow_object_setup(0,sprite,0,global.default_shadow_yscale);

activationPhase = 0;



