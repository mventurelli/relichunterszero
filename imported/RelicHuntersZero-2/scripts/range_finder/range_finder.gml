///range_finder(x,y,dir,range,object,prec,notme)
/*
 **  Usage:
 **      range_finder(x,y,dir,range,object,prec,notme)
 **
 **  Given:
 **      x,y         position in room
 **      dir         direction to look in degrees
 **      range       the greatest distance to look in pixels
 **      object      which objects to look for, or keyword all
 **      prec        if true, use precise collision checking
 **      notme       if true, ignore the calling instance
 **
 **  Returns:
 **      exact distance to the nearest instance of given (object)
 **      in direction (dir) from the given point (x,y),
 **      or (-1) if no instance is found.
 **
 **  Notes:
 **      Computes the answer in log2(range) collision checks
 **
 **  GMLscripts.com
 */
 {
     var ox,oy,dir,range,object,prec,notme,dx,dy,sx,sy,distance;
     ox = argument0;
     oy = argument1;
     dir = argument2;
     range = argument3;
     object = argument4;
     prec = argument5;
     notme = argument6;
     sx = lengthdir_x(range,dir);
     sy = lengthdir_y(range,dir);
     dx = ox + sx;
     dy = oy + sy;
     if (collision_line(ox,oy,dx,dy,object,prec,notme) < 0) {
         distance = -1;
     }else{
         while ((abs(sx) >= 1) || (abs(sy) >= 1)) {
             sx /= 2;
             sy /= 2;
             if (collision_line(ox,oy,dx,dy,object,prec,notme) < 0) {
                 dx += sx;
                 dy += sy;
             }else{
                 dx -= sx;
                 dy -= sy;
             }
         }
         distance = point_distance(ox,oy,dx,dy);
     }
     return distance;
 }
