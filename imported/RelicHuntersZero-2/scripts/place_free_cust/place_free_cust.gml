/* place_free_cust(x, y, parent_solid, conditional_collisions)
 *
 * Behaves like place_free(x, y), but only checks descendants of par_solid,
 * and confirms collisions using the descendants' collision_script.
 */
// If using normal collision checking, just use place_meeting
if (!argument3)
  return !place_meeting(argument0, argument1, argument2);
// If there are no collisions, no need to do anything special
if (!place_meeting(argument0, argument1, argument2))
  return false;
// Otherwise, check for collisions by inspecting each solid individually...
var x_old, y_old;
x_old = x;
y_old = y;
x = argument0;
y = argument1;
parent_solid = argument2;
instance_deactivate_all(true);
instance_activate_region(bbox_left,
                         bbox_top,
                         bbox_right-bbox_left,
                         bbox_bottom-bbox_top,true);
/*
// This part seems to cause problems with android.
// Disabeling doesn't seem to effect the windows verson.
with (parent_solid) {
  if (place_meeting(x, y, other)) {
    if (script_execute(collision_script, other)) {
      other.x = x_old;
      other.y = y_old;
      return false;
    }
  }
}
*/
instance_activate_all();
other.x = x_old;
other.y = y_old;
return true;
