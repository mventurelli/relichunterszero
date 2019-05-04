
draw_self();

//Pause Animation
old_image_speed = image_speed;
if (global.pause)
{
    image_speed = 0;
    path_end();
}
else image_speed = old_image_speed;

/*
draw_text(x,y-64,"AGG "+string(aggro)+" "+ai_state);