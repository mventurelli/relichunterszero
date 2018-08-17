///Main Draw
draw_self();

draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_font(global.font_shopPrice);

if (buy) && (!active)
{
    if (global.score_total >= myPrice) color = c_white;
    else color = c_red;

    draw_sprite(spr_coin_ground,0,x-14,y+56);
    draw_text_outline(x-2,y+56,string(myPrice),color);
}

if (active) && (room == room_start)
{
    unlock_max = global.shop_size_1;
    unlock_current = (unlock_max - ds_list_size(global.shop_list_1));

    if (myLevel == 1)
    {
        unlock_max = global.shop_size_2;
        unlock_current = (unlock_max - ds_list_size(global.shop_list_2));
    }
    
    if (myLevel == 2)
    {
        unlock_max = global.shop_size_3;
        unlock_current = (unlock_max - ds_list_size(global.shop_list_3));
    }
    
    if (myLevel == 3)
    {
        unlock_max = global.shop_size_4;
        unlock_current = (unlock_max - ds_list_size(global.shop_list_4));
    }
    
    draw_sprite(spr_unlock,0,x-18,y+56);
    draw_text_outline(x-6,y+56,string(unlock_current)+" / "+string(unlock_max),c_white);
}

//Draw Stage Feedback
if (room==room_start)
{
    draw_set_font(global.font_tinyText);
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    
    draw_text_dropshadow_ext_transformed(x+2,y+37,loc_key("GENERAL_TELEPORTER_STAGE")+" "+string(max(1,myLevel+1)),c_white,c_black,0.7,2,1,1,0,1);
}



