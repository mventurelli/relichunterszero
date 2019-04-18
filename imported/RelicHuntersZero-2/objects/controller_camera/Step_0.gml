///Movement

if (!starting_position_set) && instance_exists(class_player)
{
    x = class_player.x;
    y = class_player.y;
    __view_set( e__VW.XView, 0, x );
    __view_set( e__VW.YView, 0, y );
    starting_position_set = true;
} 

xview_previous = __view_get( e__VW.XView, 0 );
yview_previous = __view_get( e__VW.YView, 0 );
audio_listener_position(x, y, 0);
audio_listener_orientation(x,y,0,x,y,1); 

var countPlayers = instance_number(class_player);

//Camera Position
if (countPlayers > 0)
{
    if (countPlayers == 1)
    {
        var pId = class_player.myPlayerId;
    
        if (class_player.aiming) 
        {
            if (!aim_locked)
            {
                aim_locked = true;
                
                angle = point_direction(class_player.x, class_player.y, global.crosshairX[pId], global.crosshairY[pId]);
                
                distance = weaponRange  / distance_ratio_aiming;
                if distance > hard_limit distance = hard_limit;
            }
            else if (global.input[pId] != K_INPUT_KEYBOARD) { // <-- NEW CODE: Adjust position if angle diff is 45 degrees or greater
                var trueAngle = point_direction(class_player.x, class_player.y, global.crosshairX[pId], global.crosshairY[pId]);
                if (abs(angle-trueAngle) > 45) angle = trueAngle;
            }
        }
        else 
        {
            aim_locked = false;

            distance = point_distance(class_player.x,class_player.y,global.crosshairX[pId],global.crosshairY[pId]) / distance_ratio;
            if (distance > max_distance) distance = max_distance;
            angle = point_direction(class_player.x,class_player.y,global.crosshairX[pId],global.crosshairY[pId]);
                
            if (global.input[pId] != K_INPUT_KEYBOARD) distance = distance*1.5;
            
            //Minimum Distance for Joystick
            var joyDistanceMin = 16;
            if (global.input[pId] != K_INPUT_KEYBOARD) && (distance <= joyDistanceMin) && (!class_player.joyIsRightStickAiming)
            {
               distance=0;
               angle=0;
            }

            if (global.input[pId] != K_INPUT_KEYBOARD) && (global.auto_aim == K_AUTOAIM_FULL) && (!class_player.joyIsRightStickAiming)
            {
                distance=0;
                angle=0;
            }
        }
        
        
        //Follow Movement (NEW)
        var targetX = class_player.x + lengthdir_x(distance,angle);
        var targetY = class_player.y + lengthdir_y(distance,angle);
        
        var totalDistance = point_distance(x,y,targetX,targetY);
        
        if (totalDistance > 0.05)
        {
            if (global.input[pId] == K_INPUT_KEYBOARD) followSpeedCurrent = followSpeed;
            else if (followSpeedCurrent != followSpeed)  followSpeedCurrent += min(followSpeedAccel, abs(followSpeed-followSpeedCurrent));
        
            var totalAngle = point_direction(x,y,targetX,targetY);
            x += lengthdir_x(min(followSpeedCurrent, totalDistance), totalAngle);
            y += lengthdir_y(min(followSpeedCurrent, totalDistance), totalAngle);
        }
        else followSpeedCurrent = 0;
        
        //Screen Zoom
        if (class_player.dodging) || (class_player.aiming) || (class_player.melee_dash) zoom = gameZoom*0.9;
        else zoom = gameZoom;
    }
    
    if (countPlayers == 2) //2-player camera 
    {
        var player1 = instance_find(class_player,0);
        var player2 = instance_find(class_player,1);
        
        if (player1 != noone) && (player2 != noone)// && (instance_exists(player1)) && (instance_exists(player1)) 
        {
			var p1x = player1.x;
			var p1y = player1.y;
			var p2x = player2.x;
			var p2y = player2.y;
			
            x = 0.5*(p1x + p2x);
            y = 0.5*(p1y + p2y);
			
			var playerDist = point_distance(p1x,p1y,p2x,p2y);
			var zoomDist = 320;
			var zoomFactor = 0.001;
			
			if (playerDist>zoomDist) zoom = 1.0 + min(0.5, zoomFactor*(playerDist-zoomDist));
        }
    }
    
    //Screen Shake
    if (screen_shake) && (global.screenShakeRatio)
    {
        if screen_shake > shake_max screen_shake = shake_max;
             
        x = x+lengthdir_x(screen_shake*global.screenShakeRatio,shake_direction);
        y = y+lengthdir_y(screen_shake*global.screenShakeRatio,shake_direction);
            
        screen_shake -= shake_recovery;
        shake_direction = irandom(359);
            
        if screen_shake < 0 screen_shake = 0;
    }
}


//Zoom Control
if zoom_current != zoom
{
    if (zoom_current > zoom) && (countPlayers > 0)
    {
        zoom_current -= min(zoom_speed_in,zoom_current-zoom);
        
    }
    else zoom_current += min(zoom_speed_out,zoom-zoom_current);
}

camera_set_view_size(view_camera[0], 1280*zoom_current, 720*zoom_current);

/*
__view_set( e__VW.WView, 0, 1280*zoom_current ); //I am overriding this on the "game_pause()" script
__view_set( e__VW.HView, 0, 720*zoom_current );



