///Main Shit
joy_init();
goToNextRoom = false;
allowInput = false;

x=0;
y=0;
image_speed = 0.1;


alarm[3] = room_speed*0.5; //Allow player to skip

alarm[0] = room_speed*3; //spawn scrolling text
alarm[1] = room_speed*90; //fade to black
alarm[2] = room_speed*93; //go to next room


if (room == room_intro)
{
    audio_stop_all();
    audio_play_sound(bgm_intro,99,true);
}

volume_update();
