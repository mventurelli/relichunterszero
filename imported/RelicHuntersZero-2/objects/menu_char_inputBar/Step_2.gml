///Force keyboard selection back to itself
event_inherited();

if (global.selectedButton[K_INPUT_KEYBOARD] == -1) global.selectedButton[K_INPUT_KEYBOARD] = id;

