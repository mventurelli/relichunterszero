show_debug_message("controller_main must be the first instance on each playable room");

///Main Configuration

//Level Build
level_built = false;
room_speed = global.target_fps;

//Initialization
draw_texture_flush();
stringCurrentDate = string(current_day)+string(current_month)+string(current_year);

//prepare stage gui
if (!instance_exists(global.gui_stage)) {
	global.gui_stage = instance_create_layer(0,0,"GUI",gui_stage);
}
if (instance_exists(global.gui_stage)) {
	layer_add_instance(layer_get_id("GUI"), global.gui_stage);
}

if (!global.isDaily) randomize();
//else random_set_seed(global.dailySeed);
joy_init();


global.gameOver = false;
global.relicDetected = false;
global.overrideLevel = noone;

if current_month == 8 global.bdayMode = true;
else global.bdayMode = false;


global.steamApi = false;

if (steam_initialised())
{
    if (steam_stats_ready()) && (steam_is_overlay_enabled())
    {
       global.steamApi = true;
    }
    else show_debug_message("ERROR: Steam Stats Not Accessible At This Time");
}
else show_debug_message("ERROR: Steam not initialized");

//Audio
global.falloffMainDist = 1280;
global.falloffMainMax = 2000;
global.falloffMainFactor = 1;

global.falloffMediumDist = 600;
global.falloffMediumMax = 1500;
global.falloffMediumFactor = 1;

global.falloffMinorDist = 280;
global.falloffMinorMax = 1000;
global.falloffMinorFactor = 1;

//Camera and Crosshair
global.crosshairX[1] = 0;
global.crosshairY[1] = 0;
global.crosshair_scale[1] = 1;
global.crosshairX[2] = 0;
global.crosshairY[2] = 0;
global.crosshair_scale[2] = 1;
global.crosshairScaleMax = 2;

global.default_shadow_yscale = 0.3;
global.music = true;

level_end = false;
global.level_complete = false;
global.pause = 0;
global.pauseMenu = false;

global.gunAccuracyMultiplier = 0.85;

//Score
global.coins_turtle1 = 1;
global.coins_turtle2 = 2;
global.coins_turtle3 = 3;
global.coins_duck1 = 3;
global.coins_duck2 = 4;
global.coins_duck3 = 5;

global.score_kill = 10;
global.score_headshot = 5;

global.score_doublekill = 5;
global.score_triplekill = 5;
global.score_multikill = 10;

//Storm Mode & Difficulty
global.gunnarFound = false;
global.teleporterFound = false;
global.maxSpawns = 24;

global.spawnTimeByDifficulty[K_DIFFICULTY_VERY_EASY] = 14;
global.spawnTimeByDifficulty[K_DIFFICULTY_EASY] = 18;
global.spawnTimeByDifficulty[K_DIFFICULTY_REGULAR] = 16;
global.spawnTimeByDifficulty[K_DIFFICULTY_HARD] = 16;
global.spawnTimeByDifficulty[K_DIFFICULTY_VERY_HARD] = 15;
global.spawnTimeByDifficulty[K_DIFFICULTY_EXTREME] = 15;
global.spawnTimeByDifficulty[K_DIFFICULTY_VERY_EXTREME] = 15;
global.spawnTimeByDifficulty[K_DIFFICULTY_LEGENDARY] = 15;
global.spawnTimeByDifficulty[K_DIFFICULTY_ASCENDANT] = 15;

global.spawnAmountByDifficulty[K_DIFFICULTY_VERY_EASY] = 1;
global.spawnAmountByDifficulty[K_DIFFICULTY_EASY] = 2;
global.spawnAmountByDifficulty[K_DIFFICULTY_REGULAR] = 2;
global.spawnAmountByDifficulty[K_DIFFICULTY_HARD] = 2;
global.spawnAmountByDifficulty[K_DIFFICULTY_VERY_HARD] = 2;
global.spawnAmountByDifficulty[K_DIFFICULTY_EXTREME] = 2;
global.spawnAmountByDifficulty[K_DIFFICULTY_VERY_EXTREME] = 2;
global.spawnAmountByDifficulty[K_DIFFICULTY_LEGENDARY] = 2;
global.spawnAmountByDifficulty[K_DIFFICULTY_ASCENDANT] = 3;

global.damageMultiplierByDifficulty[K_DIFFICULTY_VERY_EASY] = 0.5;
global.damageMultiplierByDifficulty[K_DIFFICULTY_EASY] = 0.5;
global.damageMultiplierByDifficulty[K_DIFFICULTY_REGULAR] = 0.5;
global.damageMultiplierByDifficulty[K_DIFFICULTY_HARD] = 0.5;
global.damageMultiplierByDifficulty[K_DIFFICULTY_VERY_HARD] = 0.5;
global.damageMultiplierByDifficulty[K_DIFFICULTY_EXTREME] = 0.6;
global.damageMultiplierByDifficulty[K_DIFFICULTY_VERY_EXTREME] = 0.7;
global.damageMultiplierByDifficulty[K_DIFFICULTY_LEGENDARY] = 0.8;
global.damageMultiplierByDifficulty[K_DIFFICULTY_ASCENDANT] = 0.9;

global.healthMultiplierByDifficulty[K_DIFFICULTY_VERY_EASY] = 0.5;
global.healthMultiplierByDifficulty[K_DIFFICULTY_EASY] = 0.5;
global.healthMultiplierByDifficulty[K_DIFFICULTY_REGULAR] = 0.7;
global.healthMultiplierByDifficulty[K_DIFFICULTY_HARD] = 0.7;
global.healthMultiplierByDifficulty[K_DIFFICULTY_VERY_HARD] = 0.8;
global.healthMultiplierByDifficulty[K_DIFFICULTY_EXTREME] = 1;
global.healthMultiplierByDifficulty[K_DIFFICULTY_VERY_EXTREME] = 1;
global.healthMultiplierByDifficulty[K_DIFFICULTY_LEGENDARY] = 1.5;
global.healthMultiplierByDifficulty[K_DIFFICULTY_ASCENDANT] = 2;

global.difficultyUpgradeTime = 160;
global.initialWaveSpawns = 3;
global.stormPhase = K_STORMPHASE_BATTLE;
global.stormBossPhaseTime = 72;
global.stormBossPhaseTimeCurrent = 0;

global.enemyCount = 0;

//Prices
global.price_checkpoint1 = 1000;
global.price_checkpoint2 = 3000;
global.price_checkpoint3 = 6000;

global.price_pistol_assault = 650;
global.price_pistol_heavy = 3000;
global.price_pistol_plasma = 4200;
global.price_shotgun = 1200;
global.price_submachinegun = 2000;
global.price_highmag = 4000;
global.price_machinegun = 5000;
global.price_assault_rifle = 5000;
global.price_sniper_rifle = 5000;
global.price_shotgun_heavy = 5000;
global.price_rocketlauncher = 5000;

global.price_shield1 = 1000;
global.price_shield2 = 3000;
global.price_light1 = 300;
global.price_light2 = 300;
global.price_medium1 = 500;
global.price_medium2 = 850;
global.price_heavy1 = 500;
global.price_heavy2 = 750;
global.price_heavy3 = 750;
global.price_heavy4 = 750;
global.price_grenades1 = 1000;
global.price_grenades2 = 1500;
global.price_grenades3 = 1500;

global.price_pineapple1 = 1500;
global.price_pineapple2 = 1500;
global.price_pineapple3 = 1500;
global.price_alcoholic1 = 1500;
global.price_alcoholic2 = 1500;
global.price_alcoholic3 = 1500;
global.price_crystal1 = 3000;
global.price_crystal2 = 4500;
global.price_crystal3 = 4500;
global.price_infinity1 = 4500;
global.price_infinity2 = 4500;
global.price_infinity3 = 4500;
global.price_midnight1 = 4000;
global.price_midnight2 = 4000;
global.price_midnight3 = 4000;
global.price_watchful1 = 2500;
global.price_watchful2 = 2500;
global.price_watchful3 = 2500;
global.price_dev1 = 3500;
global.price_dev2 = 4500;
global.price_dev3 = 4500;
global.price_yottabyte1 = 1750;
global.price_yottabyte2 = 1750;
global.price_yottabyte3 = 1750;

//Gunnar Weapon Upgrade Prices
global.price_weaponUpgrade[0] = 50;
global.price_weaponUpgrade[1] = 80;
global.price_weaponUpgrade[2] = 120;
global.price_weaponUpgrade[3] = 160;
global.price_weaponUpgrade[4] = 210;
global.price_weaponUpgrade[5] = 260;
global.price_weaponUpgrade[6] = 320;
global.price_weaponUpgrade[7] = 380;
global.price_weaponUpgrade[8] = 500;

//Players & Ammo
global.friendlyFire = false;

global.reviveHealth = 0.5;
global.reviveAmmoLight = 160;
global.reviveAmmoMedium = 100;
global.reviveAmmoHeavy = 160;

global.ammo_light_max = 360;
global.ammo_medium_max = 280;
global.ammo_heavy_max = 400;
global.grenades_max = 5;

global.ammoDropChanceLight = 0.1;
global.ammoDropChanceMedium = 0.035;
global.ammoDropChanceHeavy = 0.025;
global.ammoDropLowThreshold = 0.15;
global.ammoDropEquippedBonus = 0.1;
global.ammoDropLowBonus = 0.1;

ammo_light_max_regular = global.ammo_light_max;
ammo_medium_max_regular = global.ammo_medium_max;
ammo_heavy_max_regular = global.ammo_heavy_max;
grenades_max_regular = global.grenades_max;

ammo_light_max_relic = 250;
ammo_medium_max_relic = 150;
ammo_heavy_max_relic = 250;
grenades_max_relic = global.grenades_max;
grenades_max_biu = 10;

draw_ammo1 = 0;
draw_ammo2 = 0;

//Combat Options
global.autoAimAngle = 38;
global.precisionAngle = 20;
global.precisionDistance = 32;
global.friendlyFireDamageRatio = 0.7;
global.enemyProjectileSpeed = 0.8;

global.total_value = 0;

//Relics
global.midnightDamageMultiplier = 0.5;
global.crystalBaconRegen = 8;
global.devPotionRegenTime = 750000;//room_speed*0.75;
global.watchfulEyePickupBonus = 1.5;
global.relicHpBonus = 1;
global.relicEnergyBonus = 1;

//Endless Score
global.scoreEndlessLevel = 600; 
global.scoreEndlessLoop = 2000;
global.scoreEndlessLoopMultiplier = 2;

//Daily Score
global.dailyChecked = 0;
global.dailyPlayers = -1;
global.dailyBadge = 0;
global.dailyBadgeString = "";
global.dailyRankDebug = -1;


//Debug Pathfinding
global.drawGridDebug = false;

//Low Performance Detection
global.lowPerfTime = 4200000;//room_speed*4.2;
global.lowPerfTimeCurrent = 0;

///Enemy Tracker
global.edgeTrackEnemyList = noone;

//GUI
guiSurface = surface_create(1920,1080);
//surface_set_target(guiSurface);
//draw_clear_alpha(c_black, 0.0);
//surface_reset_target();
main_hud_alpha = 0;

//Dynamic GUI
global.dynamicBounty = instance_create_layer(0,0,"GUI",gui_dynamic_bounty);
//global.dynamicRelic1 = instance_create_layer(0,0,"GUI",gui_dynamic_relic1);
//global.dynamicRelic2 = instance_create_layer(0,0,"GUI",gui_dynamic_relic2);
//global.dynamicRelic3 = instance_create_layer(0,0,"GUI",gui_dynamic_relic3);
global.dynamicAmmo1 = instance_create_layer(0,0,"GUI",gui_dynamic_ammo1);
global.dynamicAmmo2 = instance_create_layer(0,0,"GUI",gui_dynamic_ammo2);

//Pathfinding
path_refresh = room_speed*1; // Updates the grid once per second
alarm[1] = path_refresh;
global.astar_grid = mp_grid_create(0,0,round(room_width/64),round(room_height/64),64,64);
mp_grid_add_instances(global.astar_grid,class_solid,false);


score_time = 1200000;//room_speed*1.2;
score_time_current = 0;
score_value = 10;
score_string = "KILL";

guiShieldAlertDraw = false;
guiShieldAlertTime = 500000;//room_speed*0.5;
guiShieldAlertTimeCurrent = 0;

guiReloadAlertDraw = false;
guiReloadAlertTime = 500000;//room_speed*0.5;
guiReloadAlertTimeCurrent = 0;

//Dynamic GUI

delayedAmmoLightBar[1] = 1;
delayedAmmoMediumBar[1] = 2;
delayedAmmoHeavyBar[1] = 3;
delayedCharHealthBar1[1] = 4;
delayedCharShieldBar1[1] = 5;
delayedAmmoLightBar[2] = 6;
delayedAmmoMediumBar[2] = 7;
delayedAmmoHeavyBar[2] = 8;
delayedCharHealthBar1[2] = 9;
delayedCharShieldBar1[2] = 10;
delayedP1AmmoBar = 11;
delayedP2AmmoBar = 12;
draw_healthbar_delayed_init(delayedAmmoLightBar[1]);
draw_healthbar_delayed_init(delayedAmmoMediumBar[1]);
draw_healthbar_delayed_init(delayedAmmoHeavyBar[1]);
draw_healthbar_delayed_init(delayedCharHealthBar1[1]);
draw_healthbar_delayed_init(delayedCharShieldBar1[1]);
draw_healthbar_delayed_init(delayedAmmoLightBar[2]);
draw_healthbar_delayed_init(delayedAmmoMediumBar[2]);
draw_healthbar_delayed_init(delayedAmmoHeavyBar[2]);
draw_healthbar_delayed_init(delayedCharHealthBar1[2]);
draw_healthbar_delayed_init(delayedCharShieldBar1[2]);
draw_healthbar_delayed_init(delayedP1AmmoBar);
draw_healthbar_delayed_init(delayedP2AmmoBar);

///Cuscenes vs HUD

global.cutscene = true;

cutscene_bars_positionStart = 0.15;
cutscene_bars_position = cutscene_bars_positionStart;
cutscene_bars_exit_speed = 0.0025;

//Survival Mode Configuration
global.survivalWaves = 0;
survivalWaveSize = 0;

if (room == levelHalloween_3) {global.survivalWaves = 3; survivalWaveSize = 3;}
if (global.gameMode == gamemode_storm) global.survivalWaves = 1;

///Particle Systems

global.particle_list = ds_map_create();
global.particle_type_list = ds_map_create();
global.particle_emitter_list = ds_map_create();


//Relics
awarded4RelicsAchievement = false;

//Stats
timeCounter = 0;
gameOverHint = "";

debug_forceLevelExit = false;

//BossFight GUI
bossBar = 666;
draw_healthbar_delayed_init(bossBar);
isBossSetup = false;
isGen1Setup = false;
isGen2Setup = false;
isGen3Setup = false;
fakeBarFill = 0;


//Center Mouse Position At Beggining
display_mouse_set(window_get_width() / 2, window_get_height() / 2);



///Endless Economy & Rare Challenge Timers Balance
if (global.gameMode == gamemode_endless)
{
    global.endPrice_lightAmmo[0] = 120;
    global.endPrice_lightAmmo[1] = 160;
    global.endPrice_lightAmmo[2] = 190;
    global.endPrice_lightAmmo[3] = 220;
    global.endPrice_lightAmmo[4] = 280;
    global.endPrice_lightAmmo[5] = 350;
    global.endPrice_lightAmmo[6] = 410;
    global.endPrice_lightAmmo[7] = 500;
    global.endPrice_lightAmmo[8] = 600;
    global.endPrice_lightAmmo[9] = 700;
    
    global.endPrice_mediumAmmo[0] = 120;
    global.endPrice_mediumAmmo[1] = 160;
    global.endPrice_mediumAmmo[2] = 190;
    global.endPrice_mediumAmmo[3] = 220;
    global.endPrice_mediumAmmo[4] = 280;
    global.endPrice_mediumAmmo[5] = 350;
    global.endPrice_mediumAmmo[6] = 410;
    global.endPrice_mediumAmmo[7] = 500;
    global.endPrice_mediumAmmo[8] = 600;
    global.endPrice_mediumAmmo[9] = 700;
    
    global.endPrice_heavyAmmo[0] = 120;
    global.endPrice_heavyAmmo[1] = 160;
    global.endPrice_heavyAmmo[2] = 190;
    global.endPrice_heavyAmmo[3] = 220;
    global.endPrice_heavyAmmo[4] = 280;
    global.endPrice_heavyAmmo[5] = 350;
    global.endPrice_heavyAmmo[6] = 410;
    global.endPrice_heavyAmmo[7] = 500;
    global.endPrice_heavyAmmo[8] = 600;
    global.endPrice_heavyAmmo[9] = 700;
    
    global.endPrice_grenades[0] = 120;
    global.endPrice_grenades[1] = 160;
    global.endPrice_grenades[2] = 190;
    global.endPrice_grenades[3] = 220;
    global.endPrice_grenades[4] = 280;
    global.endPrice_grenades[5] = 350;
    global.endPrice_grenades[6] = 410;
    global.endPrice_grenades[7] = 500;
    global.endPrice_grenades[8] = 600;
    global.endPrice_grenades[9] = 700;
    
    global.endPrice_overshield[0] = 100;
    global.endPrice_overshield[1] = 120;
    global.endPrice_overshield[2] = 160;
    global.endPrice_overshield[3] = 190;
    global.endPrice_overshield[4] = 220;
    global.endPrice_overshield[5] = 280;
    global.endPrice_overshield[6] = 350;
    global.endPrice_overshield[7] = 410;
    global.endPrice_overshield[8] = 500;
    global.endPrice_overshield[9] = 600;
    
    global.endPrice_health[0] = 120;
    global.endPrice_health[1] = 160;
    global.endPrice_health[2] = 190;
    global.endPrice_health[3] = 220;
    global.endPrice_health[4] = 280;
    global.endPrice_health[5] = 350;
    global.endPrice_health[6] = 410;
    global.endPrice_health[7] = 500;
    global.endPrice_health[8] = 600;
    global.endPrice_health[9] = 700;
    
    global.endPrice_revive[0] = 500;
    global.endPrice_revive[1] = 2000;
    global.endPrice_revive[2] = 3000;
    global.endPrice_revive[3] = 4000;
    global.endPrice_revive[4] = 5000;
    global.endPrice_revive[5] = 6000;
    global.endPrice_revive[6] = 7000;
    global.endPrice_revive[7] = 8000;
    global.endPrice_revive[8] = 9000;
    global.endPrice_revive[9] = 9999;
    
    global.endPrice_hackCommon[0] = 500;
    global.endPrice_hackCommon[1] = 1200;
    global.endPrice_hackCommon[2] = 1600;
    global.endPrice_hackCommon[3] = 3000;
    global.endPrice_hackCommon[4] = 3300;
    global.endPrice_hackCommon[5] = 4000;
    global.endPrice_hackCommon[6] = 5000;
    global.endPrice_hackCommon[7] = 6500;
    global.endPrice_hackCommon[8] = 8000;
    global.endPrice_hackCommon[9] = 9999;
    
    global.endPrice_hackUnique[0] = 500;
    global.endPrice_hackUnique[1] = 1200;
    global.endPrice_hackUnique[2] = 1600;
    global.endPrice_hackUnique[3] = 3000;
    global.endPrice_hackUnique[4] = 3300;
    global.endPrice_hackUnique[5] = 4000;
    global.endPrice_hackUnique[6] = 5000;
    global.endPrice_hackUnique[7] = 6500;
    global.endPrice_hackUnique[8] = 8000;
    global.endPrice_hackUnique[9] = 9999;
    
    global.endPrice_hackHunted = 2000;
    global.endPrice_hackHaunted = 1000;
    
    
    
    
    //Tier1
    global.price_endless_assaultPistol = 600;
    global.price_endless_sawedoff = 700;
    global.price_endless_smg = 800;
    global.price_endless_shotgun = 1000;
    global.price_endless_bouncerPistol = 1000;
    global.price_endless_heavyPistol = 1500;
    global.price_endless_crudeAssaultRifle = 1600;
    global.price_endless_blastPistol = 1600;
    global.price_endless_bouncer = 1900;
    global.price_endless_highmag = 2000;
    
    global.price_endless_morningStar = 1800;
    global.price_endless_watchfulEye = 1000;
    global.price_endless_alcoholicCarrot = 800;
    global.price_endless_infinityBattery = 800;
    global.price_endless_rabbitFoot = 1200;
    global.price_endless_megaQuantumChip = 1000;
    
	global.price_endless_actualCarrot = 1000;
	global.price_endless_blackCat = 1200;
	global.price_endless_multitool = 1000;
	
    //Tier2
    global.price_endless_plasmaPistol = 3000;
    global.price_endless_machinegun = 3375;
    global.price_endless_minigun = 3900;
    global.price_endless_flakCannon = 3900;
    global.price_endless_assaultRifle = 3750;
    global.price_endless_blitz = 3750;
    global.price_endless_rocketLauncher = 4500;
    global.price_endless_sniperRifle = 4800;
    global.price_endless_heavyShotgun = 4500;
    global.price_endless_relicPistol = 5250;
    global.price_endless_kamilauncher = 4500;
	global.price_endless_pistolFire = 3500;
	global.price_endless_smgBlast = 4800;
    
    global.price_endless_yottabyteDrive = 3750;
    global.price_endless_pineapplePudding = 2700;
    global.price_endless_pineapplePie = 2700;
    global.price_endless_midnightBeer = 3300;
	
	global.price_endless_shellCandy = 3000;
	global.price_endless_purpleJuice = 2700;
	global.price_endless_rabbitEars = 3000;
	global.price_endless_fireFreak = 3000;
    
    //Tier3
    global.price_endless_plasmaSMG = 5250;
    global.price_endless_relicSMG = 5250;
    global.price_endless_relicShotgun = 6000;
    global.price_endless_relicRifle = 6000;
    global.price_endless_relicSniper = 6000;
    global.price_endless_relicMinigun = 6000;
    global.price_endless_relicCannon = 6000;
    global.price_endless_relicRocket = 7800;
	global.price_endless_blastRifle = 5800;
	global.price_endless_fireSmg = 5250;
    
    global.price_endless_devPotion = 5250;
    global.price_endless_crystalBacon = 5250;
    global.price_endless_midnightMeal = 5250;
    global.price_endless_yottabyteProcessor = 4500;
	
	global.price_endless_loafOfBread = 5250;
	global.price_endless_bloodMoon = 5250;
	global.price_endless_pureSand = 4500;
	
	global.price_endless_mod_gun = irandom_range(10, 30) * 100;
    
    //Rare Challenge Times (in Rounds)
  
    global.challengeHungerRounds = 6;
    global.challengeThirstRounds = 6;
    global.challengeOverchargeRounds = 4;
    global.challengeMedievalRounds = 4;
    global.challengeCatapultRounds = 6;
    global.challengeDucanWeaponsRounds = 6;
    global.challengeHeavyBurdenRounds = 4;
    global.challengeSupressorRounds = 4;
    global.challengeBloodlustRounds = 4;
    global.challengeJawsRounds = 6;
    global.challengeCountdownRounds = 4;
    
    global.challengeLightFocusRounds = 4;
    global.challengeMediumFocusRounds = 4;
    global.challengeHeavyFocusRounds = 4;
    
    global.challengeHuntedRounds = 4;
    global.challengeHauntedRounds = 4;
    
    
}

main_camera = instance_create_layer(x,y,"Controllers",controller_camera);

main_effects = instance_create_layer(x,y,"Shadows",controller_effects);


//Pause Menu
game_pause_init();

__view_set( e__VW.XView, 0, x );
__view_set( e__VW.YView, 0, y );

///Soundtrack & Memory Cleaner

global.audio_cleaner = ds_list_create();
global.ambientSound = noone;

alarm[3] = room_speed*3;

if (room == room_start) || (room == room_shop) || (room == room_endShop) || (room == level1_1) || (room == level2_1) || (room == level3_1) || (room == level4_1) || (room == room_boss) || (room == levelHalloween_1) || (audio_is_playing(bgm_dig)) || (room == level_storm_1)
{
    audio_stop_all();
}

//if (global.music)
{
    if (room == room_start)
    {
        audio_play_sound(bgm_main,99,true);
    }
    
    if (room == room_shop) || (room == room_endShop) 
    {
        audio_play_sound(bgm_shop,99,true);
    }
    
    if (room == level1_1) || (room == level1_2) || (room == level1_3)
    {
        if !audio_is_playing(bgm_stage1) audio_play_sound(bgm_stage1,99,true);
        audio_play_sound(sfx_amb_stage1,99,true);
        global.ambientSound = sfx_amb_stage1;
    }
    
    if (room == level2_1) || (room == level2_2) || (room == level2_3)
    {
        if !audio_is_playing(bgm_stage3) audio_play_sound(bgm_stage3,99,true);
        audio_play_sound(sfx_amb_stage2,99,true);
        global.ambientSound = sfx_amb_stage2;
    }
    
    if (room == level3_1) || (room == level3_2) || (room == level3_3)
    {
        if !audio_is_playing(bgm_stage2) audio_play_sound(bgm_stage2,99,true);
        audio_play_sound(sfx_amb_stage3,99,true);
        global.ambientSound = sfx_amb_stage3;
    }
    
    if (room == level4_1) || (room == level4_2) || (room == level4_3)
    {
        if !audio_is_playing(bgm_stage4) audio_play_sound(bgm_stage4,99,true);
        audio_play_sound(sfx_amb_stage4,99,true);
        global.ambientSound = sfx_amb_stage4;
    }
    
    if (room == room_boss)
    {
        if !audio_is_playing(bgm_boss) audio_play_sound(bgm_boss,99,true);
    }
    
    if (room == levelHalloween_1) || (room == levelHalloween_2) || (room == levelHalloween_3)
    {
        if !audio_is_playing(bgm_halloween) audio_play_sound(bgm_halloween,99,true);
        audio_play_sound(sfx_amb_stage4,99,true);
        global.ambientSound = sfx_amb_stage4;
    }
	if (room == level_storm_1)
    {
        if !audio_is_playing(bgm_storm) audio_play_sound(bgm_storm,99,true);
        audio_play_sound(sfx_amb_stage4,99,true);
        global.ambientSound = sfx_amb_stage4;
    }
}

///Read Save File, Set Stage, State Initial, Achievements

save_sync_read();

//Achievements

///Halloween Achievements
if (room == levelHalloween_1) {
    global.spookylandsVisited = true;
    achievement_give("ACHIEVEMENT_ENTER_SPOOKYLANDS");
}

///"Unlock-All" Achievements

if (room == room_start)
{
    if (global.relic_pineapple_pudding) achievement_give("ACHIEVEMENT_FIRSTRELIC");

    var allUnlocks = true;
    
    if (global.unlockPinky) && 
    (global.unlockRaff) && 
    (global.unlockBiu) && 
    (global.unlockPunny) && 
    (global.unlockAss)
        {
            achievement_give("ACHIEVEMENT_UNLOCKALLHUNTERS");
        }
        else allUnlocks = false;
    
    if (global.relic_alcoholic_carrot &&
    global.relic_yottabyte_drive &&
    global.relic_pineapple_pudding &&
    global.relic_infinity_battery &&
    global.relic_crystal_bacon &&
    global.relic_midnight_beer &&
    global.relic_watchful_eye &&
    global.relic_dev_potion)
        {
            achievement_give("ACHIEVEMENT_ALLRELICS");
        }
        else allUnlocks = false;

    
    if (allUnlocks &&
    global.checkpoint1 &&
    global.checkpoint2 &&
    global.checkpoint3 &&
        
    global.unlock_pistol_assault &&
    global.unlock_pistol_heavy &&
    global.unlock_pistol_plasma &&
    global.unlock_shotgun &&
    global.unlock_shotgun_heavy &&
    global.unlock_submachinegun &&
    global.unlock_highmag &&
    global.unlock_machinegun &&
    global.unlock_assault_rifle &&
    global.unlock_rocketlauncher &&
    global.unlock_sniper_rifle &&
        
    global.unlock_light1 &&
    global.unlock_light2 &&
    global.unlock_medium1 &&
    global.unlock_medium2 &&
    global.unlock_heavy1 &&
    global.unlock_heavy2 &&
    global.unlock_heavy3 &&
    global.unlock_heavy4 &&
    global.unlock_grenades1 &&
    global.unlock_grenades2 &&
    global.unlock_grenades3)
        
        {
            achievement_give("ACHIEVEMENT_UNLOCKALL");
        }
}


//Char State Initial
if (room == room_start) || (room == room_tutorial) || ((global.gameMode == gamemode_endless) && (room == level1_1)) || (global.gameMode == gamemode_storm && (room == level_storm_1))
{
    global.stage_current = 1;
    if (!global.currentLoop) char_state_initial(); 
}

if (room == room_start) global.stage_current = 0;
if (room == level1_3) global.stage_current = 1;
if (room == level2_3) global.stage_current = 2;
if (room == level3_3) global.stage_current = 3;
if (room == level4_3) global.stage_current = 4;

//Prepare STORM Variables
global.spawnTime = global.spawnTimeByDifficulty[min(global.currentDifficulty,K_DIFFICULTY_ASCENDANT)];
global.spawnTimeCurrent = 0;
global.spawnAmount = global.spawnAmountByDifficulty[min(global.currentDifficulty,K_DIFFICULTY_ASCENDANT)];
global.damageMultiplier = difficulty_get_damage_multiplier();
global.healthMultiplier = difficulty_get_health_multiplier();

//Prepare for Achievements
if (room == room_start) global.hasPickedWeapon = false;
show_debug_message("Test if weapon was picked up before: "+string(global.hasPickedWeapon));

if (room == room_start) global.hasUsedCheckpoint = false;
show_debug_message("Test if Checkpoint was used before: "+string(global.hasUsedCheckpoint));



//Stage GUI
alarm[4] = room_speed*0.75;

//Black Bars Duration
if (room == room_start) 
{
    alarm[2] = room_speed*4;
    //instance_create_layer(x,y,"Interactive",gui_logo);
}
else  alarm[2] = room_speed*1.7;


///Reload Circle Bar Init
reloadBarRadius = 18;
reloadBarThickness = 8;
reloadBarSurfaceSize = 40;
reloadBarSurface = surface_create(reloadBarSurfaceSize,reloadBarSurfaceSize);
reloadBarSurface2 = surface_create(reloadBarSurfaceSize,reloadBarSurfaceSize);

///Endless Challenges
if (global.gameMode == gamemode_endless) && (ds_exists(global.challengeList,ds_type_list))
{
    if (global.isDaily) 
    {
        var setSeed = global.dailySeed+global.stage_current+global.currentLoop;
        if (room == level1_1) || (room == level2_1) || (room == level3_1) || (room == level4_3) setSeed++;
        else if (room == level1_2) || (room == level2_2) || (room == level3_2) || (room == level4_2) setSeed +=2;
        else if (room == level1_3) || (room == level2_3) || (room == level3_3) || (room == level4_3) setSeed +=3;
        random_set_seed(setSeed);
    }
    //Update Timers for existing Challenges, remove Challenges with expired Timers
    if (room != room_endShop)
    {
        if (global.challengeHunger) 
        { 
            global.challengeHungerTimer--; 
            if (global.challengeHungerTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_HUNGER");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeHunger = false;}
            }
        }
        
        if (global.challengeThirst) 
        { 
            global.challengeThirstTimer--;
            if (global.challengeThirstTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_THIRST");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeThirst = false;}
            }
        }
        
        if (global.challengeOvercharge) 
        { 
            global.challengeOverchargeTimer--; 
            if (global.challengeOverchargeTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_OVERCHARGE");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeOvercharge = false;}
            }
        }
        
        if (global.challengeMedieval) 
        { 
            global.challengeMedievalTimer--;
            if (global.challengeMedievalTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_MEDIEVAL");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeMedieval = false;}
            }
        }
        
        if (global.challengeCatapult) 
        { 
            global.challengeCatapultTimer--; 
            if (global.challengeCatapultTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_CATAPULT");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeCatapult = false;}
            }
        }
        
        if (global.challengeDucanWeapons) 
        { 
            global.challengeDucanWeaponsTimer--; 
            if (global.challengeDucanWeaponsTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_DUCANWEAPONS");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeDucanWeapons = false;}
            }
        }
        
        if (global.challengeHeavyBurden) 
        { 
            global.challengeHeavyBurdenTimer--; 
            if (global.challengeHeavyBurdenTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_HEAVYBURDEN");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeHeavyBurden = false;}
            }
        }
        
        if (global.challengeSupressor) 
        { 
            global.challengeSupressorTimer--; 
            if (global.challengeSupressorTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_SUPRESSOR");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeSupressor = false;}
            }
        }
        
        if (global.challengeBloodlust) 
        { 
            global.challengeBloodlustTimer--; 
            if (global.challengeBloodlustTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_BLOODLUST");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeBloodlust = false;}
            }
        }
        
        if (global.challengeJaws) 
        { 
            global.challengeJawsTimer--; 
            if (global.challengeJawsTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_JAWS");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeJaws = false;}
            }
        }
        
        if (global.challengeCountdown) 
        { 
            global.challengeCountdownTimer--; 
            if (global.challengeCountdownTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_COUNTDOWN");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeCountdown = false;}
            }
        }
        
        if (global.challengeHunted) 
        { 
            global.challengeHuntedTimer--; 
            if (global.challengeHuntedTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_HUNTED");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeHunted = false;}
            }
        }
        
        if (global.challengeHaunted) 
        { 
            global.challengeHauntedTimer--; 
            if (global.challengeHauntedTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_HAUNTED");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeHaunted = false;}
            }
        }
        
        if (global.challengeLightFocus) 
        { 
            global.challengeLightFocusTimer--; 
            if (global.challengeLightFocusTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_LIGHTFOCUS");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeLightFocus = 0;}
            }
        }
        
        if (global.challengeMediumFocus) 
        { 
            global.challengeMediumFocusTimer--; 
            if (global.challengeMediumFocusTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_MEDIUMFOCUS");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeMediumFocus = 0;}
            }
        }
        
        if (global.challengeHeavyFocus) 
        { 
            global.challengeHeavyFocusTimer--; 
            if (global.challengeHeavyFocusTimer <= 0) {
                var challengePos = ds_list_find_index(global.challengeList,"CHALLENGE_HEAVYFOCUS");
                if (challengePos != -1) { ds_list_delete(global.challengeList,challengePos); global.challengeHeavyFocus = 0;}
            }
        }
    }

    //Add new Challenges
    if (
        room == level1_2 ||
        room == level2_1 ||
        room == level2_3 ||
        room == level3_2 ||
        room == level4_1 ||
        room == level4_3 ||
        room == levelHalloween_2 ||
        (global.currentLoop >= 3 && room != room_endShop) ||
        (global.isDaily && room != room_endShop)
        )
    {
        var stringChallenge = "";
        var stringDescription = "";
        var listName = "";
        var chUnique = false;
        
        if (global.currentLoop < 2)
        {
            var uniqueChallengeChance = random(1);
            if (uniqueChallengeChance <= 0.35){
                chUnique = true;
                var randomChallenge = irandom(12);
                switch (randomChallenge){
                    case 0 : if (ds_list_find_index(global.challengeList,"CHALLENGE_HUNGER") == -1) && (ds_list_find_index(global.challengeForbiddenList,"CHALLENGE_HUNGER") == -1) { 
                        global.challengeHunger = true; stringChallenge="CHALLENGE_HUNGER"; stringDescription="CHALLENGE_HUNGER_DESC"; listName="CHALLENGE_HUNGER";
                        global.challengeHungerTimer = global.challengeHungerRounds;
                        } break;
                        
                    case 1 : if (ds_list_find_index(global.challengeList,"CHALLENGE_THIRST") == -1)  && (ds_list_find_index(global.challengeForbiddenList,"CHALLENGE_THIRST") == -1) { 
                        global.challengeThirst = true; stringChallenge="CHALLENGE_THIRST"; stringDescription="CHALLENGE_THIRST_DESC"; listName="CHALLENGE_THIRST";
                        global.challengeThirstTimer = global.challengeThirstRounds;
                        } break;
                    
                    case 2 : if (ds_list_find_index(global.challengeList,"CHALLENGE_OVERCHARGE") == -1)  && (ds_list_find_index(global.challengeForbiddenList,"CHALLENGE_OVERCHARGE") == -1) { 
                        global.challengeOvercharge = true; stringChallenge="CHALLENGE_OVERCHARGE"; stringDescription="CHALLENGE_OVERCHARGE_DESC"; listName="CHALLENGE_OVERCHARGE";
                        global.challengeOverchargeTimer = global.challengeOverchargeRounds;
                        } break;
                        
                    case 3 : if (ds_list_find_index(global.challengeList,"CHALLENGE_MEDIEVAL") == -1)  && (ds_list_find_index(global.challengeForbiddenList,"CHALLENGE_MEDIEVAL") == -1) { 
                        global.challengeMedieval = true; stringChallenge="CHALLENGE_MEDIEVAL"; stringDescription="CHALLENGE_MEDIEVAL_DESC"; listName="CHALLENGE_MEDIEVAL";
                        global.challengeMedievalTimer = global.challengeMedievalRounds;
                        } break;
                        
                    case 4 : if (ds_list_find_index(global.challengeList,"CHALLENGE_SUPRESSOR") == -1)  && (ds_list_find_index(global.challengeForbiddenList,"CHALLENGE_SUPRESSOR") == -1) { 
                        global.challengeSupressor = true; stringChallenge="CHALLENGE_SUPRESSOR"; stringDescription="CHALLENGE_SUPRESSOR_DESC"; listName="CHALLENGE_SUPRESSOR";
                        global.challengeSupressorTimer = global.challengeSupressorRounds;
                        } break;
                    
                    case 5 : if (ds_list_find_index(global.challengeList,"CHALLENGE_CATAPULT") == -1) && (ds_list_find_index(global.challengeForbiddenList,"CHALLENGE_CATAPULT") == -1) { 
                        global.challengeCatapult = true; stringChallenge="CHALLENGE_CATAPULT"; stringDescription="CHALLENGE_CATAPULT_DESC"; listName="CHALLENGE_CATAPULT";
                        global.challengeCatapultTimer = global.challengeCatapultRounds;
                        } break;
                        
                    case 6 : if (ds_list_find_index(global.challengeList,"CHALLENGE_DUCANWEAPONS") == -1)  && (ds_list_find_index(global.challengeForbiddenList,"CHALLENGE_DUCANWEAPONS") == -1) { 
                        global.challengeDucanWeapons = true; stringChallenge="CHALLENGE_DUCANWEAPONS"; stringDescription="CHALLENGE_DUCANWEAPONS_DESC"; listName="CHALLENGE_DUCANWEAPONS";
                        global.challengeDucanWeaponsTimer = global.challengeDucanWeaponsRounds;
                        } break;
                      
                    case 7 : if (ds_list_find_index(global.challengeList,"CHALLENGE_JAWS") == -1)  && (ds_list_find_index(global.challengeForbiddenList,"CHALLENGE_JAWS") == -1){ 
                        global.challengeJaws = true; stringChallenge="CHALLENGE_JAWS"; stringDescription="CHALLENGE_JAWS_DESC"; listName="CHALLENGE_JAWS";
                        global.challengeJawsTimer = global.challengeJawsRounds;
                        } break;
                    
                    case 8 : if (ds_list_find_index(global.challengeList,"CHALLENGE_BLOODLUST") == -1) && (ds_list_find_index(global.challengeForbiddenList,"CHALLENGE_BLOODLUST") == -1) { 
                        global.challengeBloodlust = true; stringChallenge="CHALLENGE_BLOODLUST"; stringDescription="CHALLENGE_BLOODLUST_DESC"; listName="CHALLENGE_BLOODLUST";
                        global.challengeBloodlustTimer = global.challengeBloodlustRounds;
                        } break;
                        
                    case 9 : if (ds_list_find_index(global.challengeList,"CHALLENGE_HEAVYBURDEN") == -1)  && (ds_list_find_index(global.challengeForbiddenList,"CHALLENGE_HEAVYBURDEN") == -1) { 
                        global.challengeHeavyBurden = true; stringChallenge="CHALLENGE_HEAVYBURDEN"; stringDescription="CHALLENGE_HEAVYBURDEN_DESC"; listName="CHALLENGE_HEAVYBURDEN";
                        global.challengeHeavyBurdenTimer = global.challengeHeavyBurdenRounds;
                        } break;
                        
                    case 10 : if (ds_list_find_index(global.challengeList,"CHALLENGE_LIGHTFOCUS") == -1)  && (ds_list_find_index(global.challengeForbiddenList,"CHALLENGE_LIGHTFOCUS") == -1) { 
                        global.challengeLightFocus++; stringChallenge="CHALLENGE_LIGHTFOCUS"; stringDescription="CHALLENGE_LIGHTFOCUS_DESC"; listName="CHALLENGE_LIGHTFOCUS";
                        global.challengeLightFocusTimer = global.challengeLightFocusRounds;
                        } break;
                        
                    case 11 : if (ds_list_find_index(global.challengeList,"CHALLENGE_MEDIUMFOCUS") == -1)  && (ds_list_find_index(global.challengeForbiddenList,"CHALLENGE_MEDIUMFOCUS") == -1) { 
                        global.challengeMediumFocus++; stringChallenge="CHALLENGE_MEDIUMFOCUS"; stringDescription="CHALLENGE_MEDIUMFOCUS_DESC"; listName="CHALLENGE_MEDIUMFOCUS";
                        global.challengeMediumFocusTimer = global.challengeMediumFocusRounds;
                        } break;
                    
                    case 12 : if (ds_list_find_index(global.challengeList,"CHALLENGE_HEAVYFOCUS") == -1)  && (ds_list_find_index(global.challengeForbiddenList,"CHALLENGE_HEAVYFOCUS") == -1) { 
                        global.challengeHeavyFocus++; stringChallenge="CHALLENGE_HEAVYFOCUS"; stringDescription="CHALLENGE_HEAVYFOCUS_DESC"; listName="CHALLENGE_HEAVYFOCUS";
                        global.challengeHeavyFocusTimer = global.challengeHeavyFocusRounds;
                        } break;
                }
            }
            
            //No luck? Roll the common ones
            if (stringChallenge == "") {
                chUnique = false;
                var randomChallenge = irandom(2);
                switch (randomChallenge){
                    case 0 : global.challengeSteroids++; stringChallenge="CHALLENGE_STEROIDS"; stringDescription="CHALLENGE_STEROIDS_DESC"; listName="CHALLENGE_STEROIDS"; break;
                    case 1 : global.challengeWanted++; stringChallenge="CHALLENGE_WANTED"; stringDescription="CHALLENGE_WANTED_DESC"; listName="CHALLENGE_WANTED"; break;
                    case 2 : global.challengeHighTech++; stringChallenge="CHALLENGE_HIGHTECH"; stringDescription="CHALLENGE_HIGHTECH_DESC"; listName="CHALLENGE_HIGHTECH"; break;
                    //case 3 : global.challengeLightFocus++; stringChallenge="CHALLENGE_LIGHTFOCUS"; stringDescription="CHALLENGE_LIGHTFOCUS_DESC"; listName="CHALLENGE_LIGHTFOCUS"; break;
                    //case 4 : global.challengeMediumFocus++; stringChallenge="CHALLENGE_MEDIUMFOCUS"; stringDescription="CHALLENGE_MEDIUMFOCUS_DESC"; listName="CHALLENGE_MEDIUMFOCUS"; break;
                    //case 5 : global.challengeHeavyFocus++; stringChallenge="CHALLENGE_HEAVYFOCUS"; stringDescription="CHALLENGE_HEAVYFOCUS_DESC"; listName="CHALLENGE_HEAVYFOCUS"; break;
                }
            } else global.entropy += 0.1; // <--- If a Rare Challenge indeed spawns, increase Entropy for the player
        }
        else{
            var randomChallenge = irandom(2);
            chUnique = false;
            switch (randomChallenge){
                case 0 : global.challengeSteroids++; stringChallenge="CHALLENGE_STEROIDS"; stringDescription="CHALLENGE_STEROIDS_DESC"; listName="CHALLENGE_STEROIDS"; break;
                case 1 : global.challengeWanted++; stringChallenge="CHALLENGE_WANTED"; stringDescription="CHALLENGE_WANTED_DESC"; listName="CHALLENGE_WANTED"; break;
                case 2 : global.challengeHighTech++; stringChallenge="CHALLENGE_HIGHTECH"; stringDescription="CHALLENGE_HIGHTECH_DESC"; listName="CHALLENGE_HIGHTECH"; break;
            }
        }
        
        
        if (listName != "") 
        {
            ds_list_add(global.challengeList, listName);
            ds_list_add(global.challengeForbiddenList, listName);
        }
        
        var announceChallenge = instance_create_layer(x,y,"GUI",fx_bigMessage);
        announceChallenge.textBigColor = K_BETU_RED;
        if (chUnique) announceChallenge.hunterUnlockSprite = spr_challengeUnique;
        else announceChallenge.hunterUnlockSprite = spr_challengeCommon;
        announceChallenge.textBig = loc_key(stringChallenge);
        announceChallenge.textSmall = loc_key(stringDescription);
    }
}    

//Define Challenge Values
    global.challengeSteroidsMultiplier = 0.2;
    global.challengeWantedMultiplier = 0.5;
    global.challengeHighTechMultiplier = 0.3;
    global.challengeLightFocusMultiplier = 0.7; //was 0.3
    global.challengeMediumFocusMultiplier = 0.7; //was 0.3
    global.challengeHeavyFocusMultiplier = 0.7; //was 0.3
    global.challengeThirstMultiplier = 1;
    global.challengeOverchargeDamage = 50;
    global.challengeMedievalPenalty = 0.4;
    global.challengeMedievalBonus = 1;
    global.challengeCatapultMultiplier = 3;
    global.challengeHeavyBurdenPenalty = 0.55;
    global.challengeBloodlustRate = 1.5; //Im applying this to the fire rate at class_gun_enemy
    global.challengeDucanWeaponsSpeed = 1.2;
    
    global.challengeSteroidsMax = 100;
    global.challengeHighTechMax = 50;
    
//Apply these right here, right now
    if (global.challengeDucanWeapons) global.enemyProjectileSpeed = global.challengeDucanWeaponsSpeed;

// Refresh Relics
relic_refresh();
/**/

//create object pools
init_object_pools();

//create guiInfo
global.guiInfo = instance_create_depth(0,0,0,gui_info);

//create guiScore
global.guiScore = instance_create_depth(0,0,0,gui_score);

//create event controller
global.eventManager = instance_create_depth(0,0,0,controller_eventManager);
