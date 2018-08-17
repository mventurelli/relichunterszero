///draw_circlebar(x,y,radius,thickness,angle,quality,surface,color,alpha);

var i, targetX, targetY, radius, thickness, angle, steps, surface, color, alpha;
  
targetX=argument0;
targetY=argument1;
radius=argument2;
thickness=argument3;
angle=argument4;
steps=argument5;
surface=argument6;
color=argument7;
alpha=argument8;

if (!surface_exists(surface)) surface = surface_create(radius*2,radius*2);

xx=surface_get_width(surface)/2;
yy=surface_get_height(surface)/2;
        
surface_set_target(surface);
            
    draw_clear_alpha(c_white,0);
    draw_set_color(c_white);
                
    draw_primitive_begin(pr_trianglefan);
    draw_vertex(xx, yy);
    for(i = 0; i <= steps; i += 1)
    {
        draw_vertex(xx + lengthdir_x(radius, (-angle * i / steps) ), yy + lengthdir_y(radius, (-angle * i / steps) ));
    }
    draw_primitive_end();
                
    draw_set_blend_mode(bm_subtract);
    draw_set_color(c_black);
    draw_circle( xx, yy , radius-thickness, false);
    draw_set_blend_mode(bm_normal);
            
surface_reset_target();

draw_surface_ext(surface, targetX-surface_get_width(surface)/2, targetY-surface_get_height(surface)/2, 1, 1, 0, color, alpha);
