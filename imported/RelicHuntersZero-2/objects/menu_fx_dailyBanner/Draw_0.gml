if (instance_exists(menu_btn_confirm_daily))
{
    myButtonOverlord = instance_find(menu_btn_confirm_daily,0);
    if (myButtonOverlord.isAvailable) draw_self();
}

