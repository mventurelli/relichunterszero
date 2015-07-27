///draw_circlebar(x,y);

var i, steps, xx, yy, radius;
 steps=20;
 xx=argument0;
 yy=argument1;
 radius=30;
 draw_primitive_begin(pr_trianglefan);
 draw_vertex(xx, yy);
 for(i = 0; i <= steps; i += 1)
    {
    draw_vertex(xx + lengthdir_x(radius, 270 * i / steps), yy + lengthdir_y(radius, 270 * i / steps));
    }
 draw_primitive_end();
