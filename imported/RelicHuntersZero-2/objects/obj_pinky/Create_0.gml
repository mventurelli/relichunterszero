///Gameplay
event_inherited();

    playerName = "PINKYY";
    myChar = char_pinky;
    
    myGrenadeObject = obj_grenadeSuperShield;
    
    melee_damage = 120;
    
    energy_max = 30;
    energy_max_regular = energy_max;
    energy_max_relic = energy_max*2;
    energy = energy_max;
    
    hp_max = 280;
    hp_max_regular = hp_max;
    hp_max_relic = hp_max*2;
    
    stamina_max = 100;
    stamina = stamina_max;
    energy_regen_speed = 2;

    energy_regen_time = 2000000;//room_speed*2;
    energy_regen_time_regular = energy_regen_time;
    energy_regen_time_relic = energy_regen_time;
    
    base_accuracy = 1;
    //Weapon Skills, "1" is perfect, higher is worse
    accPistol = 1;
    accMachinegun = 1.5;
    accShotgun = 1.5;
    accSniper = 3;
    accSmg = 1.5;
    accRocket = 1;
    accRifle = 3;
    
    stamina_regen = 0.52;
    stamina_regen_regular = stamina_regen;
    stamina_regen_relic = stamina_regen*2;
    
    dodge_stamina = 50;
    sprint_stamina = 0.3;
    sprint_stamina_min = 10;
    
    melee_stamina_cost = 10;
    
    move_speed_max = 6; //5
    move_speed_sprint = 8; //6.5
    move_speed_aiming = 3; //3
    
    //Sprites
    sprite_idle = spr_pinky_idle;
    sprite_walk = spr_pinky_walk;
    sprite_sprint = spr_pinky_sprint;
    sprite_dash = spr_pinky_dash;
    sprite_hit = spr_pinky_hit;
    sprite_death = spr_pinky_death;
    sprite_melee = spr_pinky_melee;
    sprite_dash_fx = spr_pinky_dash_fx;
    sprite_dig = spr_pinky_dig;
    
    

