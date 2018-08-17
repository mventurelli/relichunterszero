///Bouncing Stuff
sprite = spr_casing;
sprite_subimage = 0;
draw_height = -40;

sprite_angle = 0;
angular_min = -10;
angular_max = 10;
angular_speed = random_range(angular_min,angular_max);

vertical_speed_start = random_range(3,6);
vertical_speed = -vertical_speed_start;
vertical_speed_start_min = 0.5;
fake_gravity = 0.3;

timeToBounce = false;
firstBounce = false;
bounce_min = 1;
bounce_max = 2;
playAudio = false;

speed_per_second = random_range(2,4);
dirMin = -30;
dirMax = 30;
direction = 180 + random_range(dirMin,dirMax);
friction_per_second = 0.05;
 
randomizeDir = false;

finalAngle[0] = 90;
finalAngle[1] = 90;
finalAngle[2] = 90;
finalAngle[3] = 90;
