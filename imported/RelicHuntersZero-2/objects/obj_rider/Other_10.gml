///Correct myPlayerId initial setup

hp = global.hp[myPlayerId];
overshield = global.overshield[myPlayerId];

    //Starting Gun
    if (room == room_start) || (room == room_tutorial)
    {
        //
    }
    
    show_debug_message("This is Rider spawning her guns, and my playerId is "+string(myPlayerId));
    
    if global.weapon2[myPlayerId] != noone
    {
        show_debug_message("weapon2[myPlayerId] returns "+string(global.weapon2[myPlayerId]));
        
        weapon2 = instance_create_layer(x,y,"Interactive",global.weapon2[myPlayerId]);
		if(global.weapon2_isMod[myPlayerId]){
			var tmpId = global.weapon2_modId[myPlayerId];
			with (weapon2) {
				load_mod_gun_config(tmpId);
			}		
		}
        owner_add_owned_instance(weapon2);
        weapon2.weaponLevel = global.weapon2Level[myPlayerId];
        draw_gun(weapon2);
        if (room!=room_start) weapon2.ammo_current = global.weapon2_ammo[myPlayerId];
    }
    
    if global.weapon1[myPlayerId] != noone
    {
        show_debug_message("weapon1[myPlayerId] returns "+string(global.weapon1[myPlayerId]));
        
        weapon1 = instance_create_layer(x,y,"Interactive",global.weapon1[myPlayerId]);
		if(global.weapon1_isMod[myPlayerId]){
			var tmpId = global.weapon1_modId[myPlayerId];
			with (weapon1) {
				load_mod_gun_config(tmpId);
			}		
		}
        owner_add_owned_instance(weapon1);
        weapon1.weaponLevel = global.weapon1Level[myPlayerId];
        draw_gun(weapon1);
        if (room!=room_start) weapon1.ammo_current = global.weapon1_ammo[myPlayerId];
    }
    else
    {
        weapon1 = instance_create_layer(x,y,"Interactive",obj_pistol);
        owner_add_owned_instance(weapon1);
        draw_gun(weapon1);
    }
       
    //Draw Correct Gun
    if (global.currentlyEquippedWeapon[myPlayerId] == 1) draw_gun(weapon1);
    else if (global.currentlyEquippedWeapon[myPlayerId] == 2) draw_gun(weapon2);
    global.currentlyEquippedWeapon[myPlayerId] = 0;
        
    //Crosshair Position
    global.crosshairX[myPlayerId] = x;
    global.crosshairY[myPlayerId] = y;
    
    //Done
    setup_initial = false;
    
    

