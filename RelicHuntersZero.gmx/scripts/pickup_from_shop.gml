///pickup_from_shop()
//Pickup when you are buying from the shop
    if instance_exists(class_player)
    {
        class_player.play_sound_pickup_weapon = true;
    
        if (class_player.weapon2 == noone)
        {
            class_player.weapon2 = instance_create(class_player.x,class_player.y,gun);
            class_player.weapon2.owner = class_player.id;
            with (class_player)
            {
                draw_gun(weapon2);
            }
    
            instance_destroy();
            exit;
        }
    
        //Specific for Gloves
        if class_player.myGun == obj_gloves
        {
            if class_player.weapon1 == obj_gloves
            {
                new_pickup = instance_create(x,y,obj_pickup_gloves);
                with (obj_gloves)
                {
                    instance_destroy();
                }
                
                class_player.weapon1 = instance_create(class_player.x,class_player.y,gun);
                class_player.weapon1.owner = class_player.id;
                with (class_player)
                {
                    draw_gun(weapon1);
                }
                class_player.weapon1.ammo_current = gun_ammo_current;
                
                instance_destroy();
                exit;
            }
            if class_player.weapon2 == obj_gloves
            {
                new_pickup = instance_create(x,y,obj_pickup_gloves);
                with (obj_gloves)
                {
                    instance_destroy();
                }
                
                class_player.weapon2 = instance_create(class_player.x,class_player.y,gun);
                class_player.weapon2.owner = class_player.id;
                with (class_player)
                {
                    draw_gun(weapon2);
                }
                class_player.weapon2.ammo_current = gun_ammo_current;
                
                instance_destroy();
                exit;
            }   
        }
        
        //Specific for Buckler
        if class_player.myGun == obj_buckler
        {
            if class_player.weapon1 == obj_buckler
            {
                new_pickup = instance_create(x,y,obj_pickup_buckler);
                with (obj_buckler)
                {
                    instance_destroy();
                }
                
                class_player.weapon1 = instance_create(class_player.x,class_player.y,gun);
                class_player.weapon1.owner = class_player.id;
                with (class_player)
                {
                    draw_gun(weapon1);
                }
                class_player.weapon1.ammo_current = gun_ammo_current;
                
                instance_destroy();
                exit;
            }
            if class_player.weapon2 == obj_buckler
            {
                new_pickup = instance_create(x,y,obj_pickup_buckler);
                with (obj_buckler)
                {
                    instance_destroy();
                }
                
                class_player.weapon2 = instance_create(class_player.x,class_player.y,gun);
                class_player.weapon2.owner = class_player.id;
                with (class_player)
                {
                    draw_gun(weapon2);
                }
                class_player.weapon2.ammo_current = gun_ammo_current;
                
                instance_destroy();
                exit;
            }   
        }
        
        if class_player.myGun == class_player.weapon1
        {
            new_pickup = instance_create(x,y,class_pickup_weapon);
            new_pickup.gun = class_player.weapon1.object;
            new_pickup.gun_ammo_current = class_player.weapon1.ammo_current;
            new_pickup.sprite = class_player.weapon1.sprite_index;
            
            with(class_player.weapon1)
            {
                instance_destroy();
            }
            
            if (gun != obj_gloves) && (gun != obj_buckler)
            {
                class_player.weapon1 = instance_create(class_player.x,class_player.y,gun);
                class_player.weapon1.owner = class_player.id;
                with (class_player)
                {
                    draw_gun(weapon1);
                }
                class_player.weapon1.ammo_current = gun_ammo_current;
            }
            else if (gun == obj_gloves)
            {
                instance_create(class_player.x,class_player.y,obj_gloves);
                class_player.weapon2 = obj_gloves;
                class_player.weapon2.owner = class_player.id;
                with (class_player)
                {
                    draw_gun(weapon2);
                }
            }
            else if (gun == obj_buckler)
            {
                instance_create(class_player.x,class_player.y,obj_buckler);
                class_player.weapon2 = obj_buckler;
                class_player.weapon2.owner = class_player.id;
                with (class_player)
                {
                    draw_gun(weapon2);
                }
            }
            
            instance_destroy();
            exit;
        }
        
        if class_player.myGun == class_player.weapon2
        {
            new_pickup = instance_create(x,y,class_pickup_weapon);
            new_pickup.gun = class_player.weapon2.object;
            new_pickup.gun_ammo_current = class_player.weapon2.ammo_current;
            new_pickup.sprite = class_player.weapon2.sprite_index;
            
            with(class_player.weapon2)
            {
                instance_destroy();
            }
            
            if (gun != obj_gloves) && (gun != obj_buckler)
            {
                class_player.weapon2 = instance_create(class_player.x,class_player.y,gun);
                class_player.weapon2.owner = class_player.id;
                with (class_player)
                {
                    draw_gun(weapon2);
                }
                class_player.weapon2.ammo_current = gun_ammo_current;
            }
            else if (gun == obj_gloves)
            {
                instance_create(class_player.x,class_player.y,obj_gloves);
                class_player.weapon2 = obj_gloves;
                class_player.weapon2.owner = class_player.id;
                with (class_player)
                {
                    draw_gun(weapon2);
                }
            }
            else if (gun == obj_buckler)
            {
                instance_create(class_player.x,class_player.y,obj_buckler);
                class_player.weapon2 = obj_buckler;
                class_player.weapon2.owner = class_player.id;
                with (class_player)
                {
                    draw_gun(weapon2);
                }
            }
            
            instance_destroy();
            exit;
        }
    }