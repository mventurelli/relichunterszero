///Buttons vs Input Methods
if (allowInput)
{
    if (buttonSetupDone) && ds_exists(global.buttonGrid,ds_type_grid)
    {
        for (var i=0; i<2; i++) if gamepad_is_connected(i)
        {
            var joy = i;
            var input = K_INPUT_ALL;
            if (global.allowMultipleInput) input = joy;
            
            if (!global.selectionLocked[input])
            {
            //If there's no button selected, get the topmost one
            if (global.selectedButton[input] == -1) || (global.selectedButton[input] == 0) || (!instance_exists(global.selectedButton[input]))
            {
                global.selectedButton[input] = ds_grid_get_topmost(global.buttonGrid);
            }    
            else {
                //Get direction input
                if (joy_simple_deadzone( joy_xpos(joy), joy_ypos(joy), 0.3)) || joy_check_pressed(joy,15) || joy_check_pressed(joy,16) || joy_check_pressed(joy,17) || joy_check_pressed(joy,18) 
                {
                    if (joyCanSwitch[joy])
                    {
                        joyCanSwitch[joy] = false;
                        var joyDirection = -1;
                        if (joy_simple_deadzone( joy_xpos(joy), joy_ypos(joy), 0.3)) joyDirection = point_direction(x,y,(x+joy_xpos(joy)),(y+joy_ypos(joy)));
    
                        //Up
                        if (joyDirection > 45 && joyDirection < 135) || (joy_check_pressed(joy,15))
                        {
                            getId = ds_grid_get_above(global.buttonGrid, global.selectedButton[input].buttonGridX, global.selectedButton[input].buttonGridY);
                            if (getId) global.selectedButton[input] = getId;
                        }
                        
                        //Down
                        if (joyDirection > 215 && joyDirection < 315) || (joy_check_pressed(joy,16))
                        {
                            getId = ds_grid_get_below(global.buttonGrid, global.selectedButton[input].buttonGridX, global.selectedButton[input].buttonGridY);
                            if (getId) global.selectedButton[input] = getId;
                        }
                        
                        //Left
                        if (joyDirection > 135 && joyDirection < 215) || (joy_check_pressed(joy,17))
                        {
                            if (!global.selectedButton[input].isToggle)
                            {
                                getId = ds_grid_get_left(global.buttonGrid, global.selectedButton[input].buttonGridX, global.selectedButton[input].buttonGridY);
                                if (getId) global.selectedButton[input] = getId;
                            }
                            else if (global.selectedButton[input].myVariable)
                            {
                                global.selectedButton[input].myVariable-=1;
                                global.selectedButton[input].arrowClicked = true;
                            }
                        }
                        
                        //Right
                        if ((joyDirection != -1) && (joyDirection < 45 || joyDirection > 315)) || (joy_check_pressed(joy,18))
                        {
                            if (!global.selectedButton[input].isToggle)
                            {
                                getId = ds_grid_get_right(global.buttonGrid, global.selectedButton[input].buttonGridX, global.selectedButton[input].buttonGridY);
                                if (getId) global.selectedButton[input] = getId;
                            }
                            else if (global.selectedButton[input].myVariable < global.selectedButton[input].myVariableMax)
                            {
                                global.selectedButton[input].myVariable+=1;
                                global.selectedButton[input].arrowClicked = true;
                            }
                        }    
                    }
                    else
                    {
                        joyCanSwitchTimeCurrent[joy] += delta_time;
                        if (joyCanSwitchTimeCurrent[joy] >= joyCanSwitchTime)
                        { 
                            joyCanSwitch[joy] = true;
                            joyCanSwitchTimeCurrent[joy]=0;
                        }
                    }   
                }
                else { joyCanSwitch[joy] = true; joyCanSwitchTimeCurrent[joy]=0; }
            }
            }
        }
    }
}
else // <- (!allowInput)
{
    global.selectedButton[K_INPUT_ALL] = -1;
    global.selectedButton[K_INPUT_KEYBOARD] = -1;
    global.selectedButton[K_INPUT_JOYSTICK1] = -1;
    global.selectedButton[K_INPUT_JOYSTICK2] = -1;
}


if (!global.allowMultipleInput)
{
    //Switch to K&M
    if ( mouse_check_button(mb_any) || keyboard_check(vk_anykey) || (mouse_x != oldMouseX) || (mouse_y != oldMouseY) )
    {
        global.mouseActive = true;
    }
            
    oldMouseX = mouse_x;
    oldMouseY = mouse_y;
            
    //Switch to Joystick
    if (gamepad_is_connected(K_INPUT_JOYSTICK1))
    {   
        if (joy_check_any(K_INPUT_JOYSTICK1)) || (joy_simple_deadzone( joy_xpos(K_INPUT_JOYSTICK1), joy_ypos(K_INPUT_JOYSTICK1), 0.3)) global.mouseActive = false;
    }
        
    if (gamepad_is_connected(K_INPUT_JOYSTICK2))
    {   
        if (joy_check_any(K_INPUT_JOYSTICK2)) || (joy_simple_deadzone( joy_xpos(K_INPUT_JOYSTICK2), joy_ypos(K_INPUT_JOYSTICK2), 0.3)) global.mouseActive = false;
    }
}
else global.mouseActive = true;

