event_inherited();
sound = "smg";
ammo_type = type_light;

projectile_speed = 35;
projectile_speed_decay = 0.2;
projectile_damage = 4;
projectile_range = 450;

accuracy = 10;

fire_burst = irandom_range(6,9);
fire_burst_rate = 100000;//room_speed*0.1;
fire_rate = irandom_range(2,4) * 1000000;//irandom_range(room_speed*2,room_speed*4);

