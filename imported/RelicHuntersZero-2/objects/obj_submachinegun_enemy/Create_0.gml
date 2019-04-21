event_inherited();
sound = "smg";
ammo_type = type_enemy;

projectile_speed = 12;
projectile_speed_decay = 0;
projectile_damage = 6;
projectile_range = 550;

accuracy = 30;

fire_burst = irandom_range(6,9);
fire_burst_rate = 100000;//room_speed*0.1;
fire_rate = irandom_range(2,4) * 720000;//irandom_range(room_speed*2,room_speed*4);

