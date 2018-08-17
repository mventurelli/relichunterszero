///@ gui_info_show_at(owner,x,y,layer,color,text)
if (global.guiInfo != noone) {
	
	global.guiInfo.owner = argument0;
	global.guiInfo.x = argument1;
	global.guiInfo.y = argument2;
	global.guiInfo.layer = layer_get_id(argument3);
	global.guiInfo.depth = layer_get_depth(argument3) -100;
	global.guiInfo.colorMain = argument4;
	global.guiInfo.myString = argument5;
	
	global.guiInfo.myAlpha = 1;
	global.guiInfo.lifeMax = 0.75;//room_speed*0.75;
	global.guiInfo.lifeCurrent = 0;
	global.guiInfo.myScale = global.guiInfo.myOriginalScale;	
	global.guiInfo.floatSpeed = global.guiInfo.originalFloatSpeed;
	global.guiInfo.offsetX = global.guiInfo.originalOffsetX;
	global.guiInfo.offsetY = global.guiInfo.originalOffsetY;
	
	global.guiInfo.visible = true;
}