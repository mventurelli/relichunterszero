///Find my challenge / Update price
event_inherited();

if (allowNewChallenge){
    var listSize = ds_list_size(global.challengeList);
    
    if (listSize > myNumber) {
        myChallenge = ds_list_find_value(global.challengeList,(listSize-1-myNumber) );
                
        sprite_index = spr_terminalChallengeUnique;
        if (myChallenge == "CHALLENGE_STEROIDS") || (myChallenge == "CHALLENGE_WANTED") || (myChallenge == "CHALLENGE_REINFORCEMENTS") || (myChallenge == "CHALLENGE_HIGHTECH")
        {
            sprite_index = spr_terminalChallengeCommon;
        }     
        allowNewChallenge = false;   
    }
}

///Set my price

if (myChallenge != "") {
    if (sprite_index == spr_terminalChallengeCommon) priceArray = global.endPrice_hackCommon;
    else priceArray = global.endPrice_hackUnique;

    priceTier = global.endPriceTier_hack;
    price = priceArray [ min(priceTier,9) ];
    
    if (myChallenge == "CHALLENGE_HUNTED") price = global.endPrice_hackHunted;
    if (myChallenge == "CHALLENGE_HAUNTED") price = global.endPrice_hackHaunted;
    
    name = loc_key("SAE_INFO_REMOVE") + " " + loc_key(myChallenge);
}
else{
    price = 0;
    name = loc_key("SAE_TERMINAL_CLEAR");
}

