///Main Draw
if instance_exists(owner)
{
    if (!owner.isDigging) && (owner.animation_current != "dig")
    {
        if (reloading) blend = c_gray;
        else blend = c_white;
        
        var drawGrenadeInsteadOfGun = false;
        
        if (owner.throw)
        {
            if (owner.animation_current == "melee") && (owner.animation_index < owner.melee_hit_frame) drawGrenadeInsteadOfGun = true;
        }
        
        // Laser Beams
        if (projectile_obj == obj_projectile_beam) && (isActive) && (input_held) && (!reloading) && (can_fire) && (!owner.sprinting) && (!owner.melee)
        {
            draw_line_width_colour(x,y,lineX,lineY,beamThickness,beamColor,beamColor);
            if (draw_range < projectile_range) draw_circle_colour(lineX, lineY, 4, beamColor, beamColor, false);
        }
        
        //Draw Self
        if (!drawGrenadeInsteadOfGun) {
			if (sprite_index >= 0) {
				draw_sprite_ext(sprite_index,image_index,drawX,drawY,image_xscale,image_yscale,image_angle,blend,1);
			}
		}
        else 
        {
            if (instance_exists(owner)) if (owner.myChar == char_rider) grenadeSpriteOverride = spr_grenadeRider;
            
            draw_sprite_ext(grenadeSpriteOverride,0,drawX,drawY,1,1,image_angle,blend,1);
        }
        
        // Aim
        if (isActive) && (owner.aiming)
        {
            var laserColor = c_red;
            if (isPrecisionAiming) laserColor = c_white;
            
            draw_line_width_colour(x,y,lineX,lineY,2,laserColor,laserColor);
            if (draw_range < projectile_range) draw_circle_colour(lineX, lineY, 4, laserColor, laserColor, false);
        }
    }
}

