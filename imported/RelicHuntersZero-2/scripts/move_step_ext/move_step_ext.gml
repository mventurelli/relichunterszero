/* move_step_ext(target_x, target_y, rotational_speed, parent_solid,
 *               [precision], [max_offset], [dir_buffer], [min_turn],
 *               [conditional_cols], [memoize])
 *
 * This script handles both forward/backward motion and rotational motion.
 * It should be called once per step for each object using the motion engine.
 *
 * target_x, *_y: the position to which the object should attempt to move
 *                IN THIS STEP (not a long-term target position).
 *
 * rotational_speed: the speed of rotation (in degrees per step). Positive
 *                   values correspond to CCW motion, negative CW.
 *
 * parent_solid: the parent object from which all surfaces descend.
 *
 * precision: an optional argument which influences the scanner's performance.
 *            Higher precision means smoother motion, but also extra
 *            processing. Increasing this value yields diminishing utility, so
 *            don't get carried away!
 *
 * max_offset: an optional argument which dictates how far (in pixels) the unit
 *             is willing to jump in order to allow rotation (when there are
 *             collisions involved).
 *
 * dir_buffer: the (optional) angular buffer to apply to rotational collisions.
 *             A value around 1 is generally appropriate, but if you find your
 *             objects getting stuck while traveling between two solids, you
 *             may want to increase it.
 *
 * min_turn: the (optional) minimum angular offset involved in rotation. There
 *           are some scenarios in which the object is able to rotate slightly,
 *           but having it do so would be undesirable as it would cause the
 *           object to jump a significant distance. This minimum argument is
 *           intended to prevent this.
 *
 * conditional_cols: whether to use conditional collisions. If true,
 *                   descendants of par_solid can define a collision_script
 *                   variable to be used in collision checking. If the script
 *                   returns true, the collision will be recognized as normal;
 *                   if it returns false, the collision will be ignored. This
 *                   may be useful for implementing height-dependencies and
 *                   the like. Note that enabling this option creates a
 *                   significant speed reduction.
 *
 * memoize: whether the system should remember the latest failed rotation. If
 *          enabled, the scripts will later check if the conditions are
 *          identical to the conditions of the latest failure, and, if so,
 *          they will fail automatically, preventing redundant computation.
 *          This option can significant help prevent slowdowns, but may cause
 *          problems if there are dynamic solids (such as moving blocks). The
 *          option is enabled by default.
 *
 * Returns whether there was some success (any motion counts, including
 * rotation). If no change in position was attempted (i.e., the target
 * position and the current position are identical), returns true.
 */
var target_x, target_y, rot_speed, par_sol, precision, max_offset,
    dir_buffer, min_turn, cond_col, memoize;
// Read arguments
target_x   = argument0;
target_y   = argument1;
rot_speed  = argument2;
par_sol    = argument3;
precision  = argument4;
max_offset = argument5;
dir_buffer = argument6;
min_turn   = argument7;
cond_col   = argument8;
memoize    = argument9;
// Defaults
if (precision  == 0) precision  = 32;
if (max_offset == 0) max_offset = 4;
if (dir_buffer == 0) dir_buffer = 1;
if (min_turn   == 0) min_turn   = 1.5;
if (cond_col   == 0) cond_col   = false;
if (memoize    == 0) memoize    = true;
// Move forward and then rotate
return (move_forward(point_distance(x, y, target_x, target_y),
                     point_direction(x, y, target_x, target_y),
                     precision,
                     par_sol,
                     cond_col)
        or
        move_turn(rot_speed,
                  precision,
                  max_offset,
                  dir_buffer,
                  min_turn,
                  par_sol,
                  cond_col, memoize));
