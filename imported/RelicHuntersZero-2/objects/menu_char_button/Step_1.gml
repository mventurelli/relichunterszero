///Mouse Activation & Trigger

isActive = false;


if (instance_exists(owner))
{
    if (owner.slotInput != -1) && (owner.slotCharacter != -1)
    {
        isActive = true;
        if (is_mouse_over(id)) && (owner.slotInput == K_INPUT_KEYBOARD)
        {
            if (!isMouseSelected) && (!audio_is_playing(sfx_menu_mouse)) audio_play_sound(sfx_menu_mouse,9,false);
            isMouseSelected = true;
        }
        else isMouseSelected = false;
        
        if (owner.slotInput != K_INPUT_KEYBOARD) drawConsoleLabels = true;
    }  
    else isMouseSelected = false;
}
else instance_destroy();


if (isActive)
{
    if (isMouseSelected) && mouse_check_button_pressed(mb_left) trigger = true;
}

