///Unlock and Draw Weapon
price = global.price_light1;
weaponName = loc_key("GENERAL_SHOP_LIGHTAMMO");
name = weaponName;

if (unlock)
{
    global.unlock_light1 = 1;
    ammo_object = obj_pickup_lightammo;
    
    //Pickup
    if (activationClient) && (activationClient != noone)
    {
        var p = activationClient.myPlayerId;
        
        ammo_box = instance_create_layer(x,y,"Interactive",ammo_object);
        ammo_box.want_to_die = false;
        if (sprite_index == spr_pickup_light) && (global.ammo_light[p] < global.ammo_light_max) { global.ammo_light[p] += ammo_box.ammo; ammo_box.want_to_die = true;}
        if (sprite_index == spr_pickup_medium) && (global.ammo_medium[p] < global.ammo_medium_max) { global.ammo_medium[p] += ammo_box.ammo; ammo_box.want_to_die = true;}
        if (sprite_index == spr_pickup_heavy) && (global.ammo_heavy[p] < global.ammo_heavy_max) { global.ammo_heavy[p] += ammo_box.ammo; ammo_box.want_to_die = true;}
        if (sprite_index == spr_pickup_grenade) && (global.grenades[p] < global.grenades_max) { global.grenades[p] += ammo_box.ammo; ammo_box.want_to_die = true;}

        if (ammo_box.want_to_die) ammo_box.isInteractiveObjectActive = false
    }
    instance_destroy();
}
else event_inherited();

