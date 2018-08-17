event_inherited();

///Minimum Enemy Class Variables
sprite_reflecion = -1;
sprite_reflection_subimage = 0;

depth = -y;
image_speed = 0.1;

dodging = false;
aggro = 0;
aggro_add_hit = 0;

energy_max = 100;
energy = energy_max;
hp_max = 100;
hp = hp_max;
energy = 0;
shield = false;

myDynamicBar = instance_create_layer(x,y,"Interactive_Over",gui_dynamicBarEnemy);
owner_add_owned_instance(myDynamicBar);
//myDynamicBar.owner = id;

pushed = false;
push_direction = 0;
push_speed = 0;

isVulnerable = true;

//AI
ai_target = noone;

//Audio
audio_emitter = 0;