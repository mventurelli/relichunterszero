event_inherited();

projectile_obj = obj_projectile_homingEnemy;

myHomingTargetClass = class_player;

sound = "smg";
ammo_type = type_enemy;

projectile_speed = 24;
projectile_speed_decay = 0.2;
projectile_damage = 7;
projectile_range = 450;

accuracy = 5;

fire_burst = irandom_range(3,4);
fire_burst_rate = 250000;//room_speed*0.25;
fire_rate = irandom_range(2,3) * 700000;//irandom_range(room_speed*2,room_speed*3);

