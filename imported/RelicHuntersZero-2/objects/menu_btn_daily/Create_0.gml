///Button Config

event_inherited();
isAvailable = false;
labelString = loc_key("MAINMENU_DAILY");

textXOffset = 66;
textYOffset = 46;

badgeRank = 0;
if (global.dailyCompleted == string(current_day)+string(current_month)+string(current_year)) badgeRank = global.dailyCompletedBadge;

//Stop moving
selectPositionX = startPositionX;
selectPositionY = startPositionY;