///Main Setup

longDist = 500;
shortDist = 160;

drawStart = 42;
radius = drawStart;

longRadius = 320;
shortRadius = 160;
noRadius = 80;
drawLong = false;
drawShort = false;



alarm[0] = room_speed*0.2;

if instance_exists(obj_digSpot)
{
    var dist = point_distance(x,y,obj_digSpot.x,obj_digSpot.y);
    
    if (dist <= shortDist) drawShort = true;
    else if (dist <= longDist) drawLong = true;
}

longGrowthSpeed = 8;
shortGrowthSpeed = 3;
noRadiusSpeed = 2;

allowChild = true;

if (drawShort) audio_play_sound(sfx_detector_close,99,false);
else if (drawLong) audio_play_sound(sfx_detector_mid,99,false);
else audio_play_sound(sfx_detector_far,99,false);

