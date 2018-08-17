///Interaction

event_inherited();

if (activationClient != noone)
{   
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;    
    
    if (wantToActivate) && (in_range) && (myChallenge != "")
    {
        if (global.bountyEndless >= price)
        {
            wantToActivate = false;
            global.bountyEndless -= price;
            priceTier++; 
            global.endPriceTier_hack = priceTier;
                
                
            //Stats and Achievements
            global.statTotalHacks++;
            global.hacksOnThisRun++;
            global.hasPurchasedAnything = true;
            if (global.hacksOnThisRun == 3) achievement_give("ACHIEVEMENT_SAE_3");
                
            steam_set_stat_int("STAT_TOTAL_HACKS", steam_get_stat_int("STAT_TOTAL_HACKS") + 1  );
            if (steam_get_stat_int("STAT_TOTAL_HACKS") >= 200) achievement_give("ACHIEVEMENT_SAE_200");
                
            //Remove the challenge
            var challengePos = ds_list_find_index(global.challengeList,myChallenge);
            if (challengePos >= 0){
                ds_list_delete(global.challengeList,challengePos);
                switch (myChallenge){
                    case "CHALLENGE_HUNGER" : global.challengeHunger = false; break;
                    case "CHALLENGE_THIRST" : global.challengeThirst = false; break;
                    case "CHALLENGE_OVERCHARGE" : global.challengeOvercharge = false; break;
                    case "CHALLENGE_MEDIEVAL" : global.challengeMedieval = false; break;
                    case "CHALLENGE_SUPRESSOR" : global.challengeSupressor = false; break;
                    case "CHALLENGE_CATAPULT" : global.challengeCatapult = false; break;
                    case "CHALLENGE_DUCANWEAPONS" : global.challengeDucanWeapons = false; break;
                    case "CHALLENGE_JAWS" : global.challengeJaws = false; break;
                    case "CHALLENGE_BLOODLUST" : global.challengeBloodlust = false; break;
                    case "CHALLENGE_HEAVYBURDEN" : global.challengeHeavyBurden = false; break;
                        
                    case "CHALLENGE_HUNTED" : global.challengeHunted = false; break;
                    case "CHALLENGE_HAUNTED" : global.challengeHaunted = false; break;
                        
                    case "CHALLENGE_STEROIDS" : global.challengeSteroids -= (min(1,global.challengeSteroids)); break;
                    case "CHALLENGE_WANTED" : global.challengeWanted -= (min(1,global.challengeWanted)); break;
                    case "CHALLENGE_HIGHTECH" : global.challengeHighTech -= (min(1,global.challengeHighTech)); break;
                    case "CHALLENGE_LIGHTFOCUS" : global.challengeLightFocus -= (min(1,global.challengeLightFocus)); break;
                    case "CHALLENGE_MEDIUMFOCUS" : global.challengeMediumFocus -= (min(1,global.challengeMediumFocus)); break;
                    case "CHALLENGE_HEAVYFOCUS" : global.challengeHeavyFocus -= (min(1,global.challengeHeavyFocus)); break;
                }
            }
                
            myChallenge = "";
            sprite_index = spr_terminalClear;

			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", c_white, loc_key("SAE_INFO_HACKED"));
            //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
            //guiInfo.myString = loc_key("SAE_INFO_HACKED");;
            //guiInfo.colorMain = c_white;
            //guiInfo.owner = activationClient;
            audio_play(activationClient.audio_emitter,false,1,sfx_buy);
            if (instance_exists(obj_sae)) if (instance_exists(obj_sae.myBalloon)) obj_sae.myBalloon.upgradeTalk = true;
        }
        else{
			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", K_BETU_RED, loc_key("INFO_NOTENOUGHBOUNTY"));
            //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
            //guiInfo.myString = loc_key("INFO_NOTENOUGHBOUNTY");;
            //guiInfo.colorMain = K_BETU_RED;
            //guiInfo.owner = activationClient;
            audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full); 
        }    
    }
}

