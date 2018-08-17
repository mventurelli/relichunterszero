///Init + Check For Dead Players
event_inherited();

range = 100;
in_range = false;

price = 0;
priceTier = global.endPriceTier_revive;
priceArray = global.endPrice_revive;

active = false;
charToSpawn = noone;
idToSpawn = -1;
image_speed = 0.2;

myPrompt = instance_create_layer(x-42,y+38,"Interactive",fx_prompt_e);
owner_add_owned_instance(myPrompt);

depth=-y-2;

//Find Dead Player
var p = 1;

while (p <= global.playerCount){
    if (!global.playerAlive[p]){
        if (global.character[p] == char_jimmy) { charToSpawn = obj_jimmy; sprite_index = spr_jimmy_holo; }
        else if (global.character[p] == char_pinky) { charToSpawn = obj_pinky; sprite_index = spr_pinky_holo; }
        else if (global.character[p] == char_raff) { charToSpawn = obj_raff; sprite_index = spr_raff_holo; }
        else if (global.character[p] == char_biu) { charToSpawn = obj_biu; sprite_index = spr_biu_holo; }
        else if (global.character[p] == char_punny) { charToSpawn = obj_punny; sprite_index = spr_punny_holo; }
        else if (global.character[p] == char_ass) { charToSpawn = obj_assPlayer; sprite_index = spr_ass_holo; }
        else if (global.character[p] == char_rider) { charToSpawn = obj_rider; sprite_index = spr_rider_holo; }
        
        if (charToSpawn != noone) idToSpawn = p;
    }
    p++;
}


//Activation Toggle
if (charToSpawn != noone) && (idToSpawn != -1) active = true;

