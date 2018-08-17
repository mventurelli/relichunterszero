///Draw

draw_self();

    if (sprite_exists(mySprite)) draw_sprite_ext(mySprite,mySpriteImage,x+748,y+110,-3,3,0,c_white,1);

    draw_set_font(myFontName);
    draw_set_valign(fa_center);
    draw_set_halign(fa_left);
    
    draw_text_dropshadow_ext_transformed(x+14,y,myName,c_white,K_BETU_MAGENTA_PAUSE,1,4,1,1,0,1);
    
    var firstGroupX = x+17;
    var firstGroupY = y+28;
    var secondGroupX = x+332;
    var secondGroupY = y+28;
    
    var lineSpacing = 28;
    var columnSpacing1 = 200;
    var columnSpacing2 = 266;
    
    draw_set_font(myFontText);
    draw_set_color(c_white);
    
    //First Group
    draw_set_valign(fa_center);
    draw_set_halign(fa_left);
    draw_text(firstGroupX,firstGroupY+lineSpacing,string_hash_to_newline(loc_key("GENERAL_HP")));
    draw_text(firstGroupX,firstGroupY+lineSpacing*2,string_hash_to_newline(loc_key("GENERAL_SHIELD")));
    draw_text(firstGroupX,firstGroupY+lineSpacing*3,string_hash_to_newline(loc_key("GENERAL_STAMINA")));
    
    draw_set_valign(fa_center);
    draw_set_halign(fa_center);
    
    draw_text(firstGroupX+columnSpacing1,firstGroupY+lineSpacing, string_hash_to_newline(string(myHp) + "/" + string(myHpMax)));
    draw_text(firstGroupX+columnSpacing1,firstGroupY+lineSpacing*2, string_hash_to_newline(string(round(myShield)) + "/" + string(myShieldMax)));
    draw_text(firstGroupX+columnSpacing1,firstGroupY+lineSpacing*3, string_hash_to_newline(string(round(myStamina)) + "/" + string(myStaminaMax)));
    
    
    //Second Group
    draw_set_valign(fa_center);
    draw_set_halign(fa_left);
    
    draw_text(secondGroupX,secondGroupY,string_hash_to_newline(loc_key("GENERAL_LIGHTAMMO")));
    draw_text(secondGroupX,secondGroupY+lineSpacing,string_hash_to_newline(loc_key("GENERAL_MEDIUMAMMO")));
    draw_text(secondGroupX,secondGroupY+lineSpacing*2,string_hash_to_newline(loc_key("GENERAL_HEAVYAMMO")));
    draw_text(secondGroupX,secondGroupY+lineSpacing*3,string_hash_to_newline(loc_key("GENERAL_GRENADES")));
    
    draw_set_valign(fa_center);
    draw_set_halign(fa_center);
    
    draw_text(secondGroupX+columnSpacing2,secondGroupY, string_hash_to_newline(string(myLightAmmo) + "/" + string(myLightAmmoMax)));
    draw_text(secondGroupX+columnSpacing2,secondGroupY+lineSpacing, string_hash_to_newline(string(myMediumAmmo) + "/" + string(myMediumAmmoMax)));
    draw_text(secondGroupX+columnSpacing2,secondGroupY+lineSpacing*2, string_hash_to_newline(string(myHeavyAmmo) + "/" + string(myHeavyAmmoMax)));
    draw_text(secondGroupX+columnSpacing2,secondGroupY+lineSpacing*3, string_hash_to_newline(string(myGrenades) + "/" + string(myGrenadesMax)));
    
    

