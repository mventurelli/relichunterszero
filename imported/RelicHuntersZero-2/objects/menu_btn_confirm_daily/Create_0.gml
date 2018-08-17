///Button Config

event_inherited();


//Don't let people play twice!
if (global.dailyCompleted == string(current_day)+string(current_month)+string(current_year)) isAvailable = false;
else isAvailable = true;


labelString = loc_key("DAILY_PLAY");

dailyString1 = loc_key("DAILY_MENU_TEXT");
dailyString2 = loc_key("DAILY_MENU_TEXT2");
dailyString3 = loc_key("DAILY_MENU_TEXT3");
dailyString4 = loc_key("DAILY_MENU_TEXT4");
dailyString5 = loc_key("DAILY_MENU_TEXT5");

dailyString6 = loc_key("DAILY_MENU_TEXT6");
dailyString7 = loc_key("DAILY_MENU_TEXT7");


