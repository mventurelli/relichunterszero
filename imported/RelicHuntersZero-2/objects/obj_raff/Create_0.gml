///Gameplay
event_inherited();

    playerName = "RAFF";
    myChar = char_raff;
    
    energy_max = 60;
    energy_max_regular = energy_max;
    energy_max_relic = energy_max*2;
    energy = energy_max;
    
    hp_max = 100;
    hp_max_regular = hp_max;
    hp_max_relic = hp_max*2;
    
    base_accuracy = 1;
    //Weapon Skills, "1" is perfect, higher is worse
    accPistol = 1;
    accMachinegun = 1;
    accShotgun = 1;
    accSniper = 1;
    accSmg = 1;
    accRocket = 1;
    accRifle = 1;
    
    stamina_max = 100;
    stamina = stamina_max;
    energy_regen_speed = 2;
    
    //Sprites
    sprite_idle = spr_raff_idle;
    sprite_walk = spr_raff_walk;
    sprite_sprint = spr_raff_sprint;
    sprite_dash = spr_raff_dash;
    sprite_hit = spr_raff_hit;
    sprite_death = spr_raff_death;
    sprite_melee = spr_raff_melee;
    sprite_dash_fx = spr_raff_dash_fx;
    sprite_dig = spr_raff_dig;
    

