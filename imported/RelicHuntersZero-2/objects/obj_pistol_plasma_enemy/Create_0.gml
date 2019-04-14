event_inherited();

sound = "pistol";
ammo_type = type_enemy;

projectile_obj = obj_projectile_plasmaEnemy;

projectile_speed = 0.02;
projectile_speed_decay = -0.085;
projectile_damage = 60;
projectile_range = 600;

accuracy = 8;

fire_burst = irandom_range(2,3);
fire_burst_rate = 500000;//room_speed*0.5;
fire_rate = irandom_range(2,3) * 500000;//irandom_range(room_speed*2,room_speed*3);

