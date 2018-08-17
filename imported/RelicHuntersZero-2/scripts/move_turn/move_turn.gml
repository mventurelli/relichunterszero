/* move_turn(rotational_speed, precision, max_offset, dir_buffer, min_turn,
 *           parent_solid, cond_col, memoize)
 *
 * Attempts to rotate the instance, offsetting its position if necessary. This
 * script will attempt to leave an angular buffer between the object and any
 * solids so as to not interfere with forward/backward motion.
 *
 * Returns whether rotational motion was successful.
 */
var dir_offset;
dir_offset = argument0;
if (dir_offset != 0) {
  var precision, max_offset, dir_buffer, x_old, y_old, dir_old, dir_orig,
      min_turn, par_sol, memoize, fail;
  precision  = argument1;
  max_offset = argument2;
  dir_buffer = argument3;
  par_sol    = argument5;
  cond_col   = argument6;
  memoize    = argument7;
  dir_orig = image_angle;
  // If these conditions have been memoized, then auto-fail
    //if (memoize && variable_local_exists("mem_x")) {
    if (memoize) {
    if (mem_x == x &&
        mem_y == y &&
        mem_dir == image_angle &&
        mem_dir_offset == argument0) {
      if (mem_precision == precision &&
          mem_max_offset == max_offset &&
          mem_dir_buffer == dir_buffer &&
          mem_min_turn == argument4 &&
          mem_par_sol == par_sol &&
          mem_cond_col == cond_col)
        return false; // auto-fail
    }
  }
  min_turn = min(argument4, abs(dir_offset))
  fail = true;
  while (abs(dir_offset) > min_turn) {
    if move_turn_helper(image_angle + dir_offset,
                        precision,
                        max_offset,
                        par_sol,
                        cond_col) {
      fail = false;
      break;
    }
    dir_offset /= 2;
  }
  if (fail) {
    // Memoize this failure scenario to prevent redundant computation
    if (memoize) {
      mem_x = x;
      mem_y = y;
      mem_dir = image_angle;
      mem_dir_offset = argument0;
      mem_precision = precision;
      mem_max_offset = max_offset;
      mem_dir_buffer = dir_buffer;
      mem_min_turn = argument4;
      mem_par_sol = par_sol;
      mem_cond_col = cond_col;
    }
    return false;
  }
  x_old = x;
  y_old = y;
  dir_old = image_angle;
  image_angle -= sign(dir_offset) * min(dir_buffer, abs(image_angle-dir_orig));
  if (!place_free_cust(x, y, par_sol, cond_col)) {
    x = x_old;
    y = y_old;
    image_angle = dir_old;
  }
}
return true;
