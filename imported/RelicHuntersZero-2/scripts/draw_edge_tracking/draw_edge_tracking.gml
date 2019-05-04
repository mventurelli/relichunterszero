///draw_edge_tracking(instance,sprite)

var trackee = argument0;
var trackSprite = argument1;

var trackX, trackY;
                
if (trackee.x >= __view_get( e__VW.XView, 0 )) trackX = min(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ), trackee.x);
else trackX = max(__view_get( e__VW.XView, 0 ), trackee.x);
                
if (trackee.y >= __view_get( e__VW.YView, 0 )) trackY = min(__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ), trackee.y);
else trackY = max(__view_get( e__VW.YView, 0 ), trackee.y);
                
var trackDir = point_direction(trackX, trackY, trackee.x, trackee.y);
                
draw_sprite_ext(trackSprite,0,trackX,trackY,0.5,0.5,trackDir,c_white,1);