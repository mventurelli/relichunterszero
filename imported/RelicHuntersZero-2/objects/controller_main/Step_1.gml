//keep players positions
if (level_built == true) {
}

///Apply Global Buffs (Relics and Characters)

//Watchful Eye & Biu
if (global.relic_watchful_eye == 2)
{
    global.ammo_light_max = ammo_light_max_regular + ammo_light_max_relic;
    global.ammo_medium_max = ammo_medium_max_regular + ammo_medium_max_relic;
    global.ammo_heavy_max = ammo_heavy_max_regular + ammo_heavy_max_relic;
    
    if (global.character[1] == char_biu) || (global.character[2] == char_biu) global.grenades_max = grenades_max_biu+grenades_max_relic;
    else global.grenades_max = grenades_max_regular+grenades_max_relic;
}
else 
{
    global.ammo_light_max = ammo_light_max_regular;
    global.ammo_medium_max = ammo_medium_max_regular;
    global.ammo_heavy_max = ammo_heavy_max_regular;
    
    if (global.character[1] == char_biu) || (global.character[2] == char_biu) global.grenades_max = grenades_max_biu;
    else global.grenades_max = grenades_max_regular;
}

///Xbox 360 Controller Support
if (global.version = os_windows)
{
    if (global.input[1] != K_INPUT_KEYBOARD)
    {
        var joy = global.input[1];
        var update = xin_update(joy); 
        if (!update) {}//show_debug_message('Trying to update unconnected Xbox 360 Controller ('+ string(joy) +')');   
        else
        {
            joy_rumble_update(joy);
        }
    } 
    
    if (global.playerCount > 1) && (global.input[2] != K_INPUT_KEYBOARD)
    {
        var joy = global.input[2];
        var update = xin_update(joy); 
        if (!update) {}//show_debug_message('Trying to update unconnected Xbox 360 Controller ('+ string(joy) +')');   
        else
        {
            joy_rumble_update(joy);
        }
    }
    
    
    if (global.pauseMenu)
    {
        var update0 = xin_update(0); 
        if (!update0) {}//show_debug_message('Trying to update unconnected Xbox 360 Controller (0)');   
        else
        {
            joy_rumble_update(0);
        }
        
        var update1 = xin_update(1); 
        if (!update1) {}//show_debug_message('Trying to update unconnected Xbox 360 Controller (1)');   
        else
        {
            joy_rumble_update(1);
        }
    }
}

///Constrain Mouse to Screen
// This is bad but better than nothing I guess

var hsafety,vsafety;

hsafety = 0.05*window_get_width();
vsafety = 0.05*window_get_height();

if (window_mouse_get_x() < 0+hsafety) window_mouse_set(0+hsafety, window_mouse_get_y());
if (window_mouse_get_y() < 0+vsafety) window_mouse_set(window_mouse_get_x(), 0+vsafety);
if (window_mouse_get_x() > window_get_width()-hsafety) window_mouse_set(window_get_width()-hsafety, window_mouse_get_y());
if (window_mouse_get_y() > window_get_height()-vsafety) window_mouse_set(window_mouse_get_x(), window_get_height()-vsafety);
/**/