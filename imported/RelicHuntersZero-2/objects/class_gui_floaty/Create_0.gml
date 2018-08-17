///Create

myString = "No String Inserted";
colorMain = c_white;
colorOutline = c_black;
myFont = global.font_tinyText;
drawOutline = false;

lifeMax = 0.25;
lifeCurrent = 0;

myAlpha = 1;
fadeSpeed = 0.2;//0.2; = 5 frames, 
lockToOwner = true;

offsetY = 0;
offsetX = 0;
floatSpeed = 1.0;

bounceSpeed = 2.5;
bounceGravity = 0.1;
bounceAbsoluteLimit = 2;
bounceHorizontalSpeed = 2.5;
bounceHorizontalFriction = 0.04;
var randomBounce = irandom_range(0,1);
if (randomBounce) bounceHorizontalDirection = 1;
else bounceHorizontalDirection = -1;


myOriginalScale = 1;
myScale = 1;
scaleGrow = 1;
scaleShrink = 1;
scaleOrientation = 1;
scaleSpeedGrow = 0;
scaleSpeedShrink = 0;

owner=noone;

