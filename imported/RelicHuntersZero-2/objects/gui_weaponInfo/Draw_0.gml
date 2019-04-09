///Draw

if (drawBackground) draw_self();

if (myWeapon != noone)
{
    if (sprite_exists(mySprite)) draw_sprite_ext(mySprite,1,x+53,y+27,1.5,1.5,0,c_white,1);
    
    draw_set_font(myFontName);
    draw_set_valign(fa_center);
    draw_set_halign(fa_left);
    
    draw_text_dropshadow_ext_transformed(x+142,y+24,myName,myRarityColor,c_black,0.7,1,1,1,0,1);
    
    var firstGroupX = x+17;
    var firstGroupY = y+68;
    var secondGroupX = x+276;
    var secondGroupY = y+68;
    
    var lineSpacing = 28;
    var columnSpacing1 = 170;
    var columnSpacing2 = 150;
    
    draw_set_font(myFontText);
    
    //First Group
    draw_set_valign(fa_center);
    draw_set_halign(fa_left);
    
    draw_text_dropshadow_ext_transformed(firstGroupX,firstGroupY,loc_key("WEAPON_DAMAGE"),c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(firstGroupX,firstGroupY+lineSpacing,loc_key("WEAPON_RANGE"),c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(firstGroupX,firstGroupY+lineSpacing*2,loc_key("WEAPON_CAPACITY"),c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(firstGroupX,firstGroupY+lineSpacing*3,loc_key("WEAPON_AMMOTYPE"),c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(firstGroupX,firstGroupY+lineSpacing*4,loc_key("WEAPON_AMMOCOST"),c_white,c_black,0.7,1,1,1,0,1);
    
    draw_set_valign(fa_center);
    draw_set_halign(fa_center);
    
    draw_text_dropshadow_ext_transformed(firstGroupX+columnSpacing1,firstGroupY,myDamage,c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(firstGroupX+columnSpacing1,firstGroupY+lineSpacing,myRange,c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(firstGroupX+columnSpacing1,firstGroupY+lineSpacing*2,myCapacity,c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(firstGroupX+columnSpacing1,firstGroupY+lineSpacing*3,myAmmoType,c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(firstGroupX+columnSpacing1,firstGroupY+lineSpacing*4,myAmmoCost,c_white,c_black,0.7,1,1,1,0,1);
    
    //Second Group
    
    draw_set_valign(fa_center);
    draw_set_halign(fa_left);
    
    draw_text_dropshadow_ext_transformed(secondGroupX,secondGroupY,loc_key("WEAPON_IMPACT"),c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(secondGroupX,secondGroupY+lineSpacing,loc_key("WEAPON_RATE"),c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(secondGroupX,secondGroupY+lineSpacing*2,loc_key("WEAPON_RELOAD"),c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(secondGroupX,secondGroupY+lineSpacing*3,loc_key("WEAPON_BURST"),c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(secondGroupX,secondGroupY+lineSpacing*4,loc_key("WEAPON_PIERCING"),c_white,c_black,0.7,1,1,1,0,1);
    
    draw_set_valign(fa_center);
    draw_set_halign(fa_center);
    
    draw_text_dropshadow_ext_transformed(secondGroupX+columnSpacing2,secondGroupY,myImpact,c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(secondGroupX+columnSpacing2,secondGroupY+lineSpacing,myRate,c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(secondGroupX+columnSpacing2,secondGroupY+lineSpacing*2,myReload,c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(secondGroupX+columnSpacing2,secondGroupY+lineSpacing*3,myBurst,c_white,c_black,0.7,1,1,1,0,1);
    draw_text_dropshadow_ext_transformed(secondGroupX+columnSpacing2,secondGroupY+lineSpacing*4,myPiercing,c_white,c_black,0.7,1,1,1,0,1);
}

