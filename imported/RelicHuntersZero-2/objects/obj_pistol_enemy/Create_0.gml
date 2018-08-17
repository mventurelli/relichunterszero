event_inherited();

sound = "pistol";
ammo_type = type_light;

projectile_speed = 35;
projectile_speed_decay = 0.2;
projectile_damage = 6;
projectile_range = 450;

accuracy = 5;

fire_burst = irandom_range(2,3);
fire_burst_rate = 500000;//room_speed*0.5;
fire_rate = irandom_range(2,3)*1000000;//irandom_range(room_speed*2,room_speed*3);

