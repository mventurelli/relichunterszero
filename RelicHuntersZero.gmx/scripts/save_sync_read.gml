///save_sync_read()
//Opens the main save file and synchronizes everything. Called by the Create event of controller_main

ini_open(working_directory + "\saveData.ini");
    
    global.currentVersionNumber = ini_read_string('Version','Version','v1.2');
    global.language = ini_read_real('Language','Language',lang_english);
    
    // Temporary Values
    
    global.playerCount = ini_read_real('Character','playerCount',1);
    
    var p = 1; while (p <= 2)
    {
        global.playerAlive[p] = ini_read_real('Character','Alive'+string(p),true);
        global.character[p] = ini_read_real('Character','Character'+string(p),char_jimmy);
        global.weapon1[p] = ini_read_real('Character','Weapon1Player'+string(p),noone);
        global.weapon2[p] = ini_read_real('Character','Weapon2Player'+string(p),noone);
        global.weapon1Level[p] = ini_read_real('Character','Weapon1LevelPlayer'+string(p),0);
        global.weapon2Level[p] = ini_read_real('Character','Weapon2LevelPlayer'+string(p),0);
        global.weapon1_ammo[p] = ini_read_real('Character','Ammo1Player'+string(p),999);
        global.weapon2_ammo[p] = ini_read_real('Character','Ammo2Player'+string(p),999);
        global.hp[p] = ini_read_real('Character','Health'+string(p),999999);
        global.overshield[p] = ini_read_real('Character','Overshield'+string(p),0);
            
        global.ammo_light[p] = ini_read_real('Character','Ammo Light'+string(p),20);
        global.ammo_medium[p] = ini_read_real('Character','Ammo Medium'+string(p),0);
        global.ammo_heavy[p] = ini_read_real('Character','Ammo Heavy'+string(p),0);
        global.grenades[p] = ini_read_real('Character','Grenades'+string(p),0);
        
        if (room != room_start) global.currentlyEquippedWeapon[p] = ini_read_real('Character','currentlyEquippedWeapon'+string(p),0);
        else global.currentlyEquippedWeapon[p] = 0;
        
        p++;
    }
    
    //Endless Temp
    global.bountyEndless = ini_read_real('Temp','Bounty Endless',0);
    global.currentLoop = ini_read_real('Temp','Loop',0);
    global.endPriceTier_lightAmmo = ini_read_real('Temp','endPriceTier_lightAmmo',0);
    global.endPriceTier_mediumAmmo = ini_read_real('Temp','endPriceTier_mediumAmmo',0);
    global.endPriceTier_heavyAmmo = ini_read_real('Temp','endPriceTier_heavyAmmo',0);
    global.endPriceTier_grenades = ini_read_real('Temp','endPriceTier_grenades',0);
    global.endPriceTier_overshield = ini_read_real('Temp','endPriceTier_overshield',0);
    global.endPriceTier_health = ini_read_real('Temp','endPriceTier_health',0);
    global.endTierSlot1 = ini_read_real('Temp','endTierSlot1',1);
    global.endTierSlot2 = ini_read_real('Temp','endTierSlot2',1);
    global.endTierSlot3 = ini_read_real('Temp','endTierSlot3',1);
    global.endTierItem1 = ini_read_real('Temp','endTierItem1',noone);
    global.endTierItem2 = ini_read_real('Temp','endTierItem2',noone);
    global.endTierItem3 = ini_read_real('Temp','endTierItem3',noone);
    
    //Temp
    global.stage_current = ini_read_real('Temp','Stage',0);
    global.hasPickedWeapon = ini_read_real('Temp','WeaponPickedUp',0);
    global.hasUsedCheckpoint = ini_read_real('Temp','CheckpointUsed',0);
    global.scoreEndless = ini_read_real('Temp','Score Endless',0);
    
    // Persistence
    
    global.lowPerfChecked = ini_read_real('Persistence','LowPerfChecked',0);
    
    global.unlockEndless = ini_read_real('Persistence','UnlockEndless',0);
    global.unlockPinky = ini_read_real('Persistence','UnlockPinky',1);
    global.unlockRaff = ini_read_real('Persistence','UnlockRaff',0);
    global.unlockBiu = ini_read_real('Persistence','UnlockBiu',0);
    global.unlockPunny = ini_read_real('Persistence','UnlockPunny',0);
    global.unlockAss = ini_read_real('Persistence','UnlockAss',0);
    global.unlockRider = ini_read_real('Persistence','UnlockRider',0);
    
    global.score_total = ini_read_real('Persistence','Score',0);
    global.checkpoint1 = ini_read_real('Persistence','Checkpoint1',0);
    global.checkpoint2 = ini_read_real('Persistence','Checkpoint2',0);
    global.checkpoint3 = ini_read_real('Persistence','Checkpoint3',0);
    
    global.unlock_pistol_assault = ini_read_real('Weapons','pistol_assault',0);
    global.unlock_pistol_heavy = ini_read_real('Weapons','pistol_heavy',0);
    global.unlock_pistol_plasma = ini_read_real('Weapons','pistol_plasma',0);
    global.unlock_shotgun = ini_read_real('Weapons','shotgun',0);
    global.unlock_shotgun_heavy = ini_read_real('Weapons','shotgun_heavy',0);
    global.unlock_submachinegun = ini_read_real('Weapons','submachinegun',0);
    global.unlock_highmag = ini_read_real('Weapons','highmag',0);
    global.unlock_machinegun = ini_read_real('Weapons','machinegun',0);
    global.unlock_assault_rifle = ini_read_real('Weapons','assault_rifle',0);
    global.unlock_rocketlauncher = ini_read_real('Weapons','rocketlauncher',0);
    global.unlock_sniper_rifle = ini_read_real('Weapons','sniper_rifle',0);
    
    global.unlock_shield1 = ini_read_real('Weapons','shield1',0);
    global.unlock_shield2 = ini_read_real('Weapons','shield2',0);
    global.unlock_light1 =  ini_read_real('Weapons','light1',0);
    global.unlock_light2 =  ini_read_real('Weapons','light2',0);
    global.unlock_medium1 =  ini_read_real('Weapons','medium1',0);
    global.unlock_medium2 = ini_read_real('Weapons','medium2',0);
    global.unlock_heavy1 = ini_read_real('Weapons','heavy1',0);
    global.unlock_heavy2 = ini_read_real('Weapons','heavy2',0);
    global.unlock_heavy3 = ini_read_real('Weapons','heavy3',0);
    global.unlock_heavy4 = ini_read_real('Weapons','heavy4',0);
    global.unlock_grenades1 = ini_read_real('Weapons','grenades1',0);
    global.unlock_grenades2 = ini_read_real('Weapons','grenades2',0);
    global.unlock_grenades3 = ini_read_real('Weapons','grenades3',0);
    
    // Relics
    
    global.relic_slot[1] = ini_read_string('Relics','slot1','');
    global.relic_slot[2] = ini_read_string('Relics','slot2','');
    global.relic_slot[3] = ini_read_string('Relics','slot3','');
    
    global.relic_alcoholic_carrot = ini_read_real('Relics','alcoholic_carrot',0);
    global.relic_alcoholic1 = ini_read_real('Relics','alcoholic1',0);
    global.relic_alcoholic2 = ini_read_real('Relics','alcoholic2',0);
    global.relic_alcoholic3 = ini_read_real('Relics','alcoholic3',0);
    
    global.relic_yottabyte_drive = ini_read_real('Relics','yottabyte_drive',0);
    global.relic_yottabyte1 = ini_read_real('Relics','yottabyte1',0);
    global.relic_yottabyte2 = ini_read_real('Relics','yottabyte2',0);
    global.relic_yottabyte3 = ini_read_real('Relics','yottabyte3',0);
    
    global.relic_pineapple_pudding = ini_read_real('Relics','pineapple_pudding',0);
    global.relic_pineapple1 = ini_read_real('Relics','pineapple1',0);
    global.relic_pineapple2 = ini_read_real('Relics','pineapple2',0);
    global.relic_pineapple3 = ini_read_real('Relics','pineapple3',0);
    
    global.relic_infinity_battery = ini_read_real('Relics','infinity_battery',0);
    global.relic_infinity1 = ini_read_real('Relics','infinity1',0);
    global.relic_infinity2 = ini_read_real('Relics','infinity2',0);
    global.relic_infinity3 = ini_read_real('Relics','infinity3',0);
    
    global.relic_crystal_bacon = ini_read_real('Relics','crystal_bacon',0);
    global.relic_crystal1 = ini_read_real('Relics','crystal1',0);
    global.relic_crystal2 = ini_read_real('Relics','crystal2',0);
    global.relic_crystal3 = ini_read_real('Relics','crystal3',0);
    
    global.relic_midnight_beer = ini_read_real('Relics','midnight_beer',0);
    global.relic_midnight1 = ini_read_real('Relics','midnight1',0);
    global.relic_midnight2 = ini_read_real('Relics','midnight2',0);
    global.relic_midnight3 = ini_read_real('Relics','midnight3',0);
    
    global.relic_watchful_eye = ini_read_real('Relics','watchful_eye',0);
    global.relic_watchful1 = ini_read_real('Relics','watchful1',0);
    global.relic_watchful2 = ini_read_real('Relics','watchful2',0);
    global.relic_watchful3 = ini_read_real('Relics','watchful3',0);
    
    global.relic_dev_potion = ini_read_real('Relics','dev_potion',0);
    global.relic_dev1 = ini_read_real('Relics','dev1',0);
    global.relic_dev2 = ini_read_real('Relics','dev2',0);
    global.relic_dev3 = ini_read_real('Relics','dev3',0);
    
    global.relic_morning_star = ini_read_real('Relics','morning_star',0);
    global.relic_pineapple_pie = ini_read_real('Relics','pineapple_pie',0);
    global.relic_rabbit_foot = ini_read_real('Relics','rabbit_foot',0);
    global.relic_midnight_meal = ini_read_real('Relics','midnight_meal',0);
    global.relic_yottabyte_processor = ini_read_real('Relics','yottabyte_processor',0);
   
    //Challenges
    global.challengeSteroids = ini_read_real('Challenges','challengeSteroids',0);
    global.challengeWanted = ini_read_real('Challenges','challengeWanted',0);
    global.challengeHighTech = ini_read_real('Challenges','challengeHighTech',0);
    global.challengeLightFocus = ini_read_real('Challenges','challengeLightFocus',0);
    global.challengeMediumFocus = ini_read_real('Challenges','challengeMediumFocus',0);
    global.challengeHeavyFocus = ini_read_real('Challenges','challengeHeavyFocus',0);
    global.challengeReinforcements = ini_read_real('Challenges','challengeReinforcements',0);
        
    global.challengeHunger = ini_read_real('Challenges','challengeHunger',0);
    global.challengeThirst = ini_read_real('Challenges','challengeThirst',0);
    global.challengeOvercharge = ini_read_real('Challenges','challengeOvercharge',0);
    global.challengeMedieval = ini_read_real('Challenges','challengeMedieval',0);
    global.challengeCatapult = ini_read_real('Challenges','challengeCatapult',0);
    global.challengeDucanWeapons = ini_read_real('Challenges','challengeDucanWeapons',0);
    global.challengeHeavyBurden = ini_read_real('Challenges','challengeHeavyBurden',0);
    global.challengeSupressor = ini_read_real('Challenges','challengeSupressor',0);
    global.challengeBloodlust = ini_read_real('Challenges','challengeBloodlust',0);
    global.challengeJaws = ini_read_real('Challenges','challengeJaws',0);
    global.challengeCountdown = ini_read_real('Challenges','challengeCountdown',0);
    
    
    
    
    // Game Progression
    
    global.tutorial_done = ini_read_real('Ass','tutorial',0);
    global.first_stage_done = ini_read_real('Ass','first_stage',0);
    global.shop_visits = ini_read_real('Ass','shop_visits',0);
    if (room == room_shop) global.shop_visits++;
    
    // Game Options
    var defaultEffects = 1;
    //if (os_type == os_macosx) defaultEffects = 0;
    
    global.masterVolume = ini_read_real('Quality','Master Volume',1); 
    global.musicVolume = ini_read_real('Quality','Master Music',1); 
    global.soundVolume = ini_read_real('Quality','Master Sound',1); 
    volume_update();
    
    global.input[1] =  ini_read_real('Input','Input1',K_INPUT_KEYBOARD);
    global.input[2] =  ini_read_real('Input','Input2',K_INPUT_JOYSTICK1);
    global.sticky_aim = ini_read_real('Input','Sticky Aim',true);
    global.auto_aim = ini_read_real('Input','Auto Aim',K_AUTOAIM_ASSIST);
    global.sprint_toggle = ini_read_real('Input','Sprint Toggle',false);
    
    global.doubleTapDodge = ini_read_real('Input','Double Tap Dodge',true);
    global.allowMouseWheel = ini_read_real('Input','Allow Mouse Wheel',true);
    global.screenShakeRatio = ini_read_real('Quality','screenshake',1.0);
    global.vibrationRatio = ini_read_real('Quality','controller vibration',1.0);
    
    global.screenResolution = ini_read_real('Quality','resolution',1.0);
    global.fullscreen = ini_read_real('Quality','fullscreen',1);
    global.reflections_toggle = ini_read_real('Quality','reflections',defaultEffects);
    global.shadows_toggle = ini_read_real('Quality','shadows',defaultEffects);
    global.persistent_toggle = ini_read_real('Quality','persistent effects',defaultEffects);
    global.max_particles = ini_read_real('Quality','max particles',5);
    global.max_casings = ini_read_real('Quality','max casings',100);
    global.alwaysShowAmmo = ini_read_real('Quality','Always Show Ammo',false);
    
    
    // Keyboard&Mouse Input
    // Null keys must be "-99" instead of just "-1" to avoid Mouse button issues
    
    global.inputFire1 = ini_read_real( 'Mapping', 'Keyboard Fire1', mb_left );
    global.inputFire2 = ini_read_real( 'Mapping', 'Keyboard Fire2', -99 );
    
    global.inputAim1 = ini_read_real( 'Mapping', 'Keyboard Aim1', mb_right );
    global.inputAim2 = ini_read_real( 'Mapping', 'Keyboard Aim2', -99 );
    
    global.inputRight1 = ini_read_real( 'Mapping', 'Keyboard Right1', ord('D') );
    global.inputRight2 = ini_read_real( 'Mapping', 'Keyboard Right2', vk_right );
    
    global.inputLeft1 = ini_read_real( 'Mapping', 'Keyboard Left1', ord('A') );
    global.inputLeft2 = ini_read_real( 'Mapping', 'Keyboard Left2', vk_left );
    
    global.inputUp1 = ini_read_real( 'Mapping', 'Keyboard Up1', ord('W') );
    global.inputUp2 = ini_read_real( 'Mapping', 'Keyboard Up2', vk_up );
    
    global.inputDown1 = ini_read_real( 'Mapping', 'Keyboard Down1', ord('S') );
    global.inputDown2 = ini_read_real( 'Mapping', 'Keyboard Down2', vk_down );
    
    global.inputGrenade1 = ini_read_real( 'Mapping', 'Keyboard Grenade1', ord('F') );
    global.inputGrenade2 = ini_read_real( 'Mapping', 'Keyboard Grenade2', -99 );
    
    global.inputMelee1 = ini_read_real( 'Mapping', 'Keyboard Melee1', mb_middle );
    global.inputMelee2 = ini_read_real( 'Mapping', 'Keyboard Melee2', ord('V') );
    
    global.inputSprint1 = ini_read_real( 'Mapping', 'Keyboard Sprint1', vk_shift );
    global.inputSprint2 = ini_read_real( 'Mapping', 'Keyboard Sprint2', vk_space );
    
    global.inputSprintToggle1 = ini_read_real( 'Mapping', 'Keyboard SprintToggle1', -99 );
    global.inputSprintToggle2 = ini_read_real( 'Mapping', 'Keyboard SprintToggle2', -99 );
    
    global.inputUse1 = ini_read_real( 'Mapping', 'Keyboard Use1', ord('E') );
    global.inputUse2 = ini_read_real( 'Mapping', 'Keyboard Use2', -99 );
    
    global.inputSwitch1 = ini_read_real( 'Mapping', 'Keyboard Switch1', ord('Q') );
    global.inputSwitch2 = ini_read_real( 'Mapping', 'Keyboard Switch2', vk_tab );
    
    global.inputReload1 = ini_read_real( 'Mapping', 'Keyboard Reload1', ord('R') );
    global.inputReload2 = ini_read_real( 'Mapping', 'Keyboard Reload2', -99 );
    
    // Joystick Input
    // Null buttons must be "-99" instead of just "-1" to avoid Mouse button issues
    
    
    
    
    // Steam
    
    global.screenShotNumber = ini_read_real('Steam','ScreenshotNumber',0);
    
    // Stats
    
    global.statTotalBounty = ini_read_real('Stats','statTotalBounty',0);
    global.statTotalDeaths = ini_read_real('Stats','statTotalDeaths',0);
    global.statKilledByBoss = ini_read_real('Stats','statKilledByBoss',0);
    global.statBossKills = ini_read_real('Stats','statBossKills',0);
    global.statKills = ini_read_real('Stats','Kills',0);
    global.statTotalTime = ini_read_real('Stats','statTotalTime',0);
    global.statRunTime = ini_read_real('Stats','statRunTime',0);
    global.statRunBest = ini_read_real('Stats','statRunBest',0);
    global.statLongestRun = ini_read_real('Stats','statLongestRun',0);
    global.totalDigs = ini_read_real('Stats','totalDigs',0);
    global.scoreEndlessBest = ini_read_real('Stats','scoreEndlessBest',0);
    global.statBestLoop = ini_read_real('Stats','statBestLoop',0);
    
    // End
    
    ini_close();