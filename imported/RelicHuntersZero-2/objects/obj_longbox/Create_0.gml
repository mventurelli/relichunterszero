///Setup
event_inherited();

myFlag = noone;

if (global.currentLoop < 2) && (room != level_storm_4)
{
    maxhp = 350;
    sprite = spr_longbox;
    sprite_hit = spr_longbox_hit;
    sprite_dirt = spr_longbox_dirt;
    
    reflection_object_setup(0,spr_longbox_reflection,image_index);
    shadow_object_setup(0,spr_longbox_reflection,image_index,global.default_shadow_yscale);
}
else{
    maxhp = 1100;
    sprite = spr_longboxDucan;
    sprite_hit = spr_longboxDucan_hit;
    sprite_dirt = spr_longbox_dirt;
    
    reflection_object_setup(0,spr_longboxDucan_reflection,image_index);
    shadow_object_setup(0,spr_longboxDucan_reflection,image_index,global.default_shadow_yscale);
    
    if (irandom(2) = 0) {
        myFlag = instance_create_layer(x+62,y-68,"Interactive",fx_ducanFlag);
        owner_add_owned_instance(myFlag);
    }
}

breakObject = fx_longbox_break;
depth = -y+96;

wall_calculate_hp_ranges();
