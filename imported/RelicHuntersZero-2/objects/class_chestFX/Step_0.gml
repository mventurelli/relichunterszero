///Spawn

if (!spawned) && (image_index >= spawnFrame){
    spawned = true;
    
    if (!spawnCoins) {
		//show_debug_message("class_chestFX step");
        var spawn = instance_create_layer(x,y,"GUI",fx_digItem);
        spawn.itemSprite = spawnSprite;
        spawn.endlessRelic = spawnRelic;
        spawn.endlessWeapon = spawnWeapon;
		owner_add_activated_instance_ex(spawn, activationClient);
    }
    else {
        alarm[0] = 1;
    }
    
    if (spawnChallenge != "") && (ds_exists(global.challengeList,ds_type_list)) {
        var listName = "";
        var stringChallenge = "";
        var stringDescription = "";
    
        switch (spawnChallenge){
            case "CHALLENGE_HUNTED" : if (!global.challengeHunted){ 
                global.challengeHunted=true; 
                stringChallenge="CHALLENGE_HUNTED"; 
                stringDescription="CHALLENGE_HUNTED_DESC"; 
                listName="CHALLENGE_HUNTED"; 
                global.challengeHuntedTimer = global.challengeHuntedRounds;
            }
            break;
            case "CHALLENGE_HAUNTED" : if (!global.challengeHaunted) && (room != levelHalloween_3) { 
                global.challengeHaunted=true; 
                stringChallenge="CHALLENGE_HAUNTED"; 
                stringDescription="CHALLENGE_HAUNTED_DESC"; 
                listName="CHALLENGE_HAUNTED"; 
                global.challengeHauntedTimer = global.challengeHauntedRounds;
                }
            break;
        };
        
        //Spawn Halloween candy
        if (spawnChallenge == "CHALLENGE_HAUNTED") {
            repeat(irandom_range(4,7)) instance_create_layer(x,y,"Interactive",obj_pickup_candy);
            repeat(irandom_range(4,7)) instance_create_layer(x,y,"Interactive",obj_pickup_candyLarge);
        }
        
        if (listName != "") {
            ds_list_add(global.challengeList, listName);
            
            var announceChallenge = instance_create_layer(x,y,"GUI",fx_bigMessage);
            announceChallenge.textBigColor = K_BETU_RED;
            announceChallenge.hunterUnlockSprite = spr_challengeUnique;
            announceChallenge.textBig = loc_key(stringChallenge);
            announceChallenge.textSmall = loc_key(stringDescription);
        }
    }
}

