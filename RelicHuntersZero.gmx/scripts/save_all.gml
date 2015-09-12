///save_all()
//Saves all game data

ini_open(working_directory + "\saveData.ini");

    ini_write_string('Version','Version',global.currentVersionNumber);
    ini_write_real('Language','Language',global.language);
    
    ini_write_real('Input','Input1',global.input[1]);
    ini_write_real('Input','Input2',global.input[2]);
    ini_write_real('Input','Sticky Aim',global.sticky_aim);
    ini_write_real('Input','Auto Aim',global.auto_aim);
    ini_write_real('Input','Sprint Toggle',global.sprint_toggle);
    ini_write_real('Input','Double Tap Dodge',global.doubleTapDodge);
    ini_write_real('Input','Allow Mouse Wheel',global.allowMouseWheel);
    ini_write_real('Quality','Always Show Ammo',global.alwaysShowAmmo);
    ini_write_real('Quality','screenshake',global.screenShakeRatio);
    ini_write_real('Quality','controller vibration',global.vibrationRatio);
    ini_write_real('Quality','fullscreen',global.fullscreen);
    ini_write_real('Quality','resolution',global.screenResolution);
    
    ini_write_real('Quality','Master Volume',global.masterVolume);
    ini_write_real('Quality','Master Music',global.musicVolume);
    ini_write_real('Quality','Master Sound',global.soundVolume);

    ini_write_real('Temp','WeaponPickedUp',global.hasPickedWeapon);
    ini_write_real('Temp','CheckpointUsed',global.hasUsedCheckpoint);
    
    ini_write_real('Temp','Bounty Endless',global.bountyEndless);
    ini_write_real('Temp','Loop',global.currentLoop);
    ini_write_real('Temp','Score Endless',global.scoreEndless);
    ini_write_real('Temp','endPriceTier_lightAmmo',global.endPriceTier_lightAmmo);
    ini_write_real('Temp','endPriceTier_mediumAmmo',global.endPriceTier_mediumAmmo);
    ini_write_real('Temp','endPriceTier_heavyAmmo',global.endPriceTier_heavyAmmo);
    ini_write_real('Temp','endPriceTier_grenades',global.endPriceTier_grenades);
    ini_write_real('Temp','endPriceTier_overshield',global.endPriceTier_overshield);
    ini_write_real('Temp','endPriceTier_health',global.endPriceTier_health);
    ini_write_real('Temp','endTierSlot1',global.endTierSlot1);
    ini_write_real('Temp','endTierSlot2',global.endTierSlot2);
    ini_write_real('Temp','endTierSlot3',global.endTierSlot3);
    ini_write_real('Temp','endTierItem1',global.endTierItem1);
    ini_write_real('Temp','endTierItem2',global.endTierItem2);
    ini_write_real('Temp','endTierItem3',global.endTierItem3);

        
    ini_write_real('Character','playerCount',global.playerCount);
        
    var p = 1;
    var playerInstanceNumber = 0;
    while (p <= global.playerCount)
    {
        ini_write_real('Character', 'Alive' +string(p), global.playerAlive[p]);
        ini_write_real('Character', 'Character' +string(p), global.character[p]);
        ini_write_real('Character', 'Ammo Light' +string(p), global.ammo_light[p]);
        ini_write_real('Character', 'Ammo Medium' +string(p), global.ammo_medium[p]);
        ini_write_real('Character', 'Ammo Heavy' +string(p), global.ammo_heavy[p]);
        ini_write_real('Character', 'Grenades' +string(p), global.grenades[p]);
        
        var playerInstanceCount = instance_number(class_player);
        var curPlayer = instance_find(class_player,playerInstanceNumber);
        
        if (curPlayer) && instance_exists(curPlayer)
        {
            var playerId = curPlayer.myPlayerId;
            
            if instance_exists(curPlayer.weapon1)
            {
                ini_write_real('Character','Weapon1Player'+string(playerId),curPlayer.weapon1.object);
                ini_write_real('Character','Weapon1LevelPlayer'+string(playerId),curPlayer.weapon1.weaponLevel);
                ini_write_real('Character','Ammo1Player'+string(playerId),curPlayer.weapon1.ammo_current);
            }
            else ini_write_real('Character','Weapon1Player'+string(playerId),noone);
        
            if instance_exists(curPlayer.weapon2)
            {
                ini_write_real('Character','Weapon2Player'+string(playerId),curPlayer.weapon2.object);
                ini_write_real('Character','Weapon2LevelPlayer'+string(playerId),curPlayer.weapon2.weaponLevel);
                ini_write_real('Character','Ammo2Player'+string(playerId),curPlayer.weapon2.ammo_current);
            }
            else ini_write_real('Character','Weapon2Player'+string(playerId),noone);
            
            ini_write_real('Character','Health'+string(playerId),curPlayer.hp);
            ini_write_real('Character','Overshield'+string(playerId),curPlayer.overshield);
            
            if (curPlayer.myGun == curPlayer.weapon1 ) global.currentlyEquippedWeapon[playerId] = 1;
            if (curPlayer.myGun == curPlayer.weapon2) global.currentlyEquippedWeapon[playerId] = 2;
            
            ini_write_real('Character','currentlyEquippedWeapon'+string(playerId),global.currentlyEquippedWeapon[playerId]);
        }
        
        p++;
        playerInstanceNumber++;
    }
    
        ini_write_real('Persistence','LowPerfChecked',global.lowPerfChecked);
        
        ini_write_real('Persistence','UnlockEndless',global.unlockEndless);
        ini_write_real('Persistence','UnlockPinky',global.unlockPinky);
        ini_write_real('Persistence','UnlockRaff',global.unlockRaff);
        ini_write_real('Persistence','UnlockBiu',global.unlockBiu);
        ini_write_real('Persistence','UnlockPunny',global.unlockPunny);
        ini_write_real('Persistence','UnlockAss',global.unlockAss);
        ini_write_real('Persistence','UnlockRider',global.unlockRider);
        
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
        
        ini_write_real('Weapons','shield1',global.unlock_shield1);
        ini_write_real('Weapons','shield2',global.unlock_shield2);
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
        
        ini_write_real('Relics','morning_star',global.relic_morning_star);
        ini_write_real('Relics','pineapple_pie',global.relic_pineapple_pie);
        ini_write_real('Relics','rabbit_foot',global.relic_rabbit_foot);
        ini_write_real('Relics','midnight_meal',global.relic_midnight_meal);
        ini_write_real('Relics','yottabyte_processor',global.relic_yottabyte_processor);
       
        ini_write_real('Temp','Stage',global.stage_current);
        
        if (room != room_start) && (room != room_tutorial) ini_write_real('Ass','first_stage',1);
        ini_write_real('Ass','shop_visits',global.shop_visits);

    //Challenges
    ini_write_real('Challenges','challengeSteroids',global.challengeSteroids);
    ini_write_real('Challenges','challengeWanted',global.challengeWanted);
    ini_write_real('Challenges','challengeHighTech',global.challengeHighTech);
    ini_write_real('Challenges','challengeLightFocus',global.challengeLightFocus);
    ini_write_real('Challenges','challengeMediumFocus',global.challengeMediumFocus);
    ini_write_real('Challenges','challengeHeavyFocus',global.challengeHeavyFocus);
    ini_write_real('Challenges','challengeReinforcements',global.challengeReinforcements);
    
    ini_write_real('Challenges','challengeHunger',global.challengeHunger);
    ini_write_real('Challenges','challengeThirst',global.challengeThirst);
    ini_write_real('Challenges','challengeOvercharge',global.challengeOvercharge);
    ini_write_real('Challenges','challengeMedieval',global.challengeMedieval);
    ini_write_real('Challenges','challengeCatapult',global.challengeCatapult);
    ini_write_real('Challenges','challengeDucanWeapons',global.challengeDucanWeapons);
    ini_write_real('Challenges','challengeHeavyBurden',global.challengeHeavyBurden);
    ini_write_real('Challenges','challengeSupressor',global.challengeSupressor);
    ini_write_real('Challenges','challengeBloodlust',global.challengeBloodlust);
    ini_write_real('Challenges','challengeJaws',global.challengeJaws);
    ini_write_real('Challenges','challengeCountdown',global.challengeCountdown);
    
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
    ini_write_real('Stats','statBossKills',global.statBossKills);
    ini_write_real('Stats','Kills',global.statKills);
    ini_write_real('Stats','statTotalTime',global.statTotalTime);
    ini_write_real('Stats','statRunTime',global.statRunTime);
    ini_write_real('Stats','statRunBest',global.statRunBest);
    ini_write_real('Stats','statLongestRun',global.statLongestRun);
    ini_write_real('Stats','totalDigs',global.totalDigs);
    ini_write_real('Stats','scoreEndlessBest',global.scoreEndlessBest);
    ini_write_real('Stats','statBestLoop',global.statBestLoop);
    
    // End
ini_close();