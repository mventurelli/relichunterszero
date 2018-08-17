/* move_forward(speed, direction, precision, parent_solid,
 *              conditional_collisions)
 *
 * This script handles forward/backward motion.
 */
var spe, dir, precision, par_sol, cond_col, spr_w, spr_h, loop1, loops2,
    max_dist, dir_inc;
spe = argument0;
dir = argument1;
precision = argument2;
par_sol = argument3;
cond_col = argument4;
spr_w = bbox_bottom - bbox_top;
spr_h = bbox_right - bbox_left;
max_dist = min(spr_w, spr_h) / 4;
dir_inc = 360 / precision;
if spe != 0 {
  var xold, yold, new_spe, new_spe2, dir_offset, dir1, dir2, i2, xtar1, ytar1,
      xtar, ytar2, xorig, yorig;
  loops1 = ceil(abs(spe) / max_dist);
  loops2 = floor((precision + 3) / 4);
  xorig = x;
  yorig = y;
  repeat (loops1) {
    xold = x;
    yold = y;
    new_spe = min(spe, max_dist);
    spe -= new_spe;
    for (i2 = 0; i2 < loops2; i2 += 1) {
      dir_offset = i2 * dir_inc;
      new_spe2 = new_spe;
      new_spe2 *= 1 - (dir_offset / 90); // Slow down when set off course
      dir1 = dir + dir_offset;
      xtar1 = x + lengthdir_x(new_spe2, dir1);
      ytar1 = y + lengthdir_y(new_spe2, dir1);
      if i2 > 0 {
        dir2 = dir - dir_offset;
        xtar2 = x + lengthdir_x(new_spe2, dir2);
        ytar2 = y + lengthdir_y(new_spe2, dir2);
      }
      if place_free_cust(xtar1, ytar1, par_sol, cond_col) {
        x = xtar1;
        y = ytar1;
        break;
      }
      else if i2 > 0 {
        if place_free_cust(xtar2, ytar2, par_sol, cond_col) {
          x = xtar2;
          y = ytar2;
          break;
        }
      }
    }
  }
  if (x == xorig && y == yorig)
    return false; // failed to move at all
}
return true;
