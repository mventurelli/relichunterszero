///Selection & Action

event_inherited();

//Run Action
if (executeAction)
{
    if (global.selectedButton[K_INPUT_KEYBOARD] == id) myInput=K_INPUT_KEYBOARD;
    if (global.selectedButton[K_INPUT_JOYSTICK1] == id) myInput=K_INPUT_JOYSTICK1;
    if (global.selectedButton[K_INPUT_JOYSTICK2] == id) myInput=K_INPUT_JOYSTICK2;
    

    if (instance_exists(menu_char_card1))
    {
        if (menu_char_card1.slotInput == -1) && (menu_char_card1.slotCharacter == -1) && (!global.selectionLocked[myInput])
        {
            menu_char_card1.slotInput = myInput;
            menu_char_card1.slotCharacter = myCharacter;
            global.selectionLocked[myInput] = true;
        }
    }
        
    if (instance_exists(menu_char_card2))
    {
        if (menu_char_card2.slotInput == -1) && (menu_char_card2.slotCharacter == -1) && (!global.selectionLocked[myInput])
        {
            menu_char_card2.slotInput = myInput;
            menu_char_card2.slotCharacter = myCharacter;
            global.selectionLocked[myInput] = true;
        }
    }
    
    executeAction = false;
}


//Animation (should have been a state machine but I'm too lazy)
var isLocked = false;
if (myInput != -1) if (global.selectionLocked[myInput]) isLocked = true;

if (isLocked)
{
    if (sprite_index != spriteFinal)
    {
        sprite_index = spriteFinal;
        image_index = 0; 
        image_speed = 0.2;
    }
}
else if (isSelected)
{
    if (sprite_index != spriteSel) 
    { 
        sprite_index = spriteSel;
        image_index = 0;
        image_speed = 0.2;
    }
}
else sprite_index = spriteOn;

if (!isAvailable) sprite_index = spriteOff;

//Reset myInput
if (!isSelected) myInput = -1;

