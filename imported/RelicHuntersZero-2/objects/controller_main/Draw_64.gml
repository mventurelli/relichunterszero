
///Set GUI Size
originalX = 1920;
originalY = 1080;
display_set_gui_size(window_get_width(), window_get_height());

///Main HUD Draw

if (!surface_exists(guiSurface))
{
    guiSurface = surface_create(1920,1080);
}
surface_set_target(guiSurface);
draw_clear_alpha(c_white,0);

draw_set_alpha(main_hud_alpha);

var width = 1920;
var height = 1080;

var p = 1;
var playerInstanceNumber = 0;
while (p <= global.playerCount)
{
    var curPlayer = instance_find(class_player,playerInstanceNumber);
    if (curPlayer) && instance_exists(curPlayer)
    {
        //Get Basic Player Values
        var energy = curPlayer.energy;
        var energy_max = curPlayer.energy_max + curPlayer.overshield;
        var hp = curPlayer.hp;
        var hp_max = curPlayer.hp_max;
        var stamina = curPlayer.stamina;
        var stamina_max = curPlayer.stamina_max;
        var playerId = curPlayer.myPlayerId;
        
        //Character Portrait
        if playerId == 1
        {
            var charPortraitX = width*0.02;
            var charPortraitY = height*0.09;
            var charPortraitOrientation = 1;
        }
        else
        {
            var charPortraitX = width*0.98;
            var charPortraitY = height*0.09;
            var charPortraitOrientation = -1;
        }
        
        
        if (curPlayer.hp >= curPlayer.hp_max*0.66) { sprite_face = 0; healthColor = c_white; }
        if (curPlayer.hp < curPlayer.hp_max*0.66) { sprite_face = 1; healthColor = c_yellow; }
        if (curPlayer.hp < curPlayer.hp_max*0.33) { sprite_face = 2; healthColor = c_red; }
        
        if (global.character[playerId] == char_jimmy) draw_sprite_ext(spr_hud_face_jimmy,sprite_face,charPortraitX,charPortraitY,1.5*charPortraitOrientation,1.5,1,c_white,main_hud_alpha);
        if (global.character[playerId] == char_pinky) draw_sprite_ext(spr_hud_face_pinky,sprite_face,charPortraitX,charPortraitY,1.5*charPortraitOrientation,1.5,1,c_white,main_hud_alpha);
        if (global.character[playerId] == char_raff) draw_sprite_ext(spr_hud_face_raff,sprite_face,charPortraitX,charPortraitY,1.5*charPortraitOrientation,1.5,1,c_white,main_hud_alpha);
        if (global.character[playerId] == char_biu) draw_sprite_ext(spr_hud_face_biu,sprite_face,charPortraitX,charPortraitY,1.5*charPortraitOrientation,1.5,1,c_white,main_hud_alpha);
        if (global.character[playerId] == char_punny) draw_sprite_ext(spr_hud_face_punny,sprite_face,charPortraitX,charPortraitY,1.5*charPortraitOrientation,1.5,1,c_white,main_hud_alpha);
        if (global.character[playerId] == char_ass) draw_sprite_ext(spr_hud_face_ass,sprite_face,charPortraitX,charPortraitY,1.5*charPortraitOrientation,1.5,1,c_white,main_hud_alpha);
        if (global.character[playerId] == char_rider) draw_sprite_ext(spr_hud_face_rider,sprite_face,charPortraitX,charPortraitY,1.5*charPortraitOrientation,1.5,1,c_white,main_hud_alpha);
        
        //Character Bars
        var charLifeBarTopX = width*0.08;
        var charLifeBarTopY = height*0.062;
        var charLifeBarWidth = 250;
        var charLifeBarHeight = 70;
        
        var charShieldBarTopX = width*0.076;
        var charShieldBarTopY = height*0.1;
        var charShieldBarWidth = 230;
        var charShieldBarHeight = 37;
        
        var charStaminaBarTopX = charShieldBarTopX;
        var charStaminaBarTopY = charShieldBarTopY+charShieldBarHeight+6;
        var charStaminaBarWidth = 230;
        var charStaminaBarHeight = 10;
        
        if (playerId != 1)
        {
            charLifeBarTopX = width*0.92 - charLifeBarWidth;
            charShieldBarTopX = width*0.924 - charShieldBarWidth;
            charStaminaBarTopX = charShieldBarTopX;
        }
        
        draw_set_valign(fa_center);
        draw_set_halign(fa_right);
        
        var charLifeColor = make_color_rgb(184,49,35);
        var charShieldColor = make_color_rgb(50,133,158);
        if (curPlayer.overshield) && (energy > curPlayer.energy_max) charShieldColor = make_color_rgb(86,216,255);
        if (curPlayer.superShield) charShieldColor = K_BETU_ORANGE;
        var charBarDelaySpeed = 0.008;
        var charBarDelayTime = 600000;//room_speed*0.6;
        
        //Health
        draw_set_color(c_black);
        draw_set_alpha(0.8*main_hud_alpha);
        draw_rectangle(charLifeBarTopX,charLifeBarTopY,charLifeBarTopX+charLifeBarWidth,charLifeBarTopY+charLifeBarHeight,false);
        draw_set_alpha(0.9*main_hud_alpha);
        draw_healthbar_delayed(delayedCharHealthBar1[playerId], charLifeBarTopX-5,charLifeBarTopY-5,charLifeBarTopX+charLifeBarWidth-5,charLifeBarTopY+charLifeBarHeight-5, hp, hp_max, charLifeColor, c_black, c_white, charBarDelaySpeed, charBarDelayTime, 0, false, false);
        draw_sprite_ext(spr_icon_health,0,charLifeBarTopX+20,charLifeBarTopY+20,1.5,1.5,0,c_white,main_hud_alpha);
        
        draw_set_color(c_white);
        draw_set_font(global.font_numberLarge);
        draw_text(charLifeBarTopX+charLifeBarWidth-14, charLifeBarTopY+14,string_hash_to_newline(string(hp)));
        
        //Shields & Stamina
        draw_set_color(c_black);
        draw_set_alpha(0.8*main_hud_alpha);
        draw_rectangle(charShieldBarTopX,charShieldBarTopY,charShieldBarTopX+charShieldBarWidth,charShieldBarTopY+charShieldBarHeight,false);
        draw_rectangle(charStaminaBarTopX,charStaminaBarTopY,charStaminaBarTopX+charStaminaBarWidth,charStaminaBarTopY+charStaminaBarHeight,false);
        
        draw_set_alpha(0.9*main_hud_alpha);
        if (energy_max) draw_healthbar_delayed(delayedCharShieldBar1[playerId], charShieldBarTopX-5,charShieldBarTopY-5,charShieldBarTopX+charShieldBarWidth-5,charShieldBarTopY+charShieldBarHeight-5, energy, energy_max, charShieldColor, c_black, c_white, charBarDelaySpeed, charBarDelayTime, 0, false, false);
        draw_sprite_ext(spr_icon_shield,0,charShieldBarTopX+20,charShieldBarTopY+(charShieldBarHeight/2),1.5,1.5,0,c_white,main_hud_alpha);
        draw_set_color(c_white);
        draw_set_font(global.font_numberMedium);
        draw_text(charLifeBarTopX+charShieldBarWidth-16, charShieldBarTopY+12,string_hash_to_newline(string(round(energy))));
        
        var staminaColor1,staminaColor2;
        if (stamina > (stamina_max/2)) staminaColor1 = c_white;
        else staminaColor1 = c_gray;
        if (stamina >= (stamina_max)) staminaColor2 = c_white;
        else staminaColor2 = c_gray;
        draw_healthbar(charStaminaBarTopX-2, charStaminaBarTopY-2, charStaminaBarTopX+(charStaminaBarWidth/2)-4, charStaminaBarTopY+charStaminaBarHeight-2, min( 1,(stamina/(stamina_max/2)) )*100, c_black, staminaColor1, staminaColor1, 0, false, false);
        var secondValue = stamina-(stamina_max/2);
        if (secondValue) draw_healthbar(charStaminaBarTopX+(charStaminaBarWidth/2), charStaminaBarTopY-2, charStaminaBarTopX+charStaminaBarWidth-2, charStaminaBarTopY+charStaminaBarHeight-2, ( secondValue/(stamina_max/2 ))*100, c_black, staminaColor2, staminaColor2, 0, false, false);  
        
        
        //Main Weapon HUD
        var weaponSelectedX = width*0.05;
        var weaponSelectedY = height*0.9;
        var weaponBackX = width*0.03;
        var weaponBackY = height*0.95;
        
        if (playerId != 1)
        {
            weaponSelectedX = width*0.92;
            weaponBackX = width*0.90;
        }
        
        var weaponSelected = noone;
        var weaponBack = noone;
        
        var stupidOffsetSelectedY = 0; //because of gloves and buckler. Not called "stupid" lightly
        var stupidOffsetBackY = 0;
        var stupidOverrideSpriteSelected = -1;
        var stupidOverrideSpriteBack = -1;
        
        if (curPlayer.weapon1) && (instance_exists(curPlayer.weapon1))
        {
            if (curPlayer.weapon1.isActive) 
            {
                weaponSelected = curPlayer.weapon1;  
                if (curPlayer.weapon1 == obj_gloves)    { stupidOverrideSpriteSelected = spr_gloves_idle;  stupidOffsetSelectedY=22; }
                if (curPlayer.weapon1 == obj_buckler)   { stupidOverrideSpriteSelected = spr_buckler_idle; stupidOffsetSelectedY=42; }
            }
            else{
                weaponBack = curPlayer.weapon1;
                if (curPlayer.weapon1 == obj_gloves)    { stupidOverrideSpriteBack = spr_gloves_idle;  stupidOffsetBackY=22; }
                if (curPlayer.weapon1 == obj_buckler)   { stupidOverrideSpriteBack = spr_buckler_idle; stupidOffsetBackY=42; }
            }
        }
        if (curPlayer.weapon2) && (instance_exists(curPlayer.weapon2))
        {
            if (weaponSelected == noone) && (curPlayer.weapon2.isActive)
            {
                weaponSelected = curPlayer.weapon2;
                if (curPlayer.weapon2 == obj_gloves)    { stupidOverrideSpriteSelected = spr_gloves_idle;  stupidOffsetSelectedY=22; }
                if (curPlayer.weapon2 == obj_buckler)   { stupidOverrideSpriteSelected = spr_buckler_idle; stupidOffsetSelectedY=42; }
            }
            else{
                weaponBack = curPlayer.weapon2;
                if (curPlayer.weapon2 == obj_gloves)    { stupidOverrideSpriteBack = spr_gloves_idle;  stupidOffsetBackY=22; }
                if (curPlayer.weapon2 == obj_buckler)   { stupidOverrideSpriteBack = spr_buckler_idle; stupidOffsetBackY=42; }
            }
        }
        
        var weaponSelectedSprite = -1;
        var weaponSelectedColor = c_black;
        
        if (instance_exists(weaponSelected))
        {
            weaponSelectedSprite = weaponSelected.sprite_index;
            if (weaponSelected.ammo_type == type_light) weaponSelectedColor = K_BETU_GREEN2;
            if (weaponSelected.ammo_type == type_medium) weaponSelectedColor = K_BETU_RED;
            if (weaponSelected.ammo_type == type_heavy) weaponSelectedColor = K_BETU_BLUE;
            
            if (stupidOverrideSpriteSelected) weaponSelectedSprite = stupidOverrideSpriteSelected;
        }
        
        var weaponBackSprite = -1;
        var weaponBackColor = c_black;
        
        if (instance_exists(weaponBack))
        {
            weaponBackSprite = weaponBack.sprite_index;
            if (weaponBack.ammo_type == type_light) weaponBackColor = K_BETU_GREEN2;
            if (weaponBack.ammo_type == type_medium) weaponBackColor = K_BETU_RED;
            if (weaponBack.ammo_type == type_heavy) weaponBackColor = K_BETU_BLUE;
            
            if (stupidOverrideSpriteBack) weaponBackSprite = stupidOverrideSpriteBack;
        }
        
        if (sprite_exists(weaponSelectedSprite)) 
        {
            draw_sprite_ext(weaponSelectedSprite, 2, weaponSelectedX+4, weaponSelectedY+stupidOffsetSelectedY+4, 2, 2, 0, c_black, 0.8*main_hud_alpha);
            draw_sprite_ext(weaponSelectedSprite, 2, weaponSelectedX, weaponSelectedY+stupidOffsetSelectedY, 2, 2, 0, weaponSelectedColor, main_hud_alpha);
        }
        if (sprite_exists(weaponBackSprite)) draw_sprite_ext(weaponBackSprite, 2, weaponBackX, weaponBackY+stupidOffsetBackY, 2, 2, 0, weaponBackColor, 0.8*main_hud_alpha);
        
        
        //Ammo Numbers
        
        var ammoNumberGunX = width*0.17;
        var ammoNumberGunY = height*0.9;
        var ammoNumberTotalX = ammoNumberGunX+8;
        var ammoNumberTotalY = ammoNumberGunY+18;
        
        var ammoBarTotalWidth = 40;
        var ammoBarTotalHeight = 16;
        var ammoBarDelaySpeed = 0.004;
        var ammoBarDelayTime = room_speed*0.6;
        var ammoBarTotalX = ammoNumberTotalX+(ammoBarTotalWidth/2);
        var ammoBarTotalY = ammoNumberGunY-8;
        
        if (playerId != 1)
        {
            ammoNumberGunX = width*0.83;
            ammoNumberTotalX = ammoNumberGunX+8;
            ammoBarTotalX = ammoNumberTotalX+(ammoBarTotalWidth/2);
        }
        
        if (instance_exists(weaponSelected))
        {
            //Gun Ammo
            draw_set_halign(fa_right);
            draw_set_valign(fa_center);
            draw_set_font(global.font_numberVeryLarge);
            draw_text_dropoutline_ext_transformed(ammoNumberGunX, ammoNumberGunY, string(weaponSelected.ammo_current), c_white, c_white, c_black, 1, 5, 1, 1, 0, main_hud_alpha);
            
            //Total Ammo
            var pAmmoTotal = 0;
            var pAmmoTotalMax = 0;
            var pAmmoBarId = -1;
            if (weaponSelected.ammo_type == type_light)   { pAmmoTotal = global.ammo_light[playerId];    pAmmoTotalMax = global.ammo_light_max;   pAmmoBarId =  delayedAmmoLightBar[playerId]; }
            if (weaponSelected.ammo_type == type_medium)  { pAmmoTotal = global.ammo_medium[playerId];   pAmmoTotalMax = global.ammo_medium_max;  pAmmoBarId =  delayedAmmoMediumBar[playerId]; }
            if (weaponSelected.ammo_type == type_heavy)   { pAmmoTotal = global.ammo_heavy[playerId];    pAmmoTotalMax = global.ammo_heavy_max;   pAmmoBarId =  delayedAmmoHeavyBar[playerId]; }
            draw_set_halign(fa_left);
            draw_set_valign(fa_center);
            draw_set_font(global.font_numberMedium);
            
            if (weaponSelected.ammo_cost > 0) draw_text_dropshadow_ext_transformed(ammoNumberTotalX, ammoNumberTotalY, string(floor(pAmmoTotal/weaponSelected.ammo_cost)), c_white, c_black, 0.8, 2, 1, 1,0, main_hud_alpha);
        
            //Total Ammo Bar
            draw_healthbar_delayed(pAmmoBarId, ammoBarTotalX-(ammoBarTotalWidth/2), ammoBarTotalY-(ammoBarTotalHeight/2), ammoBarTotalX+(ammoBarTotalWidth/2), ammoBarTotalY+(ammoBarTotalHeight/2), 
            pAmmoTotal, pAmmoTotalMax, weaponSelectedColor, c_black, c_white, ammoBarDelaySpeed, ammoBarDelayTime, 0, false, false);  
        }
        
        //Grenades
            var grenadesVerSpacing = 30;
            var grenadesHorSpacing = 25;
            var grenadesHorOrientation = 1;
            
            var pGrenadesX = width*0.025;
            var pGrenadesY = height*0.85;
            
            if (playerId != 1) 
            {
                pGrenadesX = width*0.975;
                grenadesHorOrientation = -1;
            }
            
            var grenadeCount = global.grenades[playerId];
            var grMaxHorizontal = 5;
            var grDrawCount = 0;
            var grOffsetX = 0;
            var grOffsetY = 0;
            
            if (grenadeCount) repeat (grenadeCount)
            {
                draw_sprite_ext(spr_grenadeNew,0,pGrenadesX+grOffsetX, pGrenadesY+grOffsetY, 1, 1, 0, c_white, main_hud_alpha);
                grOffsetX += grenadesHorSpacing*grenadesHorOrientation;
                grDrawCount++;
                if (grDrawCount >= grMaxHorizontal)
                {
                    grOffsetX = 0;
                    grOffsetY -= grenadesVerSpacing;
                    grDrawCount = 0;
                }
            }
            else if (global.character[playerId] == char_rider) {
                //If it's rider, draw a special grenade icon for zero grenades
                draw_sprite_ext(spr_grenadeNew,0,pGrenadesX+grOffsetX, pGrenadesY+grOffsetY, 1, 1, 0, c_white, main_hud_alpha);
                draw_sprite_ext(spr_icon_health,0,pGrenadesX+grOffsetX+8, pGrenadesY+grOffsetY+8, 1, 1, 0, K_BETU_RED, main_hud_alpha);
            }
        
        //draw gui_score
        if (global.guiScore.showScore)
        {
            draw_set_halign(fa_center);
            draw_set_valign(fa_center);
            
            var drawScoreX = width*0.5;
            var drawScoreY = height*0.15;
            
			if (global.guiScore.myString != "") {
				draw_set_font(global.font_numberLarge);
				draw_text_dropoutline_ext_transformed(drawScoreX,drawScoreY,global.guiScore.myString,c_white,c_white,c_black,0.7,4,1,1,0,main_hud_alpha);
            }
			
            draw_set_font(global.font_numberVeryLarge);
            draw_text_dropoutline_ext_transformed(drawScoreX,drawScoreY+43,"+"+string(global.guiScore.value),c_white,c_white,c_black,0.7,4,global.guiScore.size_current,global.guiScore.size_current,0,main_hud_alpha);
        }
        
        //fx_bigMessage Objects  
        if instance_exists(fx_bigMessage)
        {
            draw_set_halign(fa_center);
            draw_set_valign(fa_center);
            var drawBigX = width*0.5;
            var drawBigY = height*0.62;
        
            for (var big=0; big<instance_number(fx_bigMessage); big++)
            {
                var bigMessage = instance_find(fx_bigMessage,big);
                if (bigMessage.active)
                {
                    draw_set_font(bigMessage.textBigFont);
                    draw_text_dropoutline_ext_transformed(drawBigX,drawBigY,bigMessage.textBig,bigMessage.textBigColor,bigMessage.textBigColor,c_black,0.7,4,1,1,0, bigMessage.myAlpha);
                    
                    draw_set_font(bigMessage.textSmallFont);
                    draw_text_dropoutline_ext_transformed(drawBigX,drawBigY+43,bigMessage.textSmall,bigMessage.textSmallColor,bigMessage.textSmallColor,c_black,0.7,4,1,1,0, bigMessage.myAlpha);
                
                    if (bigMessage.relicCompleteSprite != -1) draw_sprite_ext(bigMessage.relicCompleteSprite,0,drawBigX,drawBigY-43,2,2,0,c_white,bigMessage.myAlpha);
                    else if (bigMessage.hunterUnlockSprite != -1) draw_sprite_ext(bigMessage.hunterUnlockSprite,0,drawBigX,drawBigY-50,1,1,0,c_white,bigMessage.myAlpha);
                    else if (bigMessage.relicSprite1 != -1)
                    {
                        var relicBlend;
                        if (bigMessage.relicSprite1Draw) relicBlend = c_white;  else relicBlend = c_black;
                        draw_sprite_ext(bigMessage.relicSprite1,0,drawBigX-70,drawBigY-43,2,2,0,relicBlend,bigMessage.myAlpha);
                        if (bigMessage.relicSprite2Draw) relicBlend = c_white;  else relicBlend = c_black;
                        draw_sprite_ext(bigMessage.relicSprite2,0,drawBigX,drawBigY-43,2,2,0,relicBlend,bigMessage.myAlpha);
                        if (bigMessage.relicSprite3Draw) relicBlend = c_white;  else relicBlend = c_black;
                        draw_sprite_ext(bigMessage.relicSprite3,0,drawBigX+70,drawBigY-43,2,2,0,relicBlend,bigMessage.myAlpha);
                    }
                }
            }
        }
        
        //Draw Dynamic Ammo Bars
        draw_set_halign(fa_center);
        draw_set_valign(fa_center);
        draw_set_alpha(main_hud_alpha);
        
        var dynamicAmmoObj = gui_dynamic_ammo1;
        
        var dynamicAmmoX = -1*width*0.1;
        var dynamicAmmoY1 = height*0.46;
        var dynamicAmmoY2 = height*0.5;
        var dynamicAmmoY3 = height*0.54;
        var dynamicAmmoBarHeight = 32;
        var dynamicAmmoBarWidth = 160;
        
        if (playerId != 1)
        {
            dynamicAmmoObj = gui_dynamic_ammo2;
            dynamicAmmoX = width*1.1;
        }
            
        var dynamicAmmoString1 = loc_key("GENERAL_LIGHTAMMO");
        var dynamicAmmoString2 = loc_key("GENERAL_MEDIUMAMMO");
        var dynamicAmmoString3 = loc_key("GENERAL_HEAVYAMMO");
            
        if (instance_exists(dynamicAmmoObj))
        {
            var bgX1 = dynamicAmmoX-(dynamicAmmoBarWidth/2) + dynamicAmmoObj.offsetX;
            var bgX2 = dynamicAmmoX+(dynamicAmmoBarWidth/2) + dynamicAmmoObj.offsetX;
            
            var bg1Y1 = dynamicAmmoY1-(dynamicAmmoBarHeight/2) +dynamicAmmoObj.offsetY;
            var bg1Y2 = dynamicAmmoY1+(dynamicAmmoBarHeight/2) +dynamicAmmoObj.offsetY;
            var bg2Y1 = dynamicAmmoY2-(dynamicAmmoBarHeight/2) +dynamicAmmoObj.offsetY;
            var bg2Y2 = dynamicAmmoY2+(dynamicAmmoBarHeight/2) +dynamicAmmoObj.offsetY;
            var bg3Y1 = dynamicAmmoY3-(dynamicAmmoBarHeight/2) +dynamicAmmoObj.offsetY;
            var bg3Y2 = dynamicAmmoY3+(dynamicAmmoBarHeight/2) +dynamicAmmoObj.offsetY;
            
            draw_set_color(c_black);
            draw_set_alpha(0.8*main_hud_alpha);
            draw_rectangle(bgX1,bg1Y1,bgX2,bg1Y2,false);
            draw_rectangle(bgX1,bg2Y1,bgX2,bg2Y2,false);
            draw_rectangle(bgX1,bg3Y1,bgX2,bg3Y2,false);
            
            draw_set_halign(fa_center);
            draw_set_valign(fa_center);
            draw_set_alpha(main_hud_alpha);
            var ammoBarLightColor = make_color_rgb(0,178,77);
            var ammoBarMediumColor = make_color_rgb(178,0,65);
            var ammoBarHeavyColor = make_color_rgb(0,88,178);
            
            var ammoBarDelaySpeed = 0.004;
            var ammoBarDelayTime = room_speed*0.6;
            
            draw_healthbar_delayed(delayedAmmoLightBar[playerId], bgX1-2,bg1Y1-2,bgX2-2,bg1Y2-2, global.ammo_light[playerId], global.ammo_light_max, ammoBarLightColor, c_black, c_white, ammoBarDelaySpeed, ammoBarDelayTime, 0, false, false);
            draw_healthbar_delayed(delayedAmmoMediumBar[playerId], bgX1-2,bg2Y1-2,bgX2-2,bg2Y2-2, global.ammo_medium[playerId], global.ammo_medium_max, ammoBarMediumColor, c_black, c_white, ammoBarDelaySpeed, ammoBarDelayTime, 0, false, false);
            draw_healthbar_delayed(delayedAmmoHeavyBar[playerId], bgX1-2,bg3Y1-2,bgX2-2,bg3Y2-2, global.ammo_heavy[playerId], global.ammo_heavy_max, ammoBarHeavyColor, c_black, c_white, ammoBarDelaySpeed, ammoBarDelayTime, 0, false, false);
        
            draw_set_font(global.font_numberSmall);
            draw_set_halign(fa_left);
            
            draw_text_dropshadow_ext_transformed(bgX1+3,dynamicAmmoY1+dynamicAmmoObj.offsetY,dynamicAmmoString1,c_white,c_black,0.7,1,1,1,0,main_hud_alpha);
            draw_text_dropshadow_ext_transformed(bgX1+3,dynamicAmmoY2+dynamicAmmoObj.offsetY,dynamicAmmoString2,c_white,c_black,0.7,1,1,1,0,main_hud_alpha);
            draw_text_dropshadow_ext_transformed(bgX1+3,dynamicAmmoY3+dynamicAmmoObj.offsetY,dynamicAmmoString3,c_white,c_black,0.7,1,1,1,0,main_hud_alpha);
        }
        
        //Boss Fight Lifebar
		var roomname = room_get_name(room);
        if ((roomname == "room_boss") && instance_exists(obj_boss))
        {
            draw_set_halign(fa_center);
            draw_set_valign(fa_center);
            
            var drawBossX1 = width*0.3;
            var drawBossY1 = height*0.9;
            var drawBossX2 = width*0.7;
            var drawBossY2 = height*0.95;
            
            var drawBossColorMain = c_red;
            var drawBossColorDelay = c_white;
            var drawBossColorBack = c_black;
            var drawBossColorGenerator = c_blue;
            
            var drawBossDelayTime = room_speed*0.6;
            var drawBossDelaySpeed = 0.0025;
            
            var allowBossDraw = true;
            var drawBossText = loc_key("BOSS_DUCANCOMMANDER");
            
            //Draw Generator1 Healthbar
            if (obj_boss.hpMilestoneCurrent == 1) && (instance_exists(obj_generator1))
            {
                allowBossDraw = false;
                
                if (isGen1Setup) draw_healthbar_delayed(bossBar,drawBossX1, drawBossY1, drawBossX2, drawBossY2, obj_generator1.hp, obj_generator1.maxhp, drawBossColorGenerator, drawBossColorBack, drawBossColorDelay, drawBossDelaySpeed, drawBossDelayTime,0,true,false);
                else{
                    draw_healthbar(drawBossX1, drawBossY1, drawBossX2, drawBossY2,fakeBarFill,drawBossColorBack,drawBossColorGenerator,drawBossColorGenerator,0,true,false);
                    if (fakeBarFill < 100) fakeBarFill++;
                    else { isGen1Setup = true; fakeBarFill=0; }
                }
                 draw_sprite(spr_boss_barGen,0,drawBossX1,drawBossY1+((drawBossY2-drawBossY1)/2));
            }
            
            //Draw Generator2 Healthbar
            if (obj_boss.hpMilestoneCurrent == 2) && (instance_exists(obj_generator2))
            {
                allowBossDraw = false;
                
                if (isGen1Setup) draw_healthbar_delayed(bossBar,drawBossX1, drawBossY1, drawBossX2, drawBossY2, obj_generator2.hp, obj_generator2.maxhp, drawBossColorGenerator, drawBossColorBack, drawBossColorDelay, drawBossDelaySpeed, drawBossDelayTime,0,true,false);
                else{
                    draw_healthbar(drawBossX1, drawBossY1, drawBossX2, drawBossY2,fakeBarFill,drawBossColorBack,drawBossColorGenerator,drawBossColorGenerator,0,true,false);
                    if (fakeBarFill < 100) fakeBarFill++;
                    else { isGen1Setup = true; fakeBarFill=0; }
                }
                 draw_sprite(spr_boss_barGen,0,drawBossX1,drawBossY1+((drawBossY2-drawBossY1)/2));
            }
            
            //Draw Generator3 Healthbar
            if (obj_boss.hpMilestoneCurrent == 4) && (instance_exists(obj_generator3))
            {
                allowBossDraw = false;
                
                if (isGen1Setup) draw_healthbar_delayed(bossBar,drawBossX1, drawBossY1, drawBossX2, drawBossY2, obj_generator3.hp, obj_generator3.maxhp, drawBossColorGenerator, drawBossColorBack, drawBossColorDelay, drawBossDelaySpeed, drawBossDelayTime,0,true,false);
                else{
                    draw_healthbar(drawBossX1, drawBossY1, drawBossX2, drawBossY2,fakeBarFill,drawBossColorBack,drawBossColorGenerator,drawBossColorGenerator,0,true,false);
                    if (fakeBarFill < 100) fakeBarFill++;
                    else { isGen1Setup = true; fakeBarFill=0; }
                }
                draw_sprite(spr_boss_barGen,0,drawBossX1,drawBossY1+((drawBossY2-drawBossY1)/2));
            }
            
            //Draw Boss Healthbar
            if (allowBossDraw)
            {
                if (isBossSetup) draw_healthbar_delayed(bossBar,drawBossX1, drawBossY1, drawBossX2, drawBossY2, obj_boss.hp, obj_boss.hp_max, drawBossColorMain, drawBossColorBack, drawBossColorDelay, drawBossDelaySpeed, drawBossDelayTime,0,true,false);
                else{
                    draw_healthbar(drawBossX1, drawBossY1, drawBossX2, drawBossY2,fakeBarFill,drawBossColorBack,drawBossColorMain,drawBossColorMain,0,true,false);
                    if (fakeBarFill < 100) fakeBarFill++;
                    else { isBossSetup = true; fakeBarFill=0; }
                }
                var bossImage = 0;
                if (obj_boss.hpMilestoneCurrent == 2) bossImage = 1;
                if (obj_boss.hpMilestoneCurrent == 4) bossImage = 2;
                draw_sprite(spr_boss_barFace,bossImage,drawBossX1,drawBossY1+((drawBossY2-drawBossY1)/2));
            }
            else drawBossText = loc_key("BOSS_SHIELDGENERATOR");
            
            draw_set_font(global.font_menuLarge);
            draw_set_color(c_white);
            draw_set_halign(fa_center);
            draw_set_valign(fa_center);
            
            draw_text( drawBossX1+((drawBossX2-drawBossX1)/2), drawBossY1+((drawBossY2-drawBossY1)/2), string_hash_to_newline(drawBossText));
        }
    }
    p++;
    playerInstanceNumber++;
}

//Dynamic Bounty
draw_set_halign(fa_right);
draw_set_valign(fa_center);
draw_set_font(global.font_numberLarge);
draw_set_color(c_white);
if (!global.pauseMenu) draw_set_alpha(main_hud_alpha);
else draw_set_alpha(1);

var dynamicBountyX = width*0.5;
var dynamicBountyY = -1*height*0.1;
var bountyString, scrapString;

if (global.gameMode == gamemode_endless) || (global.gameMode == gamemode_storm)
{
	dynamicBountyX = width*0.45;	
	bountyString = string(global.bountyEndless);
	scrapString = string(global.scrapEndless);
}
else bountyString = string(global.score_total);

if (instance_exists(gui_dynamic_bounty))
{
    draw_sprite(gui_dynamic_bounty.sprite_index,gui_dynamic_bounty.image_index, dynamicBountyX+gui_dynamic_bounty.offsetX, dynamicBountyY+gui_dynamic_bounty.offsetY);
    draw_text(dynamicBountyX+gui_dynamic_bounty.offsetX+103, dynamicBountyY+gui_dynamic_bounty.offsetY+2, bountyString);
	if (global.gameMode != gamemode_adventure) draw_text(dynamicBountyX+gui_dynamic_bounty.offsetX+300, dynamicBountyY+gui_dynamic_bounty.offsetY+2, scrapString);
}

//Dynamic Relics

var dynamicRelicX1 = width*0.35;
var dynamicRelicX2 = width*0.5;
var dynamicRelicX3 = width*0.65;
var dynamicRelicY = height*1.1;

var offsetRelicSpriteX = -87;
var offsetRelicSpriteY = 2;
var offsetRelicStringX = 36;
var offsetRelicStringY = -8;
 
draw_set_alpha(main_hud_alpha);
draw_set_color(c_white);
draw_set_font(global.font_numberMedium);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
var relicTextSep = 30;
var relicTextWidth = 132;
/*
if (instance_exists(gui_dynamic_relic1)) 
{
    if (sprite_exists(gui_dynamic_relic1.sprite_index)) draw_sprite(gui_dynamic_relic1.sprite_index,gui_dynamic_relic1.image_index, dynamicRelicX1+gui_dynamic_relic1.offsetX, dynamicRelicY+gui_dynamic_relic1.offsetY); 
    if (sprite_exists(gui_dynamic_relic1.mySprite)) draw_sprite_ext(gui_dynamic_relic1.mySprite,0, (dynamicRelicX1 +gui_dynamic_relic1.offsetX +offsetRelicSpriteX), (dynamicRelicY +gui_dynamic_relic1.offsetY +offsetRelicSpriteY),1.5,1.5,0,c_white,main_hud_alpha); 
    draw_text_ext((dynamicRelicX1 +gui_dynamic_relic1.offsetX +offsetRelicStringX), (dynamicRelicY +gui_dynamic_relic1.offsetY +offsetRelicStringY), string_hash_to_newline(gui_dynamic_relic1.myString), relicTextSep, relicTextWidth );
}

if (instance_exists(gui_dynamic_relic2))
{
    if (sprite_exists(gui_dynamic_relic2.sprite_index)) draw_sprite(gui_dynamic_relic2.sprite_index,gui_dynamic_relic2.image_index, dynamicRelicX2+gui_dynamic_relic2.offsetX, dynamicRelicY+gui_dynamic_relic2.offsetY);
    if (sprite_exists(gui_dynamic_relic2.mySprite)) draw_sprite_ext(gui_dynamic_relic2.mySprite,0, (dynamicRelicX2 +gui_dynamic_relic2.offsetX +offsetRelicSpriteX), (dynamicRelicY +gui_dynamic_relic2.offsetY +offsetRelicSpriteY),1.5,1.5,0,c_white,main_hud_alpha);
    draw_text_ext((dynamicRelicX2 +gui_dynamic_relic2.offsetX +offsetRelicStringX), (dynamicRelicY +gui_dynamic_relic2.offsetY +offsetRelicStringY), string_hash_to_newline(gui_dynamic_relic2.myString), relicTextSep, relicTextWidth );
}

if (instance_exists(gui_dynamic_relic3)) 
{
    if (sprite_exists(gui_dynamic_relic3.sprite_index))  draw_sprite(gui_dynamic_relic3.sprite_index,gui_dynamic_relic3.image_index, dynamicRelicX3+gui_dynamic_relic3.offsetX, dynamicRelicY+gui_dynamic_relic3.offsetY);
    if (sprite_exists(gui_dynamic_relic3.mySprite)) draw_sprite_ext(gui_dynamic_relic3.mySprite,0, (dynamicRelicX3 +gui_dynamic_relic3.offsetX +offsetRelicSpriteX), (dynamicRelicY +gui_dynamic_relic3.offsetY +offsetRelicSpriteY),1.5,1.5,0,c_white,main_hud_alpha); 
    draw_text_ext((dynamicRelicX3 +gui_dynamic_relic3.offsetX +offsetRelicStringX), (dynamicRelicY +gui_dynamic_relic3.offsetY +offsetRelicStringY), string_hash_to_newline(gui_dynamic_relic3.myString), relicTextSep, relicTextWidth );
}
*/

//Show Challenges on Pause Menu
if (global.pauseMenu) && (global.gameMode == gamemode_endless)
{
    if (ds_exists(global.challengeList,ds_type_list))
    {
        var chIconX = width*0.02;
        var chX = width*0.035;
        var chY = height*0.57;
        var chSpacing = 48;
        var chSpacingCurrent = 0;
        
        draw_set_font(global.font_numberLarge);
        draw_set_valign(fa_center);
        draw_set_halign(fa_left);
        draw_set_color(c_white);
    
        var listSize = ds_list_size(global.challengeList);
        if (listSize) for (var i=listSize-1; i>=0; i--){
            var challenge = ds_list_find_value(global.challengeList,i);
            
            var chSprite = spr_challengeUnique;
            if (challenge == "CHALLENGE_STEROIDS") || (challenge == "CHALLENGE_WANTED") || (challenge == "CHALLENGE_HIGHTECH") || (challenge == "CHALLENGE_REINFORCEMENTS")
            {
                    chSprite = spr_challengeCommon;
            }
            
            var timerCount = "";
            if (chSprite == spr_challengeUnique)
            {
                switch (challenge)
                {
                    case "CHALLENGE_HUNGER" : timerCount = global.challengeHungerTimer; break;
                    case "CHALLENGE_THIRST" : timerCount = global.challengeThirstTimer; break;
                    case "CHALLENGE_OVERCHARGE" : timerCount = global.challengeOverchargeTimer; break;
                    case "CHALLENGE_MEDIEVAL" : timerCount = global.challengeMedievalTimer; break;
                    case "CHALLENGE_CATAPULT" : timerCount = global.challengeCatapultTimer; break;
                    case "CHALLENGE_DUCANWEAPONS" : timerCount = global.challengeDucanWeaponsTimer; break;
                    case "CHALLENGE_HEAVYBURDEN" : timerCount = global.challengeHeavyBurdenTimer; break;
                    case "CHALLENGE_SUPRESSOR" : timerCount = global.challengeSupressorTimer; break;
                    case "CHALLENGE_BLOODLUST" : timerCount = global.challengeBloodlustTimer; break;
                    case "CHALLENGE_JAWS" : timerCount = global.challengeJawsTimer; break;
                    case "CHALLENGE_COUNTDOWN" : timerCount = global.challengeCountdownTimer; break;
                    case "CHALLENGE_HUNTED" : timerCount = global.challengeHuntedTimer; break;
                    case "CHALLENGE_HAUNTED" : timerCount = global.challengeHauntedTimer; break;
                    case "CHALLENGE_LIGHTFOCUS" : timerCount = global.challengeLightFocusTimer; break;
                    case "CHALLENGE_MEDIUMFOCUS" : timerCount = global.challengeMediumFocusTimer; break;
                    case "CHALLENGE_HEAVYFOCUS" : timerCount = global.challengeHeavyFocusTimer; break;
                }
            }
            
            var drawChallengeText = loc_key(challenge);
            if (timerCount != "") drawChallengeText += ( " (" + string(timerCount) + ")" );
            
            draw_sprite(chSprite,0,chIconX,chY+chSpacingCurrent);
            draw_text(chX,chY+chSpacingCurrent, string_hash_to_newline(drawChallengeText));
            chSpacingCurrent += chSpacing;
        }
    }
}

///Draw Game Over
if (global.gameOver)
{
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    draw_set_font(global.font_numberVeryLarge);
    var gameOverMagenta = make_colour_rgb(204,10,68);
            
    var gameOverX = width*0.5;
    var gameOverY = height*0.42;
    if (!global.isDaily) draw_text_dropoutline_ext_transformed(gameOverX,gameOverY,loc_key("HUD_GAMEOVER"),gameOverMagenta,gameOverMagenta,c_black,0.6,4,1,1,0,1);
            
    draw_set_font(global.font_numberMedium);
    gameOverY2 = height*0.5;
    gameOverY3 = height*0.55;
            
    var gameOverString1, gameOverString2
            
    if (global.input[1] == K_INPUT_KEYBOARD) 
    {
        gameOverString1 = loc_key("HUD_GAMEOVER_RETRY");
        gameOverString2 = loc_key("HUD_GAMEOVER_MENU");
    }
    else
    {
        gameOverString1 = loc_key("HUD_GAMEOVER_RETRY_JOY");
        gameOverString2 = loc_key("HUD_GAMEOVER_MENU_JOY");
    }
            
    if (!global.isDaily) draw_text_dropoutline_ext_transformed(gameOverX,gameOverY2,gameOverString1,c_white,c_white,c_black,0.6,4,1,1,0,1);
    if (!global.isDaily) draw_text_dropoutline_ext_transformed(gameOverX,gameOverY3,gameOverString2,c_white,c_white,c_black,0.6,4,1,1,0,1);
    
    //Endless Stats
    if (global.gameMode == gamemode_endless)
    {
        ///Daily Endless Game Over HUD
        if (global.isDaily)
        {
            var badgeY = height*0.36;
            
            if (global.dailyPlayers != -1) && (global.dailyRankDebug != -1)
            {
                var percentString = "";
                var rankString = loc_key("DAILY_RANK_UNRANKED");
                switch (global.dailyBadge)
                {
                    case 2 :
                        percentString = " (TOP 70%)";
                        rankString = loc_key("DAILY_RANK_BRONZE");
                        break;
                    case 3 :
                        percentString = " (TOP 50%)";
                        rankString = loc_key("DAILY_RANK_SILVER");
                        break;
                    case 4 :
                        percentString = " (TOP 30%)";
                        rankString = loc_key("DAILY_RANK_GOLD");
                        break;
                    case 5 : 
                        percentString = " (TOP 15%)";
                        rankString = loc_key("DAILY_RANK_PLATINUM");
                        break;
                    case 6 :
                        percentString = " (TOP 10%)";
                        rankString = loc_key("DAILY_RANK_DIAMOND");
                        break;
                    case 7 :
                        percentString = " (TOP 5%)";
                        rankString = loc_key("DAILY_RANK_MASTER");
                        break;
                }
                
                
                if (instance_exists(gui_badgeLoading)) with (gui_badgeLoading) { instance_destroy(); } 
                draw_sprite_ext(spr_badgeDaily,global.dailyBadge,gameOverX,badgeY,2,2,0,c_white,1);
                
                var endlessString1 = rankString;
                var endlessString2 = loc_key("HUD_ENDLESS_SCORE") + ": " + string(global.scoreEndless) + percentString;
                var endlessString3 = string(global.dailyPlayers) + " " + loc_key("DAILY_PLAYERS");
                var endlessString4 = "YOUR POSITION: " + string(global.dailyRankDebug);
                
                var endlessY1 = height*0.44;
                var endlessY2 = height*0.48;
                var endlessY3 = height*0.52;
                var endlessY4 = height*0.56;
                
                draw_set_font(global.font_numberMedium);
                draw_text_dropoutline_ext_transformed(gameOverX,endlessY1,endlessString1,c_white,c_white,c_black,0.6,4,1.5,1.5,0,1);
                draw_text_dropoutline_ext_transformed(gameOverX,endlessY2,endlessString2,c_white,c_white,c_black,0.6,4,1,1,0,1);
                draw_text_dropoutline_ext_transformed(gameOverX,endlessY3,endlessString3,c_white,c_white,c_black,0.6,4,1,1,0,1);
                //DEBUG ONLY: draw_text_dropoutline_ext_transformed(gameOverX,endlessY4,endlessString4,c_white,c_white,c_black,0.6,4,1,1,0,1);
            }
            else 
            {
                //Loading messages
                if (!instance_exists(gui_badgeLoading)) instance_create_layer(0,0,"GUI",gui_badgeLoading);
                else{
                    var loading = instance_find(gui_badgeLoading,0);
                    draw_sprite_ext(loading.sprite_index,loading.image_index,gameOverX,badgeY,2,2,0,c_white,1);
                 } 
                draw_text_dropoutline_ext_transformed(gameOverX,height*0.44,loc_key("DAILY_CONNECTING"),c_white,c_white,c_black,0.6,4,1,1,0,1);
                draw_text_dropoutline_ext_transformed(gameOverX,height*0.48,loc_key("DAILY_CONNECTING2"),c_white,c_white,c_black,0.6,4,1,1,0,1);
            }
        }
        else{
            ///Regular Endless Game Over HUD
            var endlessY1 = height*0.26;
            var endlessY2 = height*0.30;
            var endlessY3 = height*0.34;
            var endlessString1 = loc_key("HUD_ENDLESS_SCORE") + ": " + string(global.scoreEndless);
            var endlessString2 = loc_key("HUD_LOOP") + ": " + string(global.currentLoop);
            
            var myTime = global.statRunTime;
            var myTimeMinutes = myTime div 60;
            var myTimeSeconds = myTime mod 60;
            var myTimeString = string(myTimeMinutes) + "m " + string(myTimeSeconds);
            
            var endlessString3 = loc_key("HUD_ENDLESS_TIME") + ": " + myTimeString;
            
            draw_set_font(global.font_numberMedium);
            draw_text_dropoutline_ext_transformed(gameOverX,endlessY1,endlessString1,c_white,c_white,c_black,0.6,4,1,1,0,1);
            draw_text_dropoutline_ext_transformed(gameOverX,endlessY2,endlessString2,c_white,c_white,c_black,0.6,4,1,1,0,1);
            draw_text_dropoutline_ext_transformed(gameOverX,endlessY3,endlessString3,c_white,c_white,c_black,0.6,4,1,1,0,1);
        }
    }
    
    //Gameplay Hints
    if (gameOverHint != "")
    {
        var hintBoxWidth = 740;
        var hintBoxHeight = 80;
        var hintVOffset = 15;
        var hintY = height*0.7;
        var hintString = loc_key("TIPS_TITLE") + ": " + gameOverHint;
        
        draw_set_colour(c_white);
        draw_rectangle(gameOverX-(hintBoxWidth/2), hintY-(hintBoxHeight/2)+hintVOffset, gameOverX+(hintBoxWidth/2), hintY+(hintBoxHeight/2)+hintVOffset,false);
        draw_set_font(global.font_numberSmall);
        draw_set_colour(K_BETU_RED);
        
        draw_text_ext(gameOverX, hintY, string_hash_to_newline(hintString), 24, 720);
    }
}

///Draw Low Performance Window Pop Up
if (instance_exists(gui_info_lowPerformance)) 
{
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+__view_get( e__VW.XPort, 0 ),__view_get( e__VW.YView, 0 )+__view_get( e__VW.YPort, 0 ),false);
    
    draw_set_alpha(1);
    draw_set_color(c_white);
    
    var rectangleWidth = width*0.5;
    var rectangleHeight = height*0.2;
    var rectX = width * 0.5;
    var rectY = height * 0.5;
    
    draw_rectangle(rectX-(rectangleWidth/2), rectY-(rectangleHeight/2),rectX+(rectangleWidth/2), rectY+(rectangleHeight/2),false);
    
    var textSpacing = 52;
    draw_set_colour(K_BETU_MAGENTA_PAUSE);
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    draw_set_font(global.font_menuMedium);
    
    draw_text(rectX,rectY-textSpacing,string_hash_to_newline(loc_key("SETTINGS_LOWPERF1")));
    draw_set_colour(c_black);
    draw_text(rectX,rectY,string_hash_to_newline(loc_key("SETTINGS_LOWPERF2")));
    draw_set_colour(K_BETU_MAGENTA_PAUSE);
    
    draw_set_font(global.font_menuLarge);
    draw_text(rectX,rectY+textSpacing,string_hash_to_newline(loc_key("SETTINGS_LOWPERF3")));
}

draw_set_alpha(1);
surface_reset_target();
var surfaceXScale = window_get_width()/1920;
var surfaceYScale = window_get_height()/1080;

if (global.gameOver){ //Game Over Base Overlay
    draw_set_alpha(0.42);
    draw_set_colour(c_black);
    draw_rectangle(0,0,width,height,false);
    draw_set_alpha(1);
}
if (surface_exists(guiSurface)) draw_surface_ext(guiSurface, 0, 0, surfaceXScale, surfaceYScale, 0, c_white, 1);


///Fullscreen Effects


//Red Flash On Damage
if instance_exists(class_player)
{
    if (class_player.hit_taken) && (!class_player.shield)
    {
        draw_set_alpha(0.3);
        draw_rectangle_colour(0,0,window_get_width(),window_get_height(),c_red,c_red,c_red,c_red,false);
        draw_set_alpha(1);
    }
}

///FPS, Autoaim, Low Performance Check
draw_set_halign(fa_right);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(global.font_numberSmall);

//Draw FPS if it is low!
if ((fps/room_speed) < 0.9) 
{
    draw_text(window_get_width()*0.99, window_get_height()*0.95, string_hash_to_newline("FPS " + string(fps) + "/" + string(room_speed)) );
    
    ///Low Performance Check
    if (!global.lowPerfChecked)
    {
        if (global.lowPerfTimeCurrent < global.lowPerfTime) global.lowPerfTimeCurrent += delta_time;
        else
        {
            global.persistent_toggle = false;
            //global.reflections_toggle = false;
            //global.shadows_toggle = false;
            
            instance_create_layer(0,0,"GUI",gui_info_lowPerformance);
            
            global.lowPerfChecked = true;
            
            draw_texture_flush();
        }
    }
    
}


///Cutscene Bars Draw

if (!global.cutscene)
{
    cutscene_bars_position -= cutscene_bars_exit_speed;
}
else if (cutscene_bars_position < cutscene_bars_positionStart)
{
    cutscene_bars_position += min(cutscene_bars_exit_speed, (cutscene_bars_positionStart-cutscene_bars_position));
}

if (cutscene_bars_position > 0) && (!global.pauseMenu)
{
    draw_set_colour(c_black);
    draw_rectangle(0,0,window_get_width(),window_get_height()*cutscene_bars_position,false);
    draw_rectangle(0,window_get_height()*(1-cutscene_bars_position),window_get_width(),window_get_height(),false);
    
    if (main_hud_alpha > 0) main_hud_alpha-=0.15;
    else main_hud_alpha = 0;
}
else
{
    cutscene_bars_position = 0;
    
    if (main_hud_alpha < 1) main_hud_alpha+=0.15;
    else main_hud_alpha = 1;
}
/**/