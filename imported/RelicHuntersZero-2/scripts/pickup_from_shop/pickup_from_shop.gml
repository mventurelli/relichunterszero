///pickup_from_shop()
//Pickup when you are buying from the shop
if (activationClient != noone)
    {
        activationClient.play_sound_pickup_weapon = true;
    
        if (activationClient.weapon2 == noone)
        {
            activationClient.weapon2 = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gun);
            with (activationClient)
            {
				owner_add_owned_instance(weapon2);
                draw_gun(weapon2);
            }
    
            instance_destroy();
            exit;
        }
    
        //Specific for Gloves
        if activationClient.myGun == obj_gloves
        {
            if activationClient.weapon1 == obj_gloves
            {
                new_pickup = instance_create_layer(x,y,"GUI",obj_pickup_gloves);
                with (obj_gloves)
                {
                    instance_destroy();
                }
                
                activationClient.weapon1 = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gun);
                with (activationClient)
                {
					owner_add_owned_instance(weapon1);
                    draw_gun(weapon1);
                }
                activationClient.weapon1.ammo_current = gun_ammo_current;
                
                instance_destroy();
                exit;
            }
            if activationClient.weapon2 == obj_gloves
            {
                new_pickup = instance_create_layer(x,y,"GUI",obj_pickup_gloves);
                with (obj_gloves)
                {
                    instance_destroy();
                }
                
                activationClient.weapon2 = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gun);
                with (activationClient)
                {
					owner_add_owned_instance(weapon2);
                    draw_gun(weapon2);
                }
                activationClient.weapon2.ammo_current = gun_ammo_current;
                
                instance_destroy();
                exit;
            }   
        }
        
        //Specific for Buckler
        if activationClient.myGun == obj_buckler
        {
            if activationClient.weapon1 == obj_buckler
            {
                new_pickup = instance_create_layer(x,y,"GUI",obj_pickup_buckler);
                with (obj_buckler)
                {
                    instance_destroy();
                }
                
                activationClient.weapon1 = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gun);
                with (activationClient)
                {
					owner_add_owned_instance(weapon1);
                    draw_gun(weapon1);
                }
                activationClient.weapon1.ammo_current = gun_ammo_current;
                
                instance_destroy();
                exit;
            }
            if activationClient.weapon2 == obj_buckler
            {
                new_pickup = instance_create_layer(x,y,"GUI",obj_pickup_buckler);
                with (obj_buckler)
                {
                    instance_destroy();
                }
                
                activationClient.weapon2 = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gun);
                with (activationClient)
                {
					owner_add_owned_instance(weapon2);
                    draw_gun(weapon2);
                }
                activationClient.weapon2.ammo_current = gun_ammo_current;
                
                instance_destroy();
                exit;
            }   
        }
        
        if activationClient.myGun == activationClient.weapon1
        {
            new_pickup = instance_create_layer(x,y,"Interactive",class_pickup_weapon);
            new_pickup.gun = activationClient.weapon1.object;
            new_pickup.gun_ammo_current = activationClient.weapon1.ammo_current;
            new_pickup.sprite = activationClient.weapon1.sprite_index;
            
            with(activationClient.weapon1)
            {
                instance_destroy();
            }
            
            if (gun != obj_gloves) && (gun != obj_buckler)
            {
                activationClient.weapon1 = instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,gun);
                with (activationClient)
                {	
					owner_add_owned_instance(weapon1);
                    draw_gun(weapon1);
                }
                activationClient.weapon1.ammo_current = gun_ammo_current;
            }
            else if (gun == obj_gloves)
            {
                instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,obj_gloves);
                activationClient.weapon2 = obj_gloves;
                with (activationClient)
                {
					owner_add_owned_instance(weapon2);
                    draw_gun(weapon2);
                }
            }
            else if (gun == obj_buckler)
            {
                instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,obj_buckler);
                activationClient.weapon2 = obj_buckler;
                with (activationClient)
                {
					owner_add_owned_instance(weapon2);
                    draw_gun(weapon2);
                }
            }
            
            instance_destroy();
            exit;
        }
        
        if activationClient.myGun == activationClient.weapon2
        {
            new_pickup = instance_create_layer(x,y,"Interactive",class_pickup_weapon);
            new_pickup.gun = activationClient.weapon2.object;
            new_pickup.gun_ammo_current = activationClient.weapon2.ammo_current;
            new_pickup.sprite = activationClient.weapon2.sprite_index;
            
            with(activationClient.weapon2)
            {
                instance_destroy();
            }
            
            if (gun != obj_gloves) && (gun != obj_buckler)
            {
                activationClient.weapon2 = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gun);
                with (activationClient)
                {
					owner_add_owned_instance(weapon2);
                    draw_gun(weapon2);
                }
                activationClient.weapon2.ammo_current = gun_ammo_current;
            }
            else if (gun == obj_gloves)
            {
                instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",obj_gloves);
                activationClient.weapon2 = obj_gloves;
                with (activationClient)
                {
					owner_add_owned_instance(weapon2);
                    draw_gun(weapon2);
                }
            }
            else if (gun == obj_buckler)
            {
                instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",obj_buckler);
                activationClient.weapon2 = obj_buckler;
                with (activationClient)
                {
					owner_add_owned_instance(weapon2);
                    draw_gun(weapon2);
                }
            }
            
            instance_destroy();
            exit;
        }
        //If you got to this part, something went wrong!
        show_debug_message("ERROR: Player has failed to Equip Shop Weapon");
    }
    else show_debug_message("ERROR: Shop weapon has no Activation Client!");
