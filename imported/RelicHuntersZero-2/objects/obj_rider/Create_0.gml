///Gameplay
event_inherited();

    playerName = "RED";
    myChar = char_rider;
    
    riderGrenadeCost = 30;
    kamiAllyHp = 0.5;
    kamiAllyDmg = 0.15;
    
    melee_damage = 120;
    
    myGrenadeObject = obj_grenadeKami;
        
    energy_max = 25;
    energy_max_regular = energy_max;
    energy_max_relic = energy_max*2;
    energy = energy_max;
    
    hp_max = 250;
    hp_max_regular = hp_max;
    hp_max_relic = hp_max*2;
    
    
    base_accuracy = 1;
    //Weapon Skills, "1" is perfect, higher is worse
    accPistol = 1;
    accMachinegun = 2;
    accShotgun = 1.5;
    accSniper = 3;
    accSmg = 1;
    accRocket = 3;
    accRifle = 3;
    
    stamina_max = 100;
    stamina = stamina_max;
    
    move_speed_max = 6;
    move_speed_sprint = 8.5;
    move_speed_aiming = 3;
    
    //Sprites
    sprite_idle = spr_rider_idle;
    sprite_walk = spr_rider_walk;
    sprite_sprint = spr_rider_walk;
    sprite_dash = spr_rider_dash;
    sprite_hit = spr_rider_hit;
    sprite_death = spr_rider_death;
    sprite_melee = spr_rider_melee;
    sprite_dash_fx = spr_rider_dash_fx;
    sprite_dig = spr_rider_dig;
    
    


