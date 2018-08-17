///Spawn Chance and Sprites
event_inherited();

if (room != room_boss)
{
    barrelSpawnChance = irandom(3);
    if (barrelSpawnChance) instance_destroy();
}

maxhp = 100;
sprite = spr_redbarrel;
sprite_hit = spr_redbarrel_hit;
sprite_dirt = spr_crate_dirt;

reflection_object_setup(0,spr_redbarrel_reflection,image_index);

//depth = -y+96;

wall_calculate_hp_ranges();
