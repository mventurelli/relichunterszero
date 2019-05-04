event_inherited();

if (global.currentLoop < 2)  && (room != level_storm_4)
{
    maxhp = 140;
    sprite = spr_barrel;
    sprite_hit = spr_barrel_hit;
    sprite_dirt = spr_crate_dirt; 
    reflection_object_setup(0,spr_barrel_reflection,image_index);
}
else {
    maxhp = 500;
    sprite = spr_barrelDucan;
    sprite_hit = spr_barrelDucan_hit;
    sprite_dirt = spr_crate_dirt;
    reflection_object_setup(0,spr_barrelDucan_reflection,image_index);
}

breakObject = fx_barrel_break;

depth = -y+96;

wall_calculate_hp_ranges();

