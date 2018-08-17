///Create the global Shop pools
// These are called by the shop objects, that's why they are global
event_inherited();

//Shop Lists
    global.shop_list_1 = ds_list_create();
    global.shop_size_1 = 11;
    if (!global.unlock_light1) ds_list_add(global.shop_list_1, obj_shop_light1);
    if (!global.unlock_pistol_assault) ds_list_add(global.shop_list_1, obj_shop_pistol_assault);
    if (!global.unlock_shotgun) ds_list_add(global.shop_list_1, obj_shop_shotgun);
    if (!global.unlock_light2) ds_list_add(global.shop_list_1, obj_shop_light2);
    if (!global.unlock_medium1) ds_list_add(global.shop_list_1, obj_shop_medium1);
    if (!global.unlock_grenades1) ds_list_add(global.shop_list_1, obj_shop_grenades1);
    if (!global.relic_pineapple1) ds_list_add(global.shop_list_1, obj_shop_pineapple1);
    if (!global.relic_pineapple2) ds_list_add(global.shop_list_1, obj_shop_pineapple2);
    if (!global.relic_pineapple3) ds_list_add(global.shop_list_1, obj_shop_pineapple3);
    if (!global.relic_yottabyte1) ds_list_add(global.shop_list_1, obj_shop_yottabyte1);
    if (!global.unlock_shield1) ds_list_add(global.shop_list_1, obj_shop_shield1);
    
    global.shop_free_1 = ds_list_create();
    ds_list_add(global.shop_free_1, obj_pickup_lightammo, obj_pickup_lightammo, obj_pickup_lightammo, obj_pickup_health, obj_pickup_grenade);
    
    
    global.shop_list_2 = ds_list_create();
    global.shop_size_2 = 16;
    if (!global.unlock_medium2) ds_list_add(global.shop_list_2, obj_shop_medium2);
    if (!global.unlock_grenades2) ds_list_add(global.shop_list_2, obj_shop_grenades2);
    if (!global.unlock_heavy1) ds_list_add(global.shop_list_2, obj_shop_heavy1);
    if (!global.unlock_assault_rifle) ds_list_add(global.shop_list_2, obj_shop_assault_rifle);
    if (!global.unlock_pistol_heavy) ds_list_add(global.shop_list_2, obj_shop_pistol_heavy);
    if (!global.unlock_submachinegun) ds_list_add(global.shop_list_2, obj_shop_submachinegun);
    if (!global.relic_alcoholic1) ds_list_add(global.shop_list_2, obj_shop_alcoholic1);
    if (!global.relic_alcoholic2) ds_list_add(global.shop_list_2, obj_shop_alcoholic2);
    if (!global.relic_alcoholic3) ds_list_add(global.shop_list_2, obj_shop_alcoholic3);
    if (!global.relic_yottabyte2) ds_list_add(global.shop_list_2, obj_shop_yottabyte2);
    if (!global.relic_yottabyte3) ds_list_add(global.shop_list_2, obj_shop_yottabyte3);
    if (!global.relic_watchful1) ds_list_add(global.shop_list_2, obj_shop_watchful1);
    if (!global.relic_watchful2) ds_list_add(global.shop_list_2, obj_shop_watchful2);
    if (!global.relic_watchful3) ds_list_add(global.shop_list_2, obj_shop_watchful3);
    if (!global.relic_crystal1) ds_list_add(global.shop_list_2, obj_shop_crystal1);
    if (!global.unlock_shield2) ds_list_add(global.shop_list_2, obj_shop_shield2);
    
    global.shop_free_2 = ds_list_create();
    ds_list_add(global.shop_free_2, obj_pickup_lightammo, obj_pickup_mediumammo, obj_pickup_lightammo, obj_pickup_health, obj_pickup_grenade);
    
    
    global.shop_list_3 = ds_list_create();
    global.shop_size_3 = 16;
    if (!global.unlock_grenades3) ds_list_add(global.shop_list_3, obj_shop_grenades3);
    if (!global.unlock_heavy2) ds_list_add(global.shop_list_3, obj_shop_heavy2);
    if (!global.unlock_heavy3) ds_list_add(global.shop_list_3, obj_shop_heavy3);
    if (!global.unlock_heavy4) ds_list_add(global.shop_list_3, obj_shop_heavy4);
    if (!global.unlock_pistol_plasma) ds_list_add(global.shop_list_3, obj_shop_pistol_plasma);
    if (!global.unlock_highmag) ds_list_add(global.shop_list_3, obj_shop_highmag);
    if (!global.unlock_machinegun) ds_list_add(global.shop_list_3, obj_shop_machinegun);
    if (!global.unlock_sniper_rifle) ds_list_add(global.shop_list_3, obj_shop_sniper_rifle);
    if (!global.relic_midnight1) ds_list_add(global.shop_list_3, obj_shop_midnight1);
    if (!global.relic_midnight2) ds_list_add(global.shop_list_3, obj_shop_midnight2);
    if (!global.relic_midnight3) ds_list_add(global.shop_list_3, obj_shop_midnight3);
    if (!global.relic_infinity1) ds_list_add(global.shop_list_3, obj_shop_infinity1);
    if (!global.relic_infinity2) ds_list_add(global.shop_list_3, obj_shop_infinity2);
    if (!global.relic_infinity3) ds_list_add(global.shop_list_3, obj_shop_infinity3);
    if (!global.relic_crystal2) ds_list_add(global.shop_list_3, obj_shop_crystal2);
    if (!global.relic_dev1) ds_list_add(global.shop_list_3, obj_shop_dev1);
    
    global.shop_free_3 = ds_list_create();
    ds_list_add(global.shop_free_3, obj_pickup_mediumammo, obj_pickup_heavyammo, obj_pickup_health, obj_pickup_health, obj_pickup_grenade);
    
    
    global.shop_list_4 = ds_list_create();
    global.shop_size_4 = 5;
    
    if (!global.unlock_shotgun_heavy) ds_list_add(global.shop_list_4, obj_shop_shotgun_heavy);
    if (!global.unlock_rocketlauncher) ds_list_add(global.shop_list_4, obj_shop_rocketlauncher);
    if (!global.relic_crystal3) ds_list_add(global.shop_list_4, obj_shop_crystal3);
    if (!global.relic_dev2) ds_list_add(global.shop_list_4, obj_shop_dev2);
    if (!global.relic_dev3) ds_list_add(global.shop_list_4, obj_shop_dev3);
    
    global.shop_free_4 = ds_list_create();
    ds_list_add(global.shop_free_4, obj_pickup_heavyammo, obj_pickup_heavyammo, obj_pickup_heavyammo, obj_pickup_health, obj_pickup_grenade);

///Add everything to cleanUp list

if (ds_exists(cleanUp,ds_type_list))
{
    ds_list_add(cleanUp, global.shop_list_1);
    ds_list_add(cleanUp, global.shop_free_1);
    ds_list_add(cleanUp, global.shop_list_2);
    ds_list_add(cleanUp, global.shop_list_3);
    ds_list_add(cleanUp, global.shop_free_3);
    ds_list_add(cleanUp, global.shop_list_4);
    ds_list_add(cleanUp, global.shop_free_4);
}

