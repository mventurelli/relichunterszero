///Setup

event_inherited();

hpValue = 8;

eatSfx1 = sfx_kami_bite;
eatSfx2 = sfx_kami_bite;
eatSfx3 = sfx_kami_bite;

var randomSprite;
var randomRoll = irandom_range(0,1);
if (randomRoll == 0) randomSprite = spr_candyLarge1;
else randomSprite = spr_candyLarge2;

sprite1 = randomSprite;
sprite2 = randomSprite;
sprite = sprite1;
sprite_subimage = 0;



