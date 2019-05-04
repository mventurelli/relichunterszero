
///Debug for Pathfinding

if (global.drawGridDebug)
{
    //show_debug_message('Trying to draw the grid!');
    draw_set_alpha(0.5);
    mp_grid_draw(global.astar_grid);
    draw_set_alpha(1);
}

///Crosshair

if (!global.pauseMenu) && (!global.gameOver) && (instance_exists(class_player))
{   
    var pCount = instance_number(class_player);
    for (var i=0; i<pCount; i++)
    {
        pCur = instance_find(class_player,i);
        if (pCur) && (instance_exists(pCur))
        {
            var drawCrosshair = true;
            
            var crossSprite = noone;
            var p = pCur.myPlayerId;
            
            if (p==1) crossSprite = spr_crosshair;
            if (p==2) crossSprite = spr_crosshair2;
            
            if collision_circle(global.crosshairX[p],global.crosshairY[p],5,class_enemy,false,true) crosshair_image = 1;
            else crosshair_image = 0;
                
            if (global.input[p] != K_INPUT_KEYBOARD)
            {
				drawCrosshair = false;
                //if (pCur.aiming) drawCrosshair = false;
                //if (!pCur.joyIsRightStickAiming) drawCrosshair = false;
            }
            
            if instance_exists(pCur.myGun)
            {
                if (pCur.myGun.reloading)
                {
                    var subImage = (pCur.myGun.reload_time_current/pCur.myGun.reload_time)*12; //12=animation frames;
                        
                    if (drawCrosshair)
                    {
                        draw_sprite_ext(crossSprite,3,global.crosshairX[p],global.crosshairY[p],global.crosshair_scale[p],global.crosshair_scale[p],0,c_white,1);
                        draw_sprite_ext(spr_crosshair_reload,subImage,global.crosshairX[p],global.crosshairY[p],1.6,1.6,0,c_white,1);
                    }
                    drawCrosshair = false;
                }
            }
            
            if (global.auto_aim == K_AUTOAIM_FULL) && (pCur.joyAimLocked) drawCrosshair = true; //Force draw on auto-aim
            
            if (drawCrosshair) draw_sprite_ext(crossSprite,crosshair_image,global.crosshairX[p],global.crosshairY[p],global.crosshair_scale[p],global.crosshair_scale[p],0,c_white,1);
            
            if global.crosshair_scale[p] > 1
            {
                global.crosshair_scale[p] -= 0.05;
            }
        }
    }
}

///Edge Tracking Enemies

if (ds_exists(global.edgeTrackEnemyList,ds_type_list)) && (!global.pauseMenu) && (!global.gameOver) && (instance_exists(class_player))
{
    if (!ds_list_empty(global.edgeTrackEnemyList)) 
    {
        for (var i=0; i<ds_list_size(global.edgeTrackEnemyList); i++)
        {
            var trackee = ds_list_find_value(global.edgeTrackEnemyList,i);
            if (instance_exists(trackee))
            {
				draw_edge_tracking(trackee,spr_edgeTrackEnemy);
				/*
                var trackX, trackY;
                
                if (trackee.x >= __view_get( e__VW.XView, 0 )) trackX = min(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ), trackee.x);
                else trackX = max(__view_get( e__VW.XView, 0 ), trackee.x);
                
                if (trackee.y >= __view_get( e__VW.YView, 0 )) trackY = min(__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ), trackee.y);
                else trackY = max(__view_get( e__VW.YView, 0 ), trackee.y);
                
                var trackDir = point_direction(trackX, trackY, trackee.x, trackee.y);
                
                draw_sprite_ext(spr_edgeTrackEnemy,0,trackX,trackY,0.5,0.5,trackDir,c_white,1);
				*/
            }
        }
    }
}

///Edge Tracking Gunnar and Teleporter on Storm Mode
if (global.gameMode == gamemode_storm)
{
	if (global.gunnarFound)
	{
		if (instance_exists(obj_gunnar))
		{
			if (!on_screen_offset(obj_gunnar.x,obj_gunnar.y,32)) draw_edge_tracking(obj_gunnar,spr_edgeTrackGunnar);
		}
	}
	
	if (global.teleporterFound)
	{
		if (instance_exists(obj_bossTeleporter))
		{
			if (!on_screen_offset(obj_bossTeleporter.x,obj_bossTeleporter.y,32)) draw_edge_tracking(obj_bossTeleporter,spr_edgeTrackTeleport);
		}
	}
}