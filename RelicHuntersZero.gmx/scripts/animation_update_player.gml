///animation_update_player()
// Run this on the caller's End Event to run the animations

animation_index += animation_speed;
    
// Type Control
switch (animation_type)
{
    case an_clamp:
        if animation_index >= (animation_frames - 1) 
        {
            animation_index = (animation_frames - 1);
            animation_priority = 0;
        }
        break;
        
    case an_clamp_forever:
        if animation_index >= (animation_frames - 1) 
        {
            animation_index = (animation_frames - 1);
        }
        break; 
    
    case an_loop:
        if animation_index >= (animation_frames - 1) animation_index = 0;
        break;
}

// Switch Animation
switch (animation_current)
{
    case ('idle'):
        {
        sprite_index = sprite_idle;
        break;
        }
    case ('walk'):
        {
        sprite_index = sprite_walk;
        break;
        }
    case ('sprint'):
        {
        sprite_index = sprite_sprint;
        break;
        }
    case ('dash'):
        {
        sprite_index = sprite_dash;
        break;
        }
    case ('hit'):
        {
        sprite_index = sprite_hit;
        break;
        }    
    case ('death'):
        {
        sprite_index = sprite_death;
        break;
        }
    case ('melee'):
        {
        sprite_index = sprite_melee;
        break;
        }
    case ('dig'):
        {
        sprite_index = sprite_dig;
        break;
        }
}
    
// Resolve Animation

image_index = animation_index;
