///Button Config

event_inherited();

if (global.gameMode != gamemode_storm || global.stormAllowHardDifficulty ) isAvailable = true;
else isAvailable = false;

labelString = loc_key("DIFFICULTY_NAME_HARD");
/*
keyboardShortcut = vk_enter;
joystickShortcut[K_INPUT_JOYSTICK1] = 8;
joystickShortcut[K_INPUT_JOYSTICK2] = 8;

