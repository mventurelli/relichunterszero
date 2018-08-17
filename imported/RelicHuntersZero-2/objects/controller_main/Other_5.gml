
///end of room cleanup

//free surfaces
if (surface_exists(guiSurface)) surface_free(guiSurface);
if (surface_exists(reloadBarSurface)) surface_free(reloadBarSurface);
if (surface_exists(reloadBarSurface2)) surface_free(reloadBarSurface2);

//destroy grids
mp_grid_destroy(global.astar_grid);


/*
save_and_clean();
*/
