///Activation
event_inherited();

if (global.relic_rabbit_foot) active = true;
if (global.relic_rabbit_foot == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "rabbit_foot";

if (toggle)
{
    toggle = false;
    
    //Check for Ace
    var isAce = false;
    for (var p=1; p<=global.playerCount; p++)
    {
        if (global.character[p] == char_ass) isAce = true;
    }
    
    //Allow Toggle if Ace is not in the game
    if (!isAce)
    {
        if (global.relic_rabbit_foot != 2){
            var equip = relic_slot_equip(object);
            if (equip) global.relic_rabbit_foot = 2;
            else global.relic_rabbit_foot = 1;
        }
        else{
            global.relic_rabbit_foot = 1;
            var unequip = relic_slot_free(object);
            if (unequip) audio_play_sound(sfx_relic_off,1,false);
        }
    }

    /* BUGGED CODE, DELETE AFTER DONE:
    if ((activationClient != noone))
    {
        if (activationClient.myChar != char_ass)
        {
            if (global.relic_rabbit_foot != 2){
                var equip = relic_slot_equip(object);
                if (equip) global.relic_rabbit_foot = 2;
                else global.relic_rabbit_foot = 1;
            }
            else{
                global.relic_rabbit_foot = 1;
                var unequip = relic_slot_free(object);
                if (unequip) audio_play_sound(sfx_relic_off,1,false);
            }
        }
    }
    */
}

/* */
/*  */
