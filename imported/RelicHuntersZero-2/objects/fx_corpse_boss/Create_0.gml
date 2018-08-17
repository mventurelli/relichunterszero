///Main Things

myDeathStage = 1;
coinDrops = 10;

image_xscale = 1;
image_yscale = 1;

corpse_friction = 0.4;
image_speed = 0;
image_index = 1;

speed_reset = false;
old_speed = 0;

max_speed = 10;

offset = 72;

explosionTimeCurrent = 0;

//Removes HUD
global.cutscene = true;

//Stops Music
audio_stop_all();
audio_play_sound(sfx_boss_death,99,false);

//Clean Up Enemies
if (instance_exists(class_enemy))
{
    with(class_enemy) instance_destroy();
}

if (instance_exists(obj_rocket_homing))
{
    with(obj_rocket_homing) instance_destroy();
}

//hehehehe
dropHugeGun = false;

///Stats, Achievements & Unlocks
global.unlockEndless = true;

global.statBossKills++;

if ((global.statRunTime < global.statRunBest || !global.statRunBest) && (global.hasUsedCheckpoint == false)) global.statRunBest = global.statRunTime;

achievement_give("ACHIEVEMENT_BEATGAME");

if (global.hasUsedCheckpoint == false) && (!global.unlockBiu)
{
    global.unlockBiu = true;
    achievement_give("ACHIEVEMENT_UNLOCKBIU");
    announce = instance_create_layer(x,y,"GUI",fx_bigMessage);
    announce.textBig = loc_key("HUD_UNLOCK_HUNTER");
    announce.textSmall = loc_key("HUD_UNLOCK_BIU");
    announce.hunterUnlockSprite = spr_hud_face_biu; 
}

if (global.character[1] == char_raff || global.character[2] == char_raff) && (global.hasUsedCheckpoint == false)
{
    achievement_give("ACHIEVEMENT_ULTIMATERAFF");
}

if (global.character[1] == char_punny || global.character[2] == char_punny) && (global.hasUsedCheckpoint == false)
{
    achievement_give("ACHIEVEMENT_ULTIMATEPUNNY");
}

if (global.character[1] == char_jimmy || global.character[2] == char_jimmy) && (global.hasUsedCheckpoint == false) && (global.hasPickedWeapon == false) 
{
    achievement_give("ACHIEVEMENT_JIMMYNOWEAPONS");
}

if (global.character[1] == char_biu || global.character[2] == char_biu) && (global.hasUsedCheckpoint == false) && (global.hasPickedWeapon == false) 
{
    achievement_give("ACHIEVEMENT_BIUNOWEAPONS");
}

if (global.character[1] == char_ass) || (global.character[2] == char_ass)
{
    achievement_give("ACHIEVEMENT_BEATGAMEWITHASS");
}

if (global.character[1] == char_pinky || global.character[2] == char_pinky ) && (global.hasUsedCheckpoint == false)
{
    achievement_give("ACHIEVEMENT_ULTIMATEPINKY");
}

if (global.playerCount > 1)
{
    achievement_give("ACHIEVEMENT_BEATGAMECOOP");
    
    if (global.hasUsedCheckpoint == false) && (global.relic_slot[1] = "") && (global.relic_slot[2] = "") && (global.relic_slot[3] = "") achievement_give("ACHIEVEMENT_ULTIMATECOOP");
}

//Endless-specific achievements
if (global.gameMode == gamemode_endless)
{
    achievement_give("ACHIEVEMENT_FIRSTLOOP");
    if (global.currentLoop == 1) { // <-- Loop number only increases when you leave the Boss room!
        if (global.character[1] == char_jimmy || global.character[2] == char_jimmy) achievement_give("ACHIEVEMENT_LOOP2_JIMMY");
        if (global.character[1] == char_pinky || global.character[2] == char_pinky ) achievement_give("ACHIEVEMENT_LOOP2_PINKYY");
        if (global.character[1] == char_raff || global.character[2] == char_raff) achievement_give("ACHIEVEMENT_LOOP2_RAFF");
        if (global.character[1] == char_biu || global.character[2] == char_biu) achievement_give("ACHIEVEMENT_LOOP2_BIU");
        if (global.character[1] == char_punny || global.character[2] == char_punny) achievement_give("ACHIEVEMENT_LOOP2_PUNNY");
        if (global.character[1] == char_ass) || (global.character[2] == char_ass) achievement_give("ACHIEVEMENT_LOOP2_ACE");
        if (global.character[1] == char_rider) || (global.character[2] == char_rider) achievement_give("ACHIEVEMENT_LOOP2_RIDER");
    }
    
    if (global.currentLoop == 2) achievement_give("ACHIEVEMENT_LOOP3");
    
    if (!global.hasPurchasedAnything) achievement_give("ACHIEVEMENT_LOOP_NOBUY");
}











