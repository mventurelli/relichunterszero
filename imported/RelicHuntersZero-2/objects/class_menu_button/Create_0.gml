///Main Stuff

isAvailable = true;
labelString = "MISSING LABEL";
allowConsoleSelection = true;
myFont = global.font_menuMedium;

myVariable = -99;
myVariableMax = -99;
parentButton = noone;
myMinusButton = noone;
myPlusButton = noone;

image_speed = 0;

isSelected = false;
allowMultipleSelection = false;
selectionOrderVertical = 0;
selectionOrderHorizontal = 0;

executeAction = false;
joyCanSwitch[K_INPUT_JOYSTICK1] = true;
joyCanSwitch[K_INPUT_JOYSTICK2] = true;

starPositionX = point_distance(x,y,bbox_right,y) - 32;
starPositionY = 0;

starScaleInitial = 1.5;
starScale = starScaleInitial;
starScaleSpeed = 0.025;
starScaleFinal = 1;

audioSelectionPlayed = false;

//Grid Position for Console
buttonGridX = 0;
buttonGridY = 0;
isToggle = false;

keyboardShortcut = -1;
joystickShortcut[K_INPUT_JOYSTICK1] = -1;
joystickShortcut[K_INPUT_JOYSTICK2] = -1;

