///Shortcuts

if !global.selectionLocked[K_INPUT_KEYBOARD] keyboardShortcut = vk_escape;
else keyboardShortcut  = -1;

if !global.selectionLocked[K_INPUT_JOYSTICK1] joystickShortcut[K_INPUT_JOYSTICK1] = 2;
else joystickShortcut[K_INPUT_JOYSTICK1]  = -1;

if !global.selectionLocked[K_INPUT_JOYSTICK2] joystickShortcut[K_INPUT_JOYSTICK2] = 2;
else joystickShortcut[K_INPUT_JOYSTICK2]  = -1;

///Button Action
event_inherited();

if (executeAction)
{
    room_goto(room_menu);
}

