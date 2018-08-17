///Trigger
event_inherited();

if (isActive) 
{
    if (owner.slotInput != K_INPUT_KEYBOARD) 
    {
        if joy_check_pressed(owner.slotInput,2) trigger = true;
    }
    else 
    {
        if keyboard_check_pressed(vk_escape) trigger = true;
    
        if instance_exists(menu_char_buttonOk)
        {
            if mouse_check_button_pressed(mb_left) && (!is_mouse_over(menu_char_buttonOk))
            {
                trigger = true;
            }
        }
    }
}
    
if (trigger)
{
    if (!audio_is_playing(sfx_menu_click)) audio_play_sound(sfx_menu_click,9,false);  
    
    if (instance_exists(owner))
    {
        global.selectionLocked[owner.slotInput] = false;
        owner.slotInput = -1;
        owner.slotCharacter = -1;
    } 
    
    trigger = false;
}

