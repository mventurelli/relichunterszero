///Main Draw
draw_self();

//Pause Animation
old_image_speed = image_speed;
if (global.pause)
{
    image_speed = 0;
    path_end();
}
else image_speed = old_image_speed;

//Debug
/*
draw_set_font(global.font_numberSmall);
draw_text(x,y-30,ai_state);

if (ai_state == 'PATROL')
{
    draw_text(x,y+30,string(ai_patrol_x)+','+string(ai_patrol_y));
}

/* */
/*  */
