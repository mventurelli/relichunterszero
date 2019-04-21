///Create the lists
event_inherited();
if (global.isDaily) random_set_seed(global.dailySeed+global.stage_current+global.currentLoop);

//Item Group Design (Spawns One Item Randomly)
    
    item_endlessAmmo_1 = ds_list_create();
    ds_list_add(item_endlessAmmo_1, 
        obj_pickup_heavyammo, 
        obj_pickup_mediumammo, 
        obj_pickup_mediumammo, 
        obj_pickup_lightammo, 
        obj_pickup_lightammo, 
        obj_pickup_lightammo, 
        obj_pickup_grenade,
		obj_pickup_grenade
    );
    
    item_endlessAid_1 = ds_list_create();
    ds_list_add(item_endlessAid_1, 
        obj_pickup_lightammo, 
        obj_pickup_mediumammo, 
        obj_pickup_heavyammo, 
        obj_pickup_grenade,
		obj_pickup_grenade,
		obj_pickup_grenade,
        obj_pickup_shield,
        obj_pickup_shield,
		obj_pickup_shield,
        obj_pickup_superShield
    );
    
    if (!global.challengeHunger) {
        ds_list_add(item_endlessAid_1, obj_pickup_health, obj_pickup_health);
    
        if (random(1) <= 0.1) || (global.relic_rabbit_foot == 2) ds_list_add(item_endlessAid_1, 
            obj_pickup_healthBig,
        );
    }
    
    item_endlessTrash = ds_list_create();
    ds_list_add(item_endlessTrash, 
        obj_pickup_pistol,
        obj_pickup_smg_crude,
        obj_pickup_shotgun_crude,
        obj_pickup_mediumammo,
        obj_pickup_lightammo
    );
    
    if (random(1) <= 0.32) || (global.relic_rabbit_foot == 2) ds_list_add(item_endlessTrash, 
        obj_pickup_sawedoff,
        obj_pickup_pistol_assault
    );
    
    item_endlessTrashPlus = ds_list_create();
    ds_list_add(item_endlessTrashPlus,
        obj_pickup_sawedoff,
        obj_pickup_shotgun,
        obj_pickup_submachinegun,
        obj_pickup_pistol_heavy,
        obj_pickup_pistol_assault,
        obj_pickup_assault_rifle_crude,
        obj_pickup_heavyammo, 
        obj_pickup_mediumammo,
        obj_pickup_lightammo,
        obj_pickup_grenade
    );
    
    if (random(1) <= 0.3) || (global.relic_rabbit_foot == 2) ds_list_add(item_endlessTrashPlus, 
        obj_pickup_assault_rifle,
        obj_pickup_pistol_bouncer,
        obj_pickup_flakCannon,
        obj_pickup_blitz
    );
    

///Create the pool depending on Loop

itemPool = ds_list_create();

if (room == level_storm_1)  {
    ds_list_add(itemPool,
		item_endlessAmmo_1,
		item_endlessAmmo_1,
		item_endlessAmmo_1,
		item_endlessAmmo_1,
		item_endlessAmmo_1,
		item_endlessAmmo_1,
		item_endlessAmmo_1,
		item_endlessAmmo_1,
		item_endlessAmmo_1,
		item_endlessAmmo_1,
		item_endlessAmmo_1,
		item_endlessAmmo_1,
		item_endlessAmmo_1,
		item_endlessAmmo_1,
		item_endlessAid_1,
		item_endlessAid_1,
		item_endlessAid_1,
		item_endlessAid_1,
		item_endlessAid_1,
		item_endlessAid_1,
		item_endlessAid_1,
		item_endlessAid_1,
		item_endlessTrash,
		item_endlessTrash,
		item_endlessTrash,
		item_endlessTrash,
		item_endlessTrash
	);
}

///Add everything to cleanUp list

if (ds_exists(cleanUp,ds_type_list))
{
    ds_list_add(cleanUp, item_endlessAmmo_1);
    ds_list_add(cleanUp, item_endlessAid_1);
    ds_list_add(cleanUp, item_endlessTrash);
    ds_list_add(cleanUp, item_endlessTrashPlus);
    
    ds_list_add(cleanUp, itemPool);
}

