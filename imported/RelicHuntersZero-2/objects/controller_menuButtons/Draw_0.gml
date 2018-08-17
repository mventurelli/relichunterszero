///Draw Cursor

if (global.mouseActive)
{
    draw_sprite(spr_crosshair,0,mouse_x,mouse_y);
}

/*OLD
if (global.input[1] == K_INPUT_KEYBOARD)
{
    draw_sprite(spr_crosshair,0,mouse_x,mouse_y);
}


/* */
///DEBUG: Draw grid feedback on button
/*

// Global button DEBUG:

if (keyboard_check(vk_space))
{
    if (instance_exists(class_menu_button))
    {
        draw_set_font(global.font_menuSmall);
        draw_set_color(c_purple);
        with (class_menu_button)
        {
            if (allowConsoleSelection) 
            {
                if ds_grid_value_exists(global.buttonGrid, 0, 0, ds_grid_width(global.buttonGrid), ds_grid_height(global.buttonGrid), id)
                {
                    var actualGridX = ds_grid_value_x(global.buttonGrid, 0, 0, ds_grid_width(global.buttonGrid), ds_grid_height(global.buttonGrid), id);
                    var actualGridY = ds_grid_value_y(global.buttonGrid, 0, 0, ds_grid_width(global.buttonGrid), ds_grid_height(global.buttonGrid), id);
                }
         
                draw_text(x,y,'X: '+string(actualGridX)+' Y: '+string(actualGridY));
            }
        }
    }
}
else
{
    // Internal Button Debug
    if (instance_exists(class_menu_button))
    {
        draw_set_font(global.font_menuSmall);
        draw_set_color(c_purple);
        with (class_menu_button)
        {
            if (allowConsoleSelection) draw_text(x,y,'X: '+string(buttonGridX)+' Y: '+string(buttonGridY));
        }
    }
}

/* */
/*  */
