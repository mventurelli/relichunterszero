///Main Stuff

event_inherited();

textXOffset = __view_get( e__VW.XView, 0 )+(point_distance(x,y,bbox_left,y) - x) + 10;
textYOffset = 0;

myFont = global.font_menuLarge;
myText = loc_key("PAUSE_FXPAUSE");

myFont2 = global.font_menuSmall;
myText2 = "I AM ERROR";


switch (room){

    case (room_start) :
    case (room_tutorial) : myText2 = loc_key("HUD_SPACEHEART"); break;
    case (room_shop) :
    case (room_endShop) : myText2 = loc_key("HUD_SHOP"); break;
    case (level1_1) : myText2 = loc_key("HUD_STAGE") + " " + "1 - 1"; break;
    case (level1_2) : myText2 = loc_key("HUD_STAGE") + " " + "1 - 2"; break;
    case (level1_3) : myText2 = loc_key("HUD_STAGE") + " " + "1 - 3"; break;
    case (level2_1) : myText2 = loc_key("HUD_STAGE") + " " + "2 - 1"; break;
    case (level2_2) : myText2 = loc_key("HUD_STAGE") + " " + "2 - 2"; break;
    case (level2_3) : myText2 = loc_key("HUD_STAGE") + " " + "2 - 3"; break;
    case (level3_1) : myText2 = loc_key("HUD_STAGE") + " " + "3 - 1"; break;
    case (level3_2) : myText2 = loc_key("HUD_STAGE") + " " + "3 - 2"; break;
    case (level3_3) : myText2 = loc_key("HUD_STAGE") + " " + "3 - 3"; break;
    case (level4_1) : myText2 = loc_key("HUD_STAGE") + " " + "4 - 1"; break;
    case (level4_2) : myText2 = loc_key("HUD_STAGE") + " " + "4 - 2"; break;
    case (level4_3) : myText2 = loc_key("HUD_STAGE") + " " + "4 - 3"; break;
    case (room_boss) : myText2 = loc_key("HUD_STAGE_BOSS"); break;
    case (levelHalloween_1) :
    case (levelHalloween_2) :
    case (levelHalloween_3) : myText2 = loc_key("HUD_STAGE_BONUS"); break;

}

loopText = loc_key("HUD_LOOP") + " " + string(global.currentLoop);

