///Main Variables

textBig = "NEW TEXT UNLOCKED!";
textSmall = "CHECK OUT THIS NIFTY TEXT, ISNT IT COOL?";

textBigFont = global.font_menuLarge;
textBigColor = K_BETU_GREEN2;

textSmallFont = global.font_menuMedium;
textSmallColor = c_white;


if (instance_number(fx_bigMessage) == 1) active = true;
else active = false;

myAlpha = 0;
myAlphaTime = 500000;// myAlphaSpeed = 2 / global.target_fps; // 0.5 s
myAlphaCurrentTime = 0;

lifeTime = 3000000;//room_speed*3;
lifeTimeCurrent = 0;
timeToDie = false;
myAlphaDieTime = 1000000;//myAlphaDieSpeed = 1 / global.target_fps; // 1 s
myAlphaCurrentDieTime = 0;

relicSprite1 = -1;
relicSprite1Draw = false;
relicSprite2 = -1;
relicSprite2Draw = false;
relicSprite3 = -1;
relicSprite3Draw = false;
relicCompleteSprite = -1;
hunterUnlockSprite = -1;
