///Draw All The Fun Stuff

var oldAlpha = draw_get_alpha();
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0,0,display_get_width(),display_get_height(),false);

draw_set_alpha(oldAlpha);
event_inherited();

if (isAvailable)
{
    draw_set_valign(fa_center);
    draw_set_halign(fa_center);
    draw_set_font(global.font_menuLarge);
    draw_set_color(make_colour_rgb(255,16,11));
    draw_text_ext(x,y-196,string_hash_to_newline(dailyString1),32,720);
    draw_set_color(c_white);
    draw_set_valign(fa_top);
    draw_text_ext(x,y-165,string_hash_to_newline(dailyString2),32,1200);
    draw_text_ext(x,y-130,string_hash_to_newline(dailyString3),32,1200);
    draw_text_ext(x,y-95,string_hash_to_newline(dailyString4),32,1200);
    draw_text_ext(x,y-60,string_hash_to_newline(dailyString5),32,1200);
}
else
{
    if (instance_exists(controller_steamAsync))
    {
        ///Daily Endless Game Over HUD
        var badgeY = y-400;
                
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
            draw_sprite_ext(spr_badgeDaily,global.dailyBadge,x,badgeY,2,2,0,c_white,1);
                    
            var endlessString1 = rankString;
            var endlessString2 = loc_key("HUD_ENDLESS_SCORE") + ": " + string(global.scoreEndless) + percentString;
            var endlessString3 = string(global.dailyPlayers) + " " + loc_key("DAILY_PLAYERS");
            var endlessString4 = "YOUR POSITION: " + string(global.dailyRankDebug);
                    
            var endlessY1 = y-328;
            var endlessY2 = y-288;
            var endlessY3 = y-256;
            var endlessY4 = y-224;
                    
            draw_set_font(global.font_numberMedium);
            draw_text_dropoutline_ext_transformed(x,endlessY1,endlessString1,c_white,c_white,c_black,0.6,4,1.5,1.5,0,1);
            draw_text_dropoutline_ext_transformed(x,endlessY2,endlessString2,c_white,c_white,c_black,0.6,4,1,1,0,1);
            draw_text_dropoutline_ext_transformed(x,endlessY3,endlessString3,c_white,c_white,c_black,0.6,4,1,1,0,1);
            //DEBUG ONLY: draw_text_dropoutline_ext_transformed(x,endlessY4,endlessString4,c_white,c_white,c_black,0.6,4,1,1,0,1);
        }
        else 
        {
            //Loading messages
            if (!instance_exists(gui_badgeLoading)) instance_create_layer(0,0,"GUI",gui_badgeLoading);
            else{
                var loading = instance_find(gui_badgeLoading,0);
                draw_sprite_ext(loading.sprite_index,loading.image_index,x,badgeY,2,2,0,c_white,1);
            } 
            draw_text_dropoutline_ext_transformed(x,y-320,loc_key("DAILY_CONNECTING"),c_white,c_white,c_black,0.6,4,1,1,0,1);
            draw_text_dropoutline_ext_transformed(x,y-300,loc_key("DAILY_CONNECTING2"),c_white,c_white,c_black,0.6,4,1,1,0,1);
        }
    }
    draw_set_color(c_white);
    draw_set_font(global.font_menuLarge);
    draw_text_ext(x,y-95,string_hash_to_newline(dailyString6),32,1200);
    draw_text_ext(x,y-60,string_hash_to_newline(dailyString7),32,1200);
}

