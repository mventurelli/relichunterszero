///Init

// Buttons
if (room != room_charSelection) global.allowMultipleInput = false;
else global.allowMultipleInput = true;

global.selectedButton[K_INPUT_ALL] = -1;
global.selectedButton[K_INPUT_KEYBOARD] = -1;
global.selectedButton[K_INPUT_JOYSTICK1] = -1;
global.selectedButton[K_INPUT_JOYSTICK2] = -1;

global.selectionLocked[K_INPUT_ALL] = false;
global.selectionLocked[K_INPUT_KEYBOARD] = false;
global.selectionLocked[K_INPUT_JOYSTICK1] = false;
global.selectionLocked[K_INPUT_JOYSTICK2] = false;

global.inputSelectionList = ds_list_create();

global.mouseActive = true;

joyCanSwitch[K_INPUT_JOYSTICK1] = true;
joyCanSwitch[K_INPUT_JOYSTICK2] = true;

joyCanSwitchTimeCurrent[K_INPUT_JOYSTICK1] = 0;
joyCanSwitchTimeCurrent[K_INPUT_JOYSTICK2] = 0;

joyCanSwitchTime = 250000;//room_speed*0.25;

oldMouseX = mouse_x;
oldMouseY = mouse_y;

//Console Button Setup
global.buttonGrid = 0; //The grid is actually created on the buttonSetup
buttonSetupDone = false;
buttonGridSize = 8;

allowInput = false;

alarm[0] = room_speed*0.5;//Allow interaction

