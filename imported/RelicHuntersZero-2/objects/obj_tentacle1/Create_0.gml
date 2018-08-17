///Main Variables

depth = -y;
image_speed = 0.1;
image_index = irandom(image_number-1);

damage = 20;
damage_timer = 1000000;//room_speed*1;
damage_timer_current = damage_timer;

dodging = false;
aggro = 0;
aggro_add_hit = 0;

energy_max = 100;
energy = energy_max;
hp_max = 100;
hp = hp_max;
energy = 0;
shield = false;

pushed = false;
push_direction = 0;
push_speed = 0;

hit_taken = false;
hit_taken_max = 100000;//room_speed*0.1;
hit_taken_count = 0;
hit_direction = 0;

sprite_idle = spr_tentacle_idle;
sprite_hit = spr_tentacle_idle;



