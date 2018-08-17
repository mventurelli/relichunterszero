///Draw

if (sprite_index == spr_boss_egg_crack)
{
        //draw_sprite(spr_boss_idle,8,x,y);
        draw_sprite_ext(spr_boss_idle,8,x,y,-image_xscale,image_xscale,0,c_white,1);
}

draw_self();

