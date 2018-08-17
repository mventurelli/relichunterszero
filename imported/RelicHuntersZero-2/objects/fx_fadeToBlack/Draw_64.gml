/// @Draw Blackness
var oldAlpha = draw_get_alpha();

draw_set_alpha(myAlpha);
draw_set_color(c_black);
draw_rectangle(
	view_xview[0],
	view_yview[0],
	view_xview[0] + display_get_width(),
	view_yview[0] + display_get_height(),
	0);
draw_set_alpha(oldAlpha);


/*
draw_rectangle(
	view_xview[0],
	view_yview[0],
	view_xview[0] + view_wview[0],
	view_yview[0] + view_hview[0],
	0);