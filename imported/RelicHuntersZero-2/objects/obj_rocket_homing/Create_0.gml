///Homing Stuff

event_inherited();

//Attributes
owner = noone;
speed_per_second = 4;
maxSpeed = 8;
decay = -0.013;
damage = 200;
range = 1000;
push_power = 10;

faction = f_enemy;

//Target Acquisition

weapon_homing_setup(3,0.008,0.1,180,5,100,1200);


/*
curveRatio = 3;
curveRatioDecay = 0.008; 
curveRatioMin = 0.1;

angleDiffMax = 180;
angleDiffMin = 5;
curveDistanceMax = 1200;
curveDistanceMin = 100;

curveTarget = noone;



/* */
/*  */
