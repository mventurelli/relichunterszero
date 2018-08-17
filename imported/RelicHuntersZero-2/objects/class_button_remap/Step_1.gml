///WaitForMap

if (waitForKey) //It's horrible but it's 2 am, do not judge me
{
    if (keyboard_check_pressed(vk_escape))
    {
        waitForKey = false;
        labelString = "";
        myMap = -99;
    }
    else if (keyboard_lastkey != -1) && (keyboard_check_pressed(vk_anykey))
    {
        myMap = keyboard_lastkey;
    
        if (myMap == vk_lshift) myMap = vk_shift;
        if (myMap == vk_lcontrol) myMap = vk_control;
        if (myMap == vk_lalt) myMap = vk_alt;
        if (myMap == vk_rshift) myMap = vk_shift;
        if (myMap == vk_rcontrol) myMap = vk_control;
        if (myMap == vk_ralt) myMap = vk_alt;
        
        if (myMap == vk_left) labelString = loc_key("MAPPING_LEFTARROW");
        else if (myMap == vk_right) labelString = loc_key("MAPPING_RIGHTARROW");
        else if (myMap == vk_up) labelString =  loc_key("MAPPING_UPARROW");
        else if (myMap == vk_down) labelString = loc_key("MAPPING_DOWNARROW");
        else if (myMap == vk_enter) labelString = loc_key("MAPPING_ENTER");
        else if (myMap == vk_shift) labelString = loc_key("MAPPING_SHIFT");
        else if (myMap == vk_control) labelString = loc_key("MAPPING_CTRL");
        else if (myMap == vk_alt) labelString = loc_key("MAPPING_ALT");
        else if (myMap == vk_space) labelString = loc_key("MAPPING_SPACEBAR");
        else if (myMap == vk_backspace) labelString = loc_key("MAPPING_BACKSPACE");
        else if (myMap == vk_tab) labelString = loc_key("MAPPING_TAB");
        else if (myMap == vk_home) labelString = loc_key("MAPPING_HOME");
        else if (myMap == vk_end) labelString = loc_key("MAPPING_END");
        else if (myMap == vk_delete) labelString = loc_key("MAPPING_DELETE");
        else if (myMap == vk_insert) labelString = loc_key("MAPPING_INSERT");
        else if (myMap == vk_pageup) labelString = loc_key("MAPPING_PAGEUP");
        else if (myMap == vk_pagedown) labelString = loc_key("MAPPING_PAGEDOWN");
        else labelString = keyboard_lastchar;
            
        waitForKey = false;
    }
    else if (mouse_lastbutton != -1) && (mouse_check_button_pressed(mb_any))
    {
        myMap = mouse_lastbutton
        if (myMap == mb_left) labelString = loc_key("MAPPING_LEFTMOUSE");
        if (myMap == mb_right) labelString = loc_key("MAPPING_RIGHTMOUSE");
        if (myMap == mb_middle) labelString = loc_key("MAPPING_MIDDLEMOUSE");
            
        waitForKey = false;
    }    
}

