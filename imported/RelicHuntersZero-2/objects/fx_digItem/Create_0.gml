///Setup
image_speed = 0.1;

audio_stop_all();
audio_play_sound(sfx_dig_done,99,false);
if (global.ambientSound) audio_play_sound(global.ambientSound,9,true);

relic = noone;
endlessRelic = noone;
endlessWeapon = noone;

itemSprite = spr_pineapple1;
itemFrame = 14;
itemAlpha = 1;
itemAlphaSpeed = 0;
itemAlphaSpeedMax = 0.02;
itemAlphaSpeedAccel = 0.0005;

animationDone = false;



