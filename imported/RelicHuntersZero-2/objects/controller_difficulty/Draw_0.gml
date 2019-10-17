/// @description Insert description here
// You can write your code in this editor

draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_font(global.font_menuLargest);

draw_text_outline_ext(640,240,loc_key("DIFFICULTY_MENU_HEADER"),c_white,K_BETU_RED);

if (global.gameMode == gamemode_storm)
{
	draw_set_font(global.font_menuMedium);
	draw_text_outline_ext(640,500,loc_key("DIFFICULTY_MENU_STORM"),c_white,K_BETU_RED);
}