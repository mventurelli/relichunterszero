event_inherited();

sound = "machinegun";
ammo_type = type_medium;

projectile_speed = 25;
projectile_speed_decay = 0.2;
projectile_damage = 25;
projectile_range = 500;

accuracy = 4;
fire_burst = irandom_range(2,3);
fire_burst_rate = 600000;//room_speed*0.6;
fire_rate = irandom_range(1.5,2.5) * 1000000;//irandom_range(room_speed*1.5,room_speed*2.5);

