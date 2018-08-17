///Gameplay
event_inherited();

    receivedLevelEndHealing = false;

    playerName = "BIU";
    myChar = char_biu;
    
    melee_damage = 150;
    melee_stamina_cost = 15;
    
    energy_max = 0;
    energy_max_regular = energy_max;
    energy_max_relic = energy_max*2;
    energy = energy_max;
    
    hp_max = 260;
    hp_max_regular = hp_max;
    hp_max_relic = hp_max*2;
    
    
    base_accuracy = 1;
    //Weapon Skills, "1" is perfect, higher is worse
    accPistol = 2;
    accMachinegun = 2;
    accShotgun = 1.5;
    accSniper = 3;
    accSmg = 2;
    accRocket = 3;
    accRifle = 3;
    
    
    stamina_max = 100;
    stamina = stamina_max;
    stamina_regen = 0.7;
    energy_regen_speed = 2;
    
    move_speed_max = 5;
    move_speed_sprint = 7.5;
    move_speed_aiming = 3;
    
    //Sprites
    sprite_idle = spr_biu_idle;
    sprite_walk = spr_biu_walk;
    sprite_sprint = spr_biu_sprint;
    sprite_dash = spr_biu_dash;
    sprite_hit = spr_biu_hit;
    sprite_death = spr_biu_death;
    sprite_melee = spr_biu_melee;
    sprite_dash_fx = spr_biu_dash_fx;
    sprite_dig = spr_biu_dig;
    

    

