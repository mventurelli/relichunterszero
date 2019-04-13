///Create the global Shop pools
// These are called by the shop objects, that's why they are global

event_inherited();

if (global.isDaily) random_set_seed(global.dailySeed+global.stage_current+global.currentLoop);

//Resource
global.endShop_resources = ds_list_create();
ds_list_add(global.endShop_resources, 
    obj_endShop_ammoLight, 
    obj_endShop_ammoMedium, 
    obj_endShop_ammoHeavy,
    obj_endShop_ammoGrenades,
    obj_endShop_overshield,
    obj_endShop_health
);

//Tier 1 //////////////////
global.endShop_tier[1] = ds_list_create();

if (!check_weapon_owned(obj_shotgun,1)) ds_list_add(global.endShop_tier[1],obj_endShop_shotgun);
if (!check_weapon_owned(obj_submachinegun,1)) ds_list_add(global.endShop_tier[1],obj_endShop_smg);
if (!check_weapon_owned(obj_pistol_heavy,1)) ds_list_add(global.endShop_tier[1],obj_endShop_heavyPistol);
if (!check_weapon_owned(obj_assault_rifle_crude,1)) ds_list_add(global.endShop_tier[1],obj_endShop_crudeAssaultRifle);
if (!check_weapon_owned(obj_pistol_assault,1)) ds_list_add(global.endShop_tier[1],obj_endShop_assaultPistol);
if (!check_weapon_owned(obj_sawedoff,1)) ds_list_add(global.endShop_tier[1],obj_endShop_sawedoff);

if (!global.relic_watchful_eye) ds_list_add(global.endShop_tier[1],obj_endShop_watchfulEye);
if (!global.relic_alcoholic_carrot) ds_list_add(global.endShop_tier[1],obj_endShop_alcoholicCarrot);
if (!global.relic_infinity_battery) ds_list_add(global.endShop_tier[1],obj_endShop_infinityBattery);
if (!global.relic_pineapple_pudding) ds_list_add(global.endShop_tier[1],obj_endShop_pineapplePudding);
if (!global.relic_mega_quantum_chip) ds_list_add(global.endShop_tier[1],obj_endShop_megaQuantumChip);
if (!global.relic_actual_carrot) ds_list_add(global.endShop_tier[1],obj_endShop_actual_carrot);
if (!global.relic_black_cat) ds_list_add(global.endShop_tier[1],obj_endShop_black_cat);
if (!global.relic_multitool) ds_list_add(global.endShop_tier[1],obj_endShop_multitool);

if (random(1) <= 0.4) || (global.relic_rabbit_foot == 2) {
    if (!check_weapon_owned(obj_bouncer,1)) ds_list_add(global.endShop_tier[1], obj_endShop_bouncer);
    if (!check_weapon_owned(obj_pistol_bouncer,1)) ds_list_add(global.endShop_tier[1], obj_endShop_bouncerPistol);
    if (!check_weapon_owned(obj_pistol_blast,1)) ds_list_add(global.endShop_tier[1], obj_endShop_blastPistol);
    
    if (!global.relic_morning_star) ds_list_add(global.endShop_tier[1],obj_endShop_morningStar);
    if (!global.relic_rabbit_foot) ds_list_add(global.endShop_tier[1],obj_endShop_rabbitFoot);
}

//Tier 2 //////////////////
global.endShop_tier[2] = ds_list_create();

if (!check_weapon_owned(obj_machinegun,1)) ds_list_add(global.endShop_tier[2], obj_endShop_machinegun);
if (!check_weapon_owned(obj_assault_rifle,1)) ds_list_add(global.endShop_tier[2], obj_endShop_assaultRifle);
if (!check_weapon_owned(obj_shotgun_heavy,1)) ds_list_add(global.endShop_tier[2], obj_endShop_heavyShotgun);
if (!check_weapon_owned(obj_pistol_plasma,1)) ds_list_add(global.endShop_tier[2], obj_endShop_plasmaPistol);
if (!check_weapon_owned(obj_sniper_rifle,1)) ds_list_add(global.endShop_tier[2], obj_endShop_sniperRifle);
if (!check_weapon_owned(obj_flakCannon,1)) ds_list_add(global.endShop_tier[2], obj_endShop_flakCannon);
if (!check_weapon_owned(obj_minigun,1)) ds_list_add(global.endShop_tier[2], obj_endShop_minigun);
if (!check_weapon_owned(obj_highmag,1)) ds_list_add(global.endShop_tier[2], obj_endShop_highmag);

if (!global.relic_yottabyte_drive) ds_list_add(global.endShop_tier[2],obj_endShop_yottabyteDrive);
if (!global.relic_pineapple_pie) ds_list_add(global.endShop_tier[2],obj_endShop_pineapplePie);
if (!global.relic_midnight_beer) ds_list_add(global.endShop_tier[2],obj_endShop_midnightBeer);
if (!global.relic_shell_candy) ds_list_add(global.endShop_tier[2],obj_endShop_shell_candy);
if (!global.relic_purple_juice) ds_list_add(global.endShop_tier[2],obj_endShop_purple_juice);
if (!global.relic_rabbit_ears) ds_list_add(global.endShop_tier[2],obj_endShop_rabbit_ears);
if (!global.relic_fire_freak) ds_list_add(global.endShop_tier[2],obj_endShop_fire_freak);

if (random(1) <= 0.4) || (global.relic_rabbit_foot == 2) {
    if (!check_weapon_owned(obj_rocketlauncher,1)) ds_list_add(global.endShop_tier[2], obj_endShop_rocketLauncher);
    if (!check_weapon_owned(obj_pistol_relic,1)) ds_list_add(global.endShop_tier[2], obj_endShop_relicPistol);
    if (!check_weapon_owned(obj_blitz,1)) ds_list_add(global.endShop_tier[2], obj_endShop_blitz);
    if (!check_weapon_owned(obj_kamilauncher,1)) ds_list_add(global.endShop_tier[2], obj_endShop_kamilauncher);
}

//Tier 3 //////////////////
global.endShop_tier[3] = ds_list_create();

if (!check_weapon_owned(obj_smg_plasma,1)) ds_list_add(global.endShop_tier[3], obj_endShop_plasmaSMG);
if (!check_weapon_owned(obj_assault_rifle,1)) ds_list_add(global.endShop_tier[3], obj_endShop_assaultRifle);
if (!check_weapon_owned(obj_smg_relic,1)) ds_list_add(global.endShop_tier[3], obj_endShop_relicSMG);
if (!check_weapon_owned(obj_shotgun_relic,1)) ds_list_add(global.endShop_tier[3], obj_endShop_relicShotgun);
if (!check_weapon_owned(obj_rocketlauncher,1)) ds_list_add(global.endShop_tier[3], obj_endShop_rocketLauncher);
if (!check_weapon_owned(obj_relicCannon,1)) ds_list_add(global.endShop_tier[3], obj_endShop_relicCannon);
if (!check_weapon_owned(obj_minigun_relic,1)) ds_list_add(global.endShop_tier[3], obj_endShop_relicMinigun);

if (!global.relic_dev_potion) ds_list_add(global.endShop_tier[3],obj_endShop_devPotion);
if (!global.relic_midnight_meal) ds_list_add(global.endShop_tier[3],obj_endShop_midnightMeal);
if (!global.relic_yottabyte_processor) ds_list_add(global.endShop_tier[3],obj_endShop_yottabyteProcessor);
if (!global.relic_loaf_of_bread) ds_list_add(global.endShop_tier[3],obj_endShop_loaf_of_bread);
if (!global.relic_blood_moon) ds_list_add(global.endShop_tier[3],obj_endShop_blood_moon);
if (!global.relic_pure_sand) ds_list_add(global.endShop_tier[3],obj_endShop_pure_sand);

if (random(1) <= 0.4) || (global.relic_rabbit_foot == 2) {
    if (!check_weapon_owned(obj_rifle_relic,1)) ds_list_add(global.endShop_tier[3], obj_endShop_relicRifle);
    if (!check_weapon_owned(obj_sniper_relic,1)) ds_list_add(global.endShop_tier[3], obj_endShop_relicSniper);
    if (!check_weapon_owned(obj_rocket_relic,1)) ds_list_add(global.endShop_tier[3], obj_endShop_relicRocket);
    
    if (!global.relic_crystal_bacon) ds_list_add(global.endShop_tier[3],obj_endShop_crystalBacon);
}

//Clean items from last visit from the lists
if (global.endTierItem1 != noone) for (i=1; i<4; i++){
    testItem1 = ds_list_find_index(global.endShop_tier[i],global.endTierItem1);
    if (testItem1 != -1) {
        ds_list_delete(global.endShop_tier[i],testItem1);
        show_debug_message("Found a pre-existing item on slot1, deleting");
        break;
    }
}

if (global.endTierItem2 != noone) for (i=1; i<4; i++){
    testItem2 = ds_list_find_index(global.endShop_tier[i],global.endTierItem2);
    if (testItem2 != -1) {
        ds_list_delete(global.endShop_tier[i],testItem2);
        show_debug_message("Found a pre-existing item on slot2, deleting");
        break;
    }
}

if (global.endTierItem3 != noone) for (i=1; i<4; i++){
    testItem3 = ds_list_find_index(global.endShop_tier[i],global.endTierItem3);
    if (testItem3 != -1) {
        ds_list_delete(global.endShop_tier[i],testItem3);
        show_debug_message("Found a pre-existing item on slot3, deleting");
        break;
    }
}

// add as much mod weapons as available
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
		ds_list_add(global.endShop_tier[modTier], obj_endShop_mod_gun);
	}
}

///Add everything to cleanUp list

if (ds_exists(cleanUp,ds_type_list))
{
    ds_list_add(cleanUp, global.endShop_resources);
    ds_list_add(cleanUp, global.endShop_tier[1]);
    ds_list_add(cleanUp, global.endShop_tier[2]);
    ds_list_add(cleanUp, global.endShop_tier[3]);
}
