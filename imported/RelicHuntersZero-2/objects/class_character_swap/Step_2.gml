///Interact

if (unlock)
{
    if (global.character[1] == myCharacter) || (global.playerCount > 1 && global.character[2] == myCharacter) instance_destroy();
    else active = true;
}

if (activationClient != noone) && (active)
{
    var p = activationClient.myPlayerId;
    
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;
    
    if (wantToActivate) && (in_range)
    {
        global.weapon1[p] = oldWeapon1;
        global.weapon2[p] = oldWeapon2;
        
        if instance_exists(activationClient.weapon1) oldWeapon1 = activationClient.weapon1.object;
        else oldWeapon1 = noone;

        if instance_exists(activationClient.weapon2) oldWeapon2 = activationClient.weapon2.object;
        else oldWeapon2 = noone;
    
        if (myCharacter == char_pinky) 
        {
            myCharacter = global.character[p];
            global.character[p] = char_pinky;
            newChar = instance_create_layer(activationClient.x,activationClient.y,"Interactive",obj_pinky);
        }
        else if (myCharacter == char_jimmy) 
        {
            myCharacter = global.character[p];
            global.character[p] = char_jimmy;
            newChar = instance_create_layer(activationClient.x,activationClient.y,"Interactive",obj_jimmy);
        }
        else if (myCharacter == char_raff) 
        {
            myCharacter = global.character[p];
            global.character[p] = char_raff;
            newChar = instance_create_layer(activationClient.x,activationClient.y,"Interactive",obj_raff);
        }
        else if (myCharacter == char_biu) 
        {
            myCharacter = global.character[p];
            global.character[p] = char_biu;
            newChar = instance_create_layer(activationClient.x,activationClient.y,"Interactive",obj_biu);
        }
        else if (myCharacter == char_punny) 
        {
            myCharacter = global.character[p];
            global.character[p] = char_punny;
            newChar = instance_create_layer(activationClient.x,activationClient.y,"Interactive",obj_punny);
        }
        else if (myCharacter == char_ass) 
        {
            myCharacter = global.character[p];
            global.character[p] = char_ass;
            newChar = instance_create_layer(activationClient.x,activationClient.y,"Interactive",obj_assPlayer);
        }
        else if (myCharacter == char_rider) 
        {
            myCharacter = global.character[p];
            global.character[p] = char_rider;
            newChar = instance_create_layer(activationClient.x,activationClient.y,"Interactive",obj_rider);
        }
        
        newChar.myPlayerId = p;
        isClientLocked = false;
        with (newChar) event_perform(ev_other,ev_user0);
        
        audio_play(newChar.audio_emitter, false, 1, sfx_switch_char);
    }
}

///Unlock

if (myCharacter != char_jimmy) unlock = false;
else unlock = true; 

if (myCharacter == char_rider) unlock = true;

if (myCharacter == char_pinky) && (global.unlockPinky) unlock = true; //Starts unlocked

if (myCharacter == char_raff) && (global.unlockRaff) unlock = true; //Unlocks on teleporter purchase

if (myCharacter == char_biu) && (global.unlockBiu) unlock = true; //Unlocks on boss corpse, no checkpoints

if (myCharacter == char_punny) && (global.unlockPunny) unlock = true; //collect a lot of bounty

if (myCharacter == char_ass) && (global.unlockAss) unlock = true; //get killed at the boss 5 times (corpse)

