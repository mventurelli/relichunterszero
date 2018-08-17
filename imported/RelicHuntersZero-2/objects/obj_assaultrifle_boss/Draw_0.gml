///Draw Override
draw_sprite_ext(sprite_index,image_index,drawX,drawY,image_xscale,image_yscale,image_angle,c_white,1);

if (owner != noone)
{
    if (owner.firing) && (is_sniper) && instance_exists_fast(owner.ai_target) && (fire_rate_current >= fireRateFeedback)
    {
        aiming_direction = point_direction(x,y,owner.ai_target.x,owner.ai_target.y);
        
        range_to_solid = range_finder(x,y,aiming_direction,projectile_range,class_solid,false,true);
        range_to_enemy = range_finder(x,y,aiming_direction,projectile_range,class_player,false,true);
        {
            if (!range_to_solid) range_to_solid = distance_far;
            if (!range_to_enemy) range_to_enemy = distance_far;
            draw_range = min(range_to_solid,range_to_enemy,projectile_range);
            
            lineX = x+lengthdir_x(draw_range,aiming_direction);
            lineY = y+lengthdir_y(draw_range,aiming_direction);
            draw_line_width_colour(x,y,lineX,lineY,2,c_green,c_green);
            if (draw_range < projectile_range) draw_circle_colour(lineX, lineY, 4, c_green, c_green, false);
        }
    }
}



