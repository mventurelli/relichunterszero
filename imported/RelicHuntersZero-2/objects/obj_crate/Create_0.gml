event_inherited();

if (global.currentLoop < 2)  && (room != level_storm_4)
{
    maxhp = 180;
    sprite = spr_crate;
    sprite_hit = spr_crate;
    sprite_dirt = spr_crate_dirt;
    
    reflection_object_setup(0,spr_crate_reflection,image_index);
    shadow_object_setup(0,-1,-1,global.default_shadow_yscale);
}
else{
    maxhp = 625;
    sprite = spr_crateDucan;
    sprite_hit = spr_crateDucan_hit;
    sprite_dirt = spr_crate_dirt;
    
    reflection_object_setup(0,spr_crateDucan_reflection,image_index);
    shadow_object_setup(0,-1,-1,global.default_shadow_yscale);
}

breakObject = fx_crate_break;
depth = -y+96;

wall_calculate_hp_ranges();