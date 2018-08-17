///Interact
event_inherited();

price = priceArray [ min(priceTier,9) ];

if (activationClient != noone) && (active) && (price){
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;
    
    if (wantToActivate) && (in_range) && (idToSpawn) && (charToSpawn  != noone) {
        if (global.bountyEndless >= price){
        
            global.bountyEndless -= price;
            global.endPriceTier_revive++;
            audio_play(activationClient.audio_emitter, false, 1, sfx_buy);
            global.hasPurchasedAnything = true;
            
            var playerSpawned = instance_create_layer(x,y,"Interactive",charToSpawn);
            playerSpawned.myPlayerId = idToSpawn;
                    
            global.playerAlive[idToSpawn] = true;
			global.characterPosition[idToSpawn, 0] = playerSpawned.x;
			global.characterPosition[idToSpawn, 1] = playerSpawned.y;
            global.weapon1[idToSpawn] = noone;
            global.weapon2[idToSpawn] = noone;
            global.weapon1Level[idToSpawn] = 0;
            global.weapon2Level[idToSpawn] = 0;
            global.hp[idToSpawn] = 999999;
            global.overshield[idToSpawn] = 0;
            global.currentlyEquippedWeapon[idToSpawn] = 0;
            global.grenades[idToSpawn] = 0;
            
            with (playerSpawned) event_perform(ev_other,ev_user0);
                    
            global.ammo_light[idToSpawn] = global.reviveAmmoLight;
            global.ammo_medium[idToSpawn] = global.reviveAmmoMedium;
            global.ammo_heavy[idToSpawn] = global.reviveAmmoHeavy;
            
            instance_destroy();
        }
        else{
			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", K_BETU_RED, loc_key("INFO_NOTENOUGHBOUNTY"));
			//guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
            //guiInfo.myString = loc_key("INFO_NOTENOUGHBOUNTY");;
            //guiInfo.colorMain = K_BETU_RED;
            //guiInfo.owner = activationClient;
            audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full);
        }
    }
}

