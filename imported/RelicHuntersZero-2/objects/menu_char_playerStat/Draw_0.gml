///Draw Event

if (owner) && (instance_exists(owner))
{
    if (owner.slotCharacter != -1)
    {
        draw_self();
        
        //Player Stat Names
        var textX = x+8;
        var textY = y+12;
        var statsX = textX + 160;
        var statsY = textY;
        var lineSpacing = 24;
        
        draw_set_font(global.font_menuSmall);
        draw_set_valign(fa_center);
        draw_set_halign(fa_left);
        draw_set_color(c_white);
        
        draw_text(textX,textY,string_hash_to_newline(loc_key("CHARSELECT_HEALTH"))); textY+=lineSpacing;
        draw_text(textX,textY,string_hash_to_newline(loc_key("CHARSELECT_SHIELD"))); textY+=lineSpacing;
        draw_text(textX,textY,string_hash_to_newline(loc_key("CHARSELECT_MELEE"))); textY+=lineSpacing;
        draw_text(textX,textY,string_hash_to_newline(loc_key("CHARSELECT_STAMINA"))); textY+=lineSpacing;
        draw_text(textX,textY,string_hash_to_newline(loc_key("CHARSELECT_SPEED"))); textY+=lineSpacing;
        
        //Player Stat Squares
        var squareSize = 12;
        var squareSpacing = 4;
        var statsXCurrent = statsX;
        
        for (var i=1; i<=statHealth; i++)
        {
            draw_set_colour(sqColor[i]);
            draw_rectangle(statsXCurrent,statsY-(squareSize/2),statsXCurrent+squareSize,statsY+(squareSize/2),false);
            statsXCurrent += (squareSize + squareSpacing);
        }
        statsXCurrent = statsX;
        statsY += lineSpacing;
        
        for (var i=1; i<=statShield; i++)
        {
            draw_set_colour(sqColor[i]);
            draw_rectangle(statsXCurrent,statsY-(squareSize/2),statsXCurrent+squareSize,statsY+(squareSize/2),false);
            statsXCurrent += (squareSize + squareSpacing);
        }
        statsXCurrent = statsX;
        statsY += lineSpacing;
        
        for (var i=1; i<=statMelee; i++)
        {
            draw_set_colour(sqColor[i]);
            draw_rectangle(statsXCurrent,statsY-(squareSize/2),statsXCurrent+squareSize,statsY+(squareSize/2),false);
            statsXCurrent += (squareSize + squareSpacing);
        }
        statsXCurrent = statsX;
        statsY += lineSpacing;
        
        for (var i=1; i<=statStamina; i++)
        {
            draw_set_colour(sqColor[i]);
            draw_rectangle(statsXCurrent,statsY-(squareSize/2),statsXCurrent+squareSize,statsY+(squareSize/2),false);
            statsXCurrent += (squareSize + squareSpacing);
        }
        statsXCurrent = statsX;
        statsY += lineSpacing;
        
        for (var i=1; i<=statSpeed; i++)
        {
            draw_set_colour(sqColor[i]);
            draw_rectangle(statsXCurrent,statsY-(squareSize/2),statsXCurrent+squareSize,statsY+(squareSize/2),false);
            statsXCurrent += (squareSize + squareSpacing);
        }
        statsXCurrent = statsX;
        statsY += lineSpacing;
        
        // Player Description
        draw_set_color(c_white);
        draw_set_valign(fa_top);
        draw_set_font(global.font_tinyText);
        draw_text_ext(x+8,y+122,string_hash_to_newline(myString),20,230);
        
        // Player Weapon
        if sprite_exists(myWeaponSprite) draw_sprite(myWeaponSprite,1,x+190,y+212);
    }
}

