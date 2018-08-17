/* move_turn_helper(target_dir, precision, max_offset, parent_solid,
 *                  conditional_collisions)
 *
 * Attempts to rotate the instance, offsetting its position if necessary.
 * Returns whether rotational motion was successful.
 */
var max_offset, target_dir, old_dir, old_x, old_y, mag, min_mag, max_mag, free,
    best_mag, best_dir, best_deg, directions, success, precision, dir_inc, i,
    par_sol;
old_dir = image_angle;
old_x = x;
old_y = y;
image_angle = argument0;
precision = argument1;
max_offset = argument2;
par_sol = argument3;
cond_col = argument4;
dir_inc = 360 / precision;
if (place_free_cust(x, y, par_sol, cond_col))
  return true; // no collision to resolve
min_mag = 0;
max_mag = max_offset;
best_mag = -1;
best_dir = -1;
// Set up list of possible directions for the offset vector
directions = ds_list_create();
for (i = 0; i < precision; i += 1)
  ds_list_add(directions, i);
ds_list_shuffle(directions);
while (max_mag - min_mag > 1 && ds_list_size(directions) > 1) {
  mag = (max_mag + min_mag) / 2;
  success = false;
  for (i = 0; i < ds_list_size(directions); i += 1) {
    dir = ds_list_find_value(directions, i);
    deg = dir * dir_inc;
    x = old_x + lengthdir_x(mag, deg);
    y = old_y + lengthdir_y(mag, deg);
    free[dir] = (place_free_cust(x, y, par_sol, cond_col) &&
                !collision_line(old_x, old_y, x, y, self, true, false));
    if (free[dir]) success = true;
  }
  if (success) {
    for (i = 0; i < ds_list_size(directions); i += 1) {
      dir = ds_list_find_value(directions, i);
      if (!free[dir]) {
        ds_list_delete(directions, i);
        i -= 1;
      }
    }
    max_mag = mag;
    best_mag = mag;
    best_dir = ds_list_find_value(directions, 0);
  }
  else
    min_mag = mag;
}
if (best_mag == -1) {
  x = old_x;
  y = old_y;
  image_angle = old_dir;
  return false;
}
else {
  best_deg = best_dir * dir_inc;
  x = old_x + lengthdir_x(best_mag, best_deg);
  y = old_y + lengthdir_y(best_mag, best_deg);
  return true;
}
