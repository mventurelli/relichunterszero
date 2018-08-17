///Button Config

event_inherited();
isAvailable = true;
if (global.gameMode == gamemode_endless) isAvailable = false;
labelString = loc_key("PAUSE_SHIP" );
allowConsoleSelection = true;
textXOffset -= 25;

