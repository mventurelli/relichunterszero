///input_key_sprint_toggle()

var toReturn = false;

if ( keyboard_check_pressed(global.inputSprintToggle1) || keyboard_check_pressed(global.inputSprintToggle2) || mouse_check_button_pressed(global.inputSprintToggle1) || mouse_check_button_pressed(global.inputSprintToggle2)  )
{
    toReturn = true;
}

return toReturn;
