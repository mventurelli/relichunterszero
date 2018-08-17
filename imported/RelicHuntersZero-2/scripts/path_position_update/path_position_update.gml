// path_position_update(path)
// Returns the current point on the path
// On the Create event of the caller object, put    path_point_current = 0;
path_number = path_get_number(argument0);
path_offset = 1;
var px, py;
for (i=0; i<path_number; i+=1)
    {
    px = path_get_point_x(argument0,i)
    py = path_get_point_y(argument0,i)
    if (x > px-path_offset && x < px+path_offset) && (y > py-path_offset && y < py+path_offset)
        {
        path_point_current = i;
        break;
        }
    }
