///Create the item pools

event_inherited();

//Weapons //////////////////
weapons[K_RARITY_COMMON] = ds_list_create();
ds_list_add(weapons[K_RARITY_COMMON], 
    obj_pickup_shotgun,
    obj_pickup_submachinegun,
    obj_pickup_pistol_heavy,
    obj_pickup_pistol_assault,
    obj_pickup_pistol_bouncer
);

weapons[K_RARITY_UNCOMMON] = ds_list_create();
ds_list_add(weapons[K_RARITY_UNCOMMON], 
    obj_pickup_bouncer,
	obj_pickup_highmag,
    obj_pickup_machinegun,
    obj_pickup_pistol_plasma,
    obj_pickup_flakCannon,
    obj_pickup_minigun,
	obj_pickup_pistol_blast,
	obj_pickup_spookyPistol,
);

weapons[K_RARITY_RARE] = ds_list_create();
ds_list_add(weapons[K_RARITY_RARE], 
    obj_pickup_spooky_beamer,
	obj_pickup_blitz,
	obj_pickup_sniper_rifle,
	obj_pickup_assault_rifle,
	obj_pickup_spookyReaper,
	obj_pickup_shotgun_heavy,
	obj_pickup_pistol_relic,
	obj_pickup_kamilauncher,
	obj_pickup_smg_plasma,
	obj_pickup_smg_blast,
	obj_pickup_pistol_fire,
	obj_pickup_rifle_blast,
	obj_pickup_smg_fire
);

weapons[K_RARITY_EPIC] = ds_list_create();
ds_list_add(weapons[K_RARITY_EPIC], 
    obj_pickup_smg_relic,
    obj_pickup_rocketlauncher_relic,
    obj_pickup_rifle_relic,
    obj_pickup_sniper_relic,
    obj_pickup_shotgun_relic,
    obj_pickup_sniper_ghost,
    obj_pickup_minigun_relic,
    obj_pickup_relicCannon,
	obj_pickup_ducan_plasma,
	obj_pickup_ducan_rifle,
	obj_pickup_ducan_shotgun,
	obj_pickup_bossGun
);

// Add as many Mod weapons as are available
// check if player 1 or 2 have this mod already
if !global.isDaily
{
	for (var modIndex = 0; modIndex < ds_list_size(global.steamUGCItemsList); modIndex++) {

		var modData = global.steamUGCItemsDataMap[? global.steamUGCItemsList[| modIndex]];
	
		//only gun mods exist so far
		if (modData[? "type"] != "gun") continue;
		if (check_weapon_mod_owned(modData[? "id"],1)) continue;
		if (global.playerCount == 2 && check_weapon_mod_owned(modData[? "id"],2)) continue;

		var modTier = modData[? "tier"];
		modTier = max(1, min(3, modTier));
		ds_list_add(weapons[modTier], obj_pickup_mod_gun);
	}
}

//Relics //////////////////////
relics[K_RARITY_COMMON] = ds_list_create();
if (global.relic_watchful_eye != 2) ds_list_add(relics[K_RARITY_COMMON], obj_relic_watchful_eye);
if (global.relic_alcoholic_carrot != 2) ds_list_add(relics[K_RARITY_COMMON], obj_relic_alcoholic_carrot);
if (global.relic_pineapple_pudding != 2) ds_list_add(relics[K_RARITY_COMMON], obj_relic_pineapple_pudding);
if (global.relic_infinity_battery != 2) ds_list_add(relics[K_RARITY_COMMON], obj_relic_infinity_battery);
if (global.relic_mega_quantum_chip != 2) ds_list_add(relics[K_RARITY_COMMON], obj_relic_mega_quantum_chip);
if (global.relic_rabbit_foot != 2) ds_list_add(relics[K_RARITY_COMMON], obj_relic_rabbit_foot);
if (global.relic_black_cat != 2) ds_list_add(relics[K_RARITY_COMMON], obj_relic_black_cat);

relics[K_RARITY_UNCOMMON] = ds_list_create();
if (global.relic_yottabyte_drive != 2) ds_list_add(relics[K_RARITY_UNCOMMON], obj_relic_yottabyte_drive);
if (global.relic_pineapple_pie != 2) ds_list_add(relics[K_RARITY_UNCOMMON], obj_relic_pineapple_pie);
if (global.relic_midnight_beer != 2) ds_list_add(relics[K_RARITY_UNCOMMON], obj_relic_midnight_beer);
if (global.relic_morning_star != 2) ds_list_add(relics[K_RARITY_UNCOMMON], obj_relic_morning_star);
if (global.relic_actual_carrot != 2) ds_list_add(relics[K_RARITY_UNCOMMON], obj_relic_actual_carrot);
if (global.relic_multitool != 2) ds_list_add(relics[K_RARITY_UNCOMMON], obj_relic_multitool);

relics[K_RARITY_RARE] = ds_list_create();
if (global.relic_midnight_meal != 2) ds_list_add(relics[K_RARITY_RARE], obj_relic_midnight_meal);
if (global.relic_yottabyte_processor != 2) ds_list_add(relics[K_RARITY_RARE], obj_relic_yottabyte_processor);
if (global.relic_fire_freak != 2) ds_list_add(relics[K_RARITY_RARE], obj_relic_fire_freak);
if (global.relic_rabbit_ears != 2) ds_list_add(relics[K_RARITY_RARE], obj_relic_rabbit_ears);
if (global.relic_shell_candy != 2) ds_list_add(relics[K_RARITY_RARE], obj_relic_shell_candy);

relics[K_RARITY_EPIC] = ds_list_create();
if (global.relic_purple_juice != 2) ds_list_add(relics[K_RARITY_EPIC], obj_relic_purple_juice);
if (global.relic_pure_sand != 2) ds_list_add(relics[K_RARITY_EPIC], obj_relic_pure_sand);
if (global.relic_loaf_of_bread != 2) ds_list_add(relics[K_RARITY_EPIC], obj_relic_loaf_of_bread);
if (global.relic_blood_moon != 2) ds_list_add(relics[K_RARITY_EPIC], obj_relic_blood_moon);
if (global.relic_crystal_bacon != 2) ds_list_add(relics[K_RARITY_EPIC], obj_relic_crystal_bacon);
if (global.relic_dev_potion != 2) ds_list_add(relics[K_RARITY_EPIC], obj_relic_dev_potion);



///Add everything to cleanUp list

if (ds_exists(cleanUp,ds_type_list))
{
    ds_list_add(cleanUp, weapons[K_RARITY_COMMON]);
    ds_list_add(cleanUp, weapons[K_RARITY_UNCOMMON]);
    ds_list_add(cleanUp, weapons[K_RARITY_RARE]);
	ds_list_add(cleanUp, weapons[K_RARITY_EPIC]);
	ds_list_add(cleanUp, relics[K_RARITY_COMMON]);
    ds_list_add(cleanUp, relics[K_RARITY_UNCOMMON]);
    ds_list_add(cleanUp, relics[K_RARITY_RARE]);
	ds_list_add(cleanUp, relics[K_RARITY_EPIC]);
}

