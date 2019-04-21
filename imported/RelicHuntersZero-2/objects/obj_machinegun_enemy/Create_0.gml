event_inherited();
sound = "machinegun";
ammo_type = type_enemy;

projectile_speed = 14;
projectile_speed_decay = 0;
projectile_damage = 7;
projectile_range = 560;

accuracy = 25;

fire_burst = irandom_range(4,7);
fire_burst_rate = 200000;//fire_burst_rate = room_speed*0.2;
fire_rate = irandom_range(3,4.2)*720000;//irandom_range(room_speed*3,room_speed*4.2);

