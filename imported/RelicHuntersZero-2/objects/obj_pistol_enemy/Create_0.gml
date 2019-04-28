event_inherited();

sound = "pistol";
ammo_type = type_enemy;

projectile_speed = 10;
projectile_speed_decay = 0;
projectile_damage = 8;
projectile_range = 550;

accuracy = 18;

fire_burst = irandom_range(2,3);
fire_burst_rate = 500000;//room_speed*0.5;
fire_rate = irandom_range(2,3)*700000;//irandom_range(room_speed*2,room_speed*3);

