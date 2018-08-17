///Draw Black BG

if (image_index < 48) {
    draw_set_colour(c_black);
    draw_rectangle(0,0,room_width,room_height,false);
}

if (image_index) draw_self();

