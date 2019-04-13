///Gameplay
event_inherited();
    playerName = "ACE";
    myChar = char_ass;
    
    global.relic_rabbit_foot = 2; //<-- Born lucky
    melee_damage = 75;
    
    energy_max = 30;
    energy_max_regular = energy_max;
    energy_max_relic = energy_max*2;
    energy = energy_max;
    
    hp_max = 110;
    hp_max_regular = hp_max;
    hp_max_relic = hp_max*2;
    
    
    base_accuracy = 2;
    //Weapon Skills, "1" is perfect, higher is worse
    accPistol = 2;
    accMachinegun = 1.5;
    accShotgun = 1.5;
    accSniper = 2.5;
    accSmg = 1.5;
    accRocket = 3;
    accRifle = 2;
    
    stamina_max = 100;
    stamina = stamina_max;
    stamina_regen = 0.5;
    energy_regen_speed = 2;
    
    //Sprites
    sprite_idle = spr_ass_idle;
    sprite_walk = spr_ass_walk;
    sprite_sprint = spr_ass_sprint;
    sprite_dash = spr_ass_dash;
    sprite_hit = spr_ass_hit;
    sprite_death = spr_ass_death;
    sprite_melee = spr_ass_melee;
    sprite_dash_fx = spr_ass_dash_fx;
    sprite_dig = spr_ass_dig;
    
    

