/// @description Reads from the collision tile layer and creates data structure, returns data structure's ID

	/*
	Should be run on room start;
	*/
	
// Read tile layer
var _layer = layer_get_id("CollisionLayer");
if (_layer != -1)
{
	var _map = layer_tilemap_get_id(_layer);
	var _mapWidth = tilemap_get_width(_map);
	var _mapHeigth = tilemap_get_height(_map);
}
else
{
	show_debug_message("ERROR: Unable to find 'CollisionLayer' on current room");
	return (-1);
}

// Create data structure
var _collisionGrid = ds_grid_create(_mapWidth,_mapHeigth);
ds_grid_clear(_collisionGrid,0);

//Fill data structure with tile layer information
for (var i=0; i<tilemap_get_width(_map); i++)
{
	for (var j=0; j<tilemap_get_height(_map); j++)
    {
		var _data = tilemap_get(_map, i, j);
		if !tile_get_empty(_data)
		{
			ds_grid_set(_collisionGrid,i,j,1);
		}
    }
}

return _collisionGrid;
