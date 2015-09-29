///char_state_initial();
//Reset the saved values of all characters to the default starting values
    
    global.playerAlive[1] = true;
    global.playerAlive[2] = true;

    global.weapon1[1] = noone;
    global.weapon2[1] = noone;
    global.weapon1Level[1] = 0;
    global.weapon2Level[1] = 0;
    global.hp[1] = 999999;
    global.overshield[1] = 0;
    global.currentlyEquippedWeapon[1] = 0;
    
    global.weapon1[2] = noone;
    global.weapon2[2] = noone;
    global.weapon1Level[2] = 0;
    global.weapon2Level[2] = 0;
    global.hp[2] = 999999;
    global.overshield[2] = 0;
    global.currentlyEquippedWeapon[2] = 0;
    
    global.statRunTime = 0;
    
    global.hasPurchasedAnything = false;
    global.hacksOnThisRun = 0;
    
    if (global.gameMode == gamemode_adventure)
    {
        global.ammo_light[1] = 120;
        global.ammo_medium[1] = 0;
        global.ammo_heavy[1] = 0;
        global.grenades[1] = 2;
    
        global.ammo_light[2] = 120;
        global.ammo_medium[2] = 0;
        global.ammo_heavy[2] = 0;
        global.grenades[2] = 2;
    }
    
    if (global.gameMode == gamemode_endless)
    {
        global.scoreEndless = 0;
        global.currentLoop = 0;
        global.bountyEndless = 0;
        
        global.ammo_light[1] = 80;
        global.ammo_medium[1] = 50;
        global.ammo_heavy[1] = 80;
        global.grenades[1] = 0;
    
        global.ammo_light[2] = 80;
        global.ammo_medium[2] = 50;
        global.ammo_heavy[2] = 80;
        global.grenades[2] = 0;
        
        global.endPriceTier_lightAmmo = 0;
        global.endPriceTier_mediumAmmo = 0;
        global.endPriceTier_heavyAmmo = 0;
        global.endPriceTier_grenades = 0;
        global.endPriceTier_health = 0;
        global.endPriceTier_overshield = 0;
        global.endPriceTier_revive = 0;
        global.endPriceTier_hack = 0;
        
        global.endTierSlot1 = 1;
        global.endTierSlot2 = 1;
        global.endTierSlot3 = 1;
        global.endTierItem1 = noone;
        global.endTierItem2 = noone;
        global.endTierItem3 = noone;
        
        global.relicChanceBonus = 0;
        
        //Challenge list clear
        if (is_undefined(global.challengeList)) global.challengeList = ds_list_create();
        else if (ds_exists(global.challengeList,ds_type_list)) { 
            ds_list_destroy(global.challengeList);
            global.challengeList = ds_list_create();
        }
    }
    
    //Clean Challenges (even for Adventure Mode, to avoid issues
    global.challengeWanted = 0;
    global.challengeSteroids = 0;
    global.challengeHighTech = 0;
    global.challengeLightFocus = 0;
    global.challengeMediumFocus = 0;
    global.challengeHeavyFocus = 0;
    global.challengeReinforcements = 0;
    
    global.challengeHunger = 0;
    global.challengeThirst = 0;
    global.challengeOvercharge = 0;
    global.challengeMedieval = 0;
    global.challengeCatapult = 0;
    global.challengeDucanWeapons = 0;
    global.challengeHeavyBurden = 0;
    global.challengeSupressor = 0;
    global.challengeBloodlust = 0;
    global.challengeJaws = 0;
    global.challengeCountdown = 0;
    
//Reset Relic Selection
if (global.gameMode == gamemode_endless)
{
    global.relic_slot[1] = '';
    global.relic_slot[2] = '';
    global.relic_slot[3] = '';
    
    global.relic_alcoholic_carrot = 0;
    global.relic_yottabyte_drive = 0;
    global.relic_pineapple_pudding = 0;
    global.relic_infinity_battery = 0;
    global.relic_crystal_bacon = 0;
    global.relic_midnight_beer = 0;
    global.relic_watchful_eye = 0;
    global.relic_dev_potion = 0;
    
    global.relic_morning_star = 0;
    global.relic_pineapple_pie = 0;
    global.relic_rabbit_foot = 0;
    global.relic_midnight_meal = 0;
    global.relic_yottabyte_processor = 0;
}
    
