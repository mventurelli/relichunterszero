///char_state_initial();
//Reset the saved values of all characters to the default starting values
    
    global.playerAlive[1] = true;
    global.playerAlive[2] = true;

    global.weapon1[1] = noone;
    global.weapon2[1] = noone;
    global.hp[1] = 999999;
    global.overshield[1] = 0;
    global.currentlyEquippedWeapon[1] = 0;
    
    global.weapon1[2] = noone;
    global.weapon2[2] = noone;
    global.hp[2] = 999999;
    global.overshield[2] = 0;
    global.currentlyEquippedWeapon[2] = 0;
    
    global.statRunTime = 0;
    
    if (global.gameMode == gamemode_adventure)
    {
        global.ammo_light[1] = 80;
        global.ammo_medium[1] = 0;
        global.ammo_heavy[1] = 0;
        global.grenades[1] = 2;
    
        global.ammo_light[2] = 80;
        global.ammo_medium[2] = 0;
        global.ammo_heavy[2] = 0;
        global.grenades[2] = 2;
    
    }
    
    if (global.gameMode == gamemode_endless)
    {
        global.scoreEndless = 0;
        global.currentLoop = 0;
        global.bountyEndless = 0;
        
        global.ammo_light[1] = 120;
        global.ammo_medium[1] = 80;
        global.ammo_heavy[1] = 120;
        global.grenades[1] = 0;
    
        global.ammo_light[2] = 120;
        global.ammo_medium[2] = 80;
        global.ammo_heavy[2] = 120;
        global.grenades[2] = 0;
    }
    
