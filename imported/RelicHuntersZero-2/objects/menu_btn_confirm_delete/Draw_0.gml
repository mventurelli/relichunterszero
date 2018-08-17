///Draw blackness

var oldAlpha = draw_get_alpha();
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0,0,display_get_width(),display_get_height(),false);

draw_set_alpha(oldAlpha);
event_inherited();

draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_set_font(global.font_menuLarge);
draw_set_color(c_white);
draw_text_ext(x,y-128,string_hash_to_newline(loc_key("SETTINGS_DELETESAVE_TEXT")),32,600);

