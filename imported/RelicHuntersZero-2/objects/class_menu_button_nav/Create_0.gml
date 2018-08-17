///Main Stuff

event_inherited();

textXOffset = 0;
textYOffset = -14;

myFont = global.font_menuLarge;

starPositionX = 0;
starPositionY = -1*(point_distance(x,y,x,bbox_top));

starScaleInitial = 1.5;
starScale = starScaleInitial;
starScaleSpeed = 0.025;
starScaleFinal = 1;

moveSpeed = 3;
moveDistance = 15;

startPositionX = x;
startPositionY = y;

selectPositionX = x;
selectPositionY = y-moveDistance;

