/// Updates the path-finding for all AI entities
mp_grid_clear_all(global.astar_grid);
mp_grid_add_instances(global.astar_grid,class_solid,false);
alarm[1] = path_refresh;

