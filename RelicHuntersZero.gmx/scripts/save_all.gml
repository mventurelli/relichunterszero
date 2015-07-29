///save_all()
//Saves all game data

ini_open(working_directory + "\saveData.ini");

    ini_write_string('Version','Version',global.currentVersionNumber);

    ini_write_string('Input','Input Type',global.input);
    ini_write_real('Input','Sticky Aim',global.sticky_aim);
    ini_write_real('Input','Auto Aim',global.auto_aim);
    ini_write_real('Input','Sprint Toggle',global.sprint_toggle);
    ini_write_real('Input','Double Tap Dodge',global.doubleTapDodge);
    ini_write_real('Input','Allow Mouse Wheel',global.allowMouseWheel);
    ini_write_real('Quality','screenshake',global.screenShakeRatio);
    ini_write_real('Quality','controller vibration',global.vibrationRatio);
    ini_write_real('Quality','fullscreen',global.fullscreen);
    ini_write_real('Quality','resolution',global.screenResolution);
    
    ini_write_real('Quality','Master Volume',global.masterVolume);
    ini_write_real('Quality','Master Music',global.musicVolume);
    ini_write_real('Quality','Master Sound',global.soundVolume);

    
    if instance_exists(class_player)
    {
        
        if instance_exists(class_player.weapon1)
        {
            ini_write_real('Character','Weapon1',class_player.weapon1.object);
            ini_write_real('Character','Ammo1',class_player.weapon1.ammo_current);
        }
        else ini_write_real('Character','Weapon1',noone);
    
        if instance_exists(class_player.weapon2)
        {
            ini_write_real('Character','Weapon2',class_player.weapon2.object);
            ini_write_real('Character','Ammo2',class_player.weapon2.ammo_current);
        }
        else ini_write_real('Character','Weapon2',noone);
        
        ini_write_real('Character','Health',class_player.hp);
        
        if (class_player.myGun == class_player.weapon1 ) global.currentlyEquippedWeapon = 1;
        if (class_player.myGun == class_player.weapon2) global.currentlyEquippedWeapon = 2;
        
        ini_write_real('Character','currentlyEquippedWeapon',global.currentlyEquippedWeapon);
    }
        
        ini_write_real('Temp','WeaponPickedUp',global.hasPickedWeapon);
        ini_write_real('Temp','CheckpointUsed',global.hasUsedCheckpoint);
        
        ini_write_real('Character','Character',global.character);
        
        ini_write_real('Character','Ammo Light',global.ammo_light);
        ini_write_real('Character','Ammo Medium',global.ammo_medium);
        ini_write_real('Character','Ammo Heavy',global.ammo_heavy);
        ini_write_real('Character','Grenades',global.grenades);
        
        ini_write_real('Persistence','UnlockPinky',global.unlockPinky);
        ini_write_real('Persistence','UnlockRaff',global.unlockRaff);
        ini_write_real('Persistence','UnlockBiu',global.unlockBiu);
        ini_write_real('Persistence','UnlockPunny',global.unlockPunny);
        ini_write_real('Persistence','UnlockAss',global.unlockAss);
        
        ini_write_real('Persistence','Score',global.score_total);
        
        ini_write_real('Persistence','Checkpoint1',global.checkpoint1);
        ini_write_real('Persistence','Checkpoint2',global.checkpoint2);
        ini_write_real('Persistence','Checkpoint3',global.checkpoint3);
        
        ini_write_real('Weapons','pistol_assault',global.unlock_pistol_assault);
        ini_write_real('Weapons','pistol_heavy',global.unlock_pistol_heavy);
        ini_write_real('Weapons','pistol_plasma',global.unlock_pistol_plasma);
        ini_write_real('Weapons','shotgun',global.unlock_shotgun);
        ini_write_real('Weapons','shotgun_heavy',global.unlock_shotgun_heavy);
        ini_write_real('Weapons','submachinegun',global.unlock_submachinegun);
        ini_write_real('Weapons','highmag',global.unlock_highmag);
        ini_write_real('Weapons','machinegun',global.unlock_machinegun);
        ini_write_real('Weapons','assault_rifle',global.unlock_assault_rifle);
        ini_write_real('Weapons','rocketlauncher',global.unlock_rocketlauncher);
        ini_write_real('Weapons','sniper_rifle',global.unlock_sniper_rifle);
        
        ini_write_real('Weapons','light1',global.unlock_light1);
        ini_write_real('Weapons','light2',global.unlock_light2);
        ini_write_real('Weapons','medium1',global.unlock_medium1);
        ini_write_real('Weapons','medium2',global.unlock_medium2);
        ini_write_real('Weapons','heavy1',global.unlock_heavy1);
        ini_write_real('Weapons','heavy2',global.unlock_heavy2);
        ini_write_real('Weapons','heavy3',global.unlock_heavy3);
        ini_write_real('Weapons','heavy4',global.unlock_heavy4);
        ini_write_real('Weapons','grenades1',global.unlock_grenades1);
        ini_write_real('Weapons','grenades2',global.unlock_grenades2);
        ini_write_real('Weapons','grenades3',global.unlock_grenades3);
        
        ini_write_string('Relics','slot1',global.relic_slot[1]);
        ini_write_string('Relics','slot2',global.relic_slot[2]);
        ini_write_string('Relics','slot3',global.relic_slot[3]);
        
        ini_write_real('Relics','alcoholic_carrot',global.relic_alcoholic_carrot);
        ini_write_real('Relics','alcoholic1',global.relic_alcoholic1);
        ini_write_real('Relics','alcoholic2',global.relic_alcoholic2);
        ini_write_real('Relics','alcoholic3',global.relic_alcoholic3);
        
        ini_write_real('Relics','yottabyte_drive',global.relic_yottabyte_drive);
        ini_write_real('Relics','yottabyte1',global.relic_yottabyte1);
        ini_write_real('Relics','yottabyte2',global.relic_yottabyte2);
        ini_write_real('Relics','yottabyte3',global.relic_yottabyte3);
        
        ini_write_real('Relics','pineapple_pudding',global.relic_pineapple_pudding);
        ini_write_real('Relics','pineapple1',global.relic_pineapple1);
        ini_write_real('Relics','pineapple2',global.relic_pineapple2);
        ini_write_real('Relics','pineapple3',global.relic_pineapple3);
        
        ini_write_real('Relics','infinity_battery',global.relic_infinity_battery);
        ini_write_real('Relics','infinity1',global.relic_infinity1);
        ini_write_real('Relics','infinity2',global.relic_infinity2);
        ini_write_real('Relics','infinity3',global.relic_infinity3);
        
        ini_write_real('Relics','crystal_bacon',global.relic_crystal_bacon);
        ini_write_real('Relics','crystal1',global.relic_crystal1);
        ini_write_real('Relics','crystal2',global.relic_crystal2);
        ini_write_real('Relics','crystal3',global.relic_crystal3);
        
        ini_write_real('Relics','midnight_beer',global.relic_midnight_beer);
        ini_write_real('Relics','midnight1',global.relic_midnight1);
        ini_write_real('Relics','midnight2',global.relic_midnight2);
        ini_write_real('Relics','midnight3',global.relic_midnight3);
        
        ini_write_real('Relics','watchful_eye',global.relic_watchful_eye);
        ini_write_real('Relics','watchful1',global.relic_watchful1);
        ini_write_real('Relics','watchful2',global.relic_watchful2);
        ini_write_real('Relics','watchful3',global.relic_watchful3);
        
        ini_write_real('Relics','dev_potion',global.relic_dev_potion);
        ini_write_real('Relics','dev1',global.relic_dev1);
        ini_write_real('Relics','dev2',global.relic_dev2);
        ini_write_real('Relics','dev3',global.relic_dev3);
        
        ini_write_real('Temp','Stage',global.stage_current);
        
        if (room != room_start) && (room != room_tutorial) ini_write_real('Ass','first_stage',1);
        ini_write_real('Ass','shop_visits',global.shop_visits);

    
    // Game Options
    ini_write_real('Quality','reflections',global.reflections_toggle);
    ini_write_real('Quality','shadows',global.shadows_toggle);
    ini_write_real('Quality','persistent effects',global.persistent_toggle);
    ini_write_real('Quality','max particles',global.max_particles);
    ini_write_real('Quality','max casings',global.max_casings);
    
    //Keyboard&Mouse Input
    ini_write_real('Mapping','Keyboard Fire1',global.inputFire1);
    ini_write_real('Mapping','Keyboard Fire2',global.inputFire2);
    ini_write_real('Mapping','Keyboard Aim1',global.inputAim1);
    ini_write_real('Mapping','Keyboard Aim2',global.inputAim2);
    ini_write_real('Mapping','Keyboard Right1',global.inputRight1);
    ini_write_real('Mapping','Keyboard Right2',global.inputRight2);
    ini_write_real('Mapping','Keyboard Left1',global.inputLeft1);
    ini_write_real('Mapping','Keyboard Left2',global.inputLeft2);
    ini_write_real('Mapping','Keyboard Up1',global.inputUp1);
    ini_write_real('Mapping','Keyboard Up2',global.inputUp2);
    ini_write_real('Mapping','Keyboard Down1',global.inputDown1);
    ini_write_real('Mapping','Keyboard Down2',global.inputDown2);
    ini_write_real('Mapping','Keyboard Grenade1',global.inputGrenade1);
    ini_write_real('Mapping','Keyboard Grenade2',global.inputGrenade2);
    ini_write_real('Mapping','Keyboard Melee1',global.inputMelee1);
    ini_write_real('Mapping','Keyboard Melee2',global.inputMelee2);
    ini_write_real('Mapping','Keyboard Sprint1',global.inputSprint1);
    ini_write_real('Mapping','Keyboard Sprint2',global.inputSprint2);
    ini_write_real('Mapping','Keyboard SprintToggle1',global.inputSprintToggle1);
    ini_write_real('Mapping','Keyboard SprintToggle2',global.inputSprintToggle2);
    ini_write_real('Mapping','Keyboard Use1',global.inputUse1);
    ini_write_real('Mapping','Keyboard Use2',global.inputUse2);
    ini_write_real('Mapping','Keyboard Switch1',global.inputSwitch1);
    ini_write_real('Mapping','Keyboard Switch2',global.inputSwitch2);
    ini_write_real('Mapping','Keyboard Reload1',global.inputReload1);
    ini_write_real('Mapping','Keyboard Reload2',global.inputReload2);

    // Joystick Input
    // Null buttons must be "-99" instead of just "-1" to avoid Mouse button issues
    
    
    // Steam
    ini_write_real('Steam','ScreenshotNumber',global.screenShotNumber);
    
    // Stats
    ini_write_real('Stats','statTotalBounty',global.statTotalBounty);
    ini_write_real('Stats','statTotalDeaths',global.statTotalDeaths);
    ini_write_real('Stats','statKilledByBoss',global.statKilledByBoss);
    ini_write_real('Stats','statTotalTime',global.statTotalTime);
    ini_write_real('Stats','statRunTime',global.statRunTime);
    
    // End
ini_close();