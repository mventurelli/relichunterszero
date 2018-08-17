// path_update(path);
// Updates the current path for the instance. Requires a move_speed, and move_target_x and move_target_y
if (ai_movetarget_x > 0) && (ai_movetarget_y > 0)
{
    path_end();
    ai_movetarget_x = round(ai_movetarget_x);
    ai_movetarget_y = round(ai_movetarget_y);
    var pathCandidate = mp_grid_path(global.astar_grid,ai_path,x,y,ai_movetarget_x,ai_movetarget_y,true);
    if (pathCandidate) path_start(ai_path,move_speed,0,false);
}
else path_end();
