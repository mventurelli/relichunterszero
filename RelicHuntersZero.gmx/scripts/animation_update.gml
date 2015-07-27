// animation_update()
// Run this on the caller's End Event to run the animations
timeline_position += timeline_speed;
// Priority control
if variable_local_exists ('animation_type') switch (animation_type)
    {
        case (an_clamp):
        {
            if animation_index >= (animation_frames - 1)
                animation_priority = 0;
        }
        break;
        case (an_loop):
        {
        break;
        }
    }
// Type Control
if variable_local_exists('animation_type')
{
switch (animation_type)
{
    case an_clamp:
    {
        if timeline_position > (animation_frames - 1) timeline_position = (animation_frames - 1);
        //image_index = timeline_position;
        animation_index = timeline_position;
    }
    break;
    case an_loop:
    {
        if timeline_position > (animation_frames - 1) timeline_position = 0;
        //image_index = timeline_position;
        animation_index = timeline_position;
    }
    break;
}
}
// Body Parts
switch (animation_current)
    {
    case ('k_fire'):
        {
        animation_head = k_fire_head;
        animation_legs = k_fire_legs;
        animation_shoulder = k_fire_shoulder;
        animation_weapon = k_fire_weapon;
        break;
        }
    case ('k_firemove_back'):
        {
        animation_head = k_firemove_back_head;
        animation_legs = k_firemove_back_legs;
        animation_shoulder = k_firemove_shoulder;
        animation_weapon = k_firemove_weapon;
        break;
        }
    case ('k_thrust'):
        {
        animation_head = k_thrust_head;
        animation_legs = k_thrust_legs;
        animation_shoulder = k_thrust_shoulder;
        animation_weapon = k_thrust_weapon;
        break;
        }
    case ('k_standing'):
        {
        animation_head = k_standing_head;
        animation_legs = k_standing_legs;
        animation_shoulder = k_standing_shoulder;
        animation_weapon = k_standing_weapon;
        break;
        }
    case ('k_firemove'):
        {
        animation_head = k_firemove_head;
        animation_legs = k_firemove_legs;
        animation_shoulder = k_firemove_shoulder;
        animation_weapon = k_firemove_weapon;
        break;
        }
    case ('k_jump_up'):
        {
        animation_head = k_jump_up_head;
        animation_legs = k_jump_up_legs;
        animation_shoulder = k_jump_up_shoulder;
        animation_weapon = k_jump_up_weapon;
        break;
        }
    case ('k_jump_down'):
        {
        animation_head = k_jump_down_head;
        animation_legs = k_jump_down_legs;
        animation_shoulder = k_jump_down_shoulder;
        animation_weapon = k_jump_down_weapon;
        break;
        }
    case ('k_landing'):
        {
        animation_head = k_landing_head;
        animation_legs = k_landing_legs;
        animation_shoulder = k_landing_shoulder;
        animation_weapon = k_landing_weapon;
        break;
        }
    case ('k_landmove'):
        {
        animation_head = k_landmove_head;
        animation_legs = k_landmove_legs;
        animation_shoulder = k_landmove_shoulder;
        animation_weapon = k_landmove_weapon;
        break;
        }
    case ('k_thrust_back'):
        {
        animation_head = k_thrust_back_head;
        animation_legs = k_thrust_back_legs;
        animation_shoulder = k_thrust_back_shoulder;
        animation_weapon = k_thrust_back_weapon;
        break;
        }
    case ('k_fire_up'):
        {
        animation_head = k_fire_up_head;
        animation_legs = k_fire_up_legs;
        animation_shoulder = k_fire_up_shoulder;
        animation_weapon = k_fire_up_weapon;
        break;
        }
    case ('k_fire_up_moving'):
        {
        animation_head = k_fire_up_moving_head;
        animation_legs = k_fire_up_moving_legs;
        animation_shoulder = k_fire_up_moving_shoulder;
        animation_weapon = k_fire_up_moving_weapon;
        break;
        }
    }
