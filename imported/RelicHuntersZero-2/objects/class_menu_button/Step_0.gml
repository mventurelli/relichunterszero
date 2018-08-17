///Plus & Minus Buttons

if (myVariable != -99)
{
    if (myVariable < 0) myVariable = 0;
    if (myVariable > myVariableMax) myVariable = myVariableMax;
    
    if (myMinusButton == noone)
    {
        myMinusButton = instance_nearest(x,y,menu_btn_minus);
        myMinusButton.parentButton = id;
    }
    
     if (myPlusButton == noone)
    {
        myPlusButton = instance_nearest(x,y,menu_btn_plus);
        myPlusButton.parentButton = id;
    }
}



///Use and Mouse Selection
//Joystick selection is done via controller_menuButtons

if (global.mouseActive) && (!global.selectionLocked[K_INPUT_KEYBOARD])
{
    var mouseInput = K_INPUT_ALL;
    if (global.allowMultipleInput) mouseInput = K_INPUT_KEYBOARD;
    
    if (is_mouse_over(id))
    {
        if (isSelected = false || allowMultipleSelection) global.selectedButton[mouseInput] = id;
    }
    else if (global.selectedButton[mouseInput] == id) global.selectedButton[mouseInput] = -1;
}


if (global.selectedButton[K_INPUT_ALL] == id) || (global.selectedButton[K_INPUT_KEYBOARD] == id) || (global.selectedButton[K_INPUT_JOYSTICK1] == id) || (global.selectedButton[K_INPUT_JOYSTICK2] == id) isSelected = true;
else isSelected = false;

if (isSelected) && (isAvailable)
{
    var triggerMyAction = false;

    if (global.selectedButton[K_INPUT_ALL] == id)
    {
        if (mouse_check_button_pressed(mb_left)) || (joy_check(K_INPUT_JOYSTICK1,1)) || (joy_check(K_INPUT_JOYSTICK2,1))
        {
            triggerMyAction = true;
        }
    }
    
    if (global.selectedButton[K_INPUT_KEYBOARD] == id) && (mouse_check_button_pressed(mb_left)) triggerMyAction = true;
    if (global.selectedButton[K_INPUT_JOYSTICK1] == id) && (joy_check(K_INPUT_JOYSTICK1,1)) triggerMyAction = true;
    if (global.selectedButton[K_INPUT_JOYSTICK2] == id) && (joy_check(K_INPUT_JOYSTICK2,1)) triggerMyAction = true;
    
    if (triggerMyAction) //Resolve
    {
        executeAction = true;
        if (!audio_is_playing(sfx_menu_click)) audio_play_sound(sfx_menu_click,1,false);
    }
}

// Shortcut Keys
checkShortcut[K_INPUT_KEYBOARD] = false;
checkShortcut[K_INPUT_JOYSTICK1] = false;
checkShortcut[K_INPUT_JOYSTICK2] = false;

if (keyboardShortcut != -1) if (keyboard_check_pressed(keyboardShortcut)) checkShortcut[K_INPUT_KEYBOARD] = true;
if (joystickShortcut[K_INPUT_JOYSTICK1] != -1) if (joy_check_pressed(K_INPUT_JOYSTICK1,joystickShortcut[K_INPUT_JOYSTICK1])) checkShortcut[K_INPUT_JOYSTICK1] = true; 
if (joystickShortcut[K_INPUT_JOYSTICK2] != -1) if (joy_check_pressed(K_INPUT_JOYSTICK2,joystickShortcut[K_INPUT_JOYSTICK2])) checkShortcut[K_INPUT_JOYSTICK2] = true; 


if (isAvailable)
{
    var shortcutActivated = false;
    
    if (checkShortcut[K_INPUT_KEYBOARD])
    {
        checkShortcut[K_INPUT_KEYBOARD] = false;
        global.selectedButton[K_INPUT_KEYBOARD] = id;
        shortcutActivated = true;
    }
    
    if (checkShortcut[K_INPUT_JOYSTICK1])
    {
        checkShortcut[K_INPUT_JOYSTICK1] = false;
        global.selectedButton[K_INPUT_JOYSTICK1] = id;
        shortcutActivated = true;
    }
    
    if (checkShortcut[K_INPUT_JOYSTICK2])
    {
        checkShortcut[K_INPUT_JOYSTICK2] = false;
        global.selectedButton[K_INPUT_JOYSTICK2] = id;
        shortcutActivated = true;
    }
    
    if (shortcutActivated)
    {
        isSelected = true;
        executeAction = true;
        if (!audio_is_playing(sfx_menu_click)) audio_play_sound(sfx_menu_click,1,false);
    }
}


// Star Movement & Audio
if (isSelected)
{
    if (!audioSelectionPlayed)
    {
        audio_play_sound(sfx_menu_mouse,1,false);
        audioSelectionPlayed = true;
    }
    if (starScale > starScaleFinal) starScale -= min( starScaleSpeed, abs(starScale-starScaleFinal) );
}
else
{
    audioSelectionPlayed = false;
    starScale = starScaleInitial;
}

