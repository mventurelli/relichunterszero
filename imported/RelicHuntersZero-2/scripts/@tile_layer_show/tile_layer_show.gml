/// @description Shows all tiles at the indicated depth layer.
/// @param depth The depth of tiles which is to be shown.
/// @returns 

var __depth = argument0;

// Scan through all layers looking for tiles
var __layers = layer_get_all();
var __numlayers = array_length_1d(__layers);

var __i;
for(__i = 0; __i < __numlayers; __i++)
{
	if (layer_get_depth(__layers[__i]) != __depth)
		continue;
	
	var __els = layer_get_all_elements(__layers[__i]);
	var __numels = array_length_1d(__els);
	
	var __j;
	for(__j = 0; __j < __numels; __j++)
	{
		var __eltype = layer_get_element_type(__els[__j]);
		if (__eltype == layerelementtype_tile)
		{
			layer_tile_visible(__els[__j],true);			
		}
	}	
}