///Main Variables
event_inherited();

depth = -y+96;

instantExplosionThreshold = -maxhp;
instantExplosionRadius = 100;

isShaking = false;
explosionDirection = 0;
projectileDirection = explosionDirection;

emissionRate = 0.4;
emissionRateGrowth = 0.01;
emissionRateCurrent = 0;

isExploding = false;
timeToExplode = 1500000;//room_speed*1.5;
timeCurrent = 0;

hasImpactSound = true;
impactSound1 = sfx_debris1;
impactSound2 = sfx_debris2;
impactSound3 = sfx_debris3;

fakeMovement = 0;
fakeSpeed = 0.4;

//Target Acquisition

curveRatio = 0.07;
angleDiffMax = 100;
angleDiffMin = 5;
curveDistanceMax = 1200;
curveDistanceMin = 100;

curveTarget = noone;
targetList = ds_priority_create();
targetSearch = false;

smoke_system = noone;
smoke_emitter = noone;
smoke_particle = noone;


