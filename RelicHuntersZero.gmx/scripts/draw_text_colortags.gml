///draw_text_colortags(x,y,str)
/*
    By Davve (http://gmc.yoyogames.com/index.php?showtopic=460131)
    
    INFO:
        Draws a text exactly like draw_text, but with this
        script, you can use simple color tags to change the
        colors of certain words.

    EXAMPLE:

        draw_text_colortags(x, y, "[c=255]Red text[/c], [c=$00FF00]green text[/c] and [c=c_blue]blue text[/c]!")

    ARGUMENTS:
        x =             The x position to draw the text.
        y =             The y position to draw the text.
        str =           The string to draw.

    RETURNS:
        Nothing.

    WRITTEN BY:
        Davve
        No credit needed, but appreciated.

*/
{
    var xx, yy, str, st, et, ct, l, h, stl, pc, dx, dy, dp, p, c, ds, i;
    xx = argument0;
    yy = argument1;
    str = argument2;
    st = '[c=';
    et = ']';
    ct = '[/c]';
    
    l = string_length(str);
    h = string_height(' ');
    stl = string_length(st);
    pc = draw_get_color();
    dx = xx;
    dy = yy;
    dp = 1;
    for (p = 1; p <= l; p += 1) {
        c = string_char_at(str, p);
        if (c == chr(10) || p == l || (c == '#' && string_char_at(str, p - 1) != '\')) {
            draw_text(dx, dy, string_copy(str, dp, p - dp + 1));
            dp = p + 1;
            dx = xx;
            dy += h;
        } else if (c == string_char_at(st, 1) || c == string_char_at(ct, 1)) {
            if (p + string_length(st) <= l && string_copy(str, p, string_length(st)) == st) {
                ds = string_copy(str, dp, p - dp);
                draw_text(dx, dy, ds);
                dx += string_width(ds);
                i = string_copy(str, p + stl, string_pos(et, string_delete(str, 1, p + stl)));
                p += string_length(i + et + st) - 1;
                if (i == '') i = pc;
                draw_set_color(real(i));
                dp = p + 1;
            } else if (p + string_length(st) <= l && string_copy(str, p, string_length(ct)) == ct) {
                ds  = string_copy(str, dp, p - dp);
                draw_text(dx, dy, ds);
                draw_set_color(pc);
                p += string_length(ct) - 1;
                dp = p + 1;
                dx += string_width(ds);
            }
        }
    }
    draw_set_color(pc);
}
