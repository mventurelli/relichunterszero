///Bouncing Coins
magnet_range = 110;
magnet_accel = 3;
magnet_speed_max = 8;
magnet_friction = 2;

magnet_player = noone;

alpha = 1;
alpha_duration = 100000;//room_speed*0.1;
alpha_duration_current = 0;
myTime = 0;
life_time = random_range(12, 15) * 1000000;
alert_time = 8000000;//room_speed*8;

sprite1 = spr_coin_drop;
sprite2 = spr_coin_ground;
sprite = sprite1;
sprite_subimage = 0;
draw_height = -40;

vertical_speed_start = random_range(3,6);
interactive_speed = vertical_speed_start;
vertical_speed = -vertical_speed_start;
vertical_speed_start_min = 0.5;
bounce_min = 1;
bounce_max = 2;
fake_gravity = 0.3;


speed_per_second = random_range(2,4);
friction_per_second = 0.05;

randomizeDir = false;
image_speed = 0.2;

direction = random(360);

