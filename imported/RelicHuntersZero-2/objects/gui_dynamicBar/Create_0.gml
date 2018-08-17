///Init
owner = noone;

hp = 999;
hpMax = 999;
shield = 999;
shieldMax = 999;

drawShield = false;
drawHealth = false;

myAlpha = 0;
myAlphaSpeed = 0.025;

barWidth = 60;
barHeight = 6;

barShields = 1;
barHp = 2;
draw_healthbar_delayed_init(barShields);
draw_healthbar_delayed_init(barHp);

charBarDelaySpeed = 0.012;
charBarDelayTime = 600000;//room_speed*0.6;

healthColor = make_color_rgb(184,49,35);
shieldColor = make_color_rgb(50,133,158);

