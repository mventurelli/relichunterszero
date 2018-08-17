///ds_grid_get_topmost(grid name);
//Returns the first actual instance id that can be find on the topmost, left-to-right of the grid

var myGrid = argument0;

var toReturn = -1;

for (var j=0; j<ds_grid_width(myGrid); j++)
{
    var candidate = ds_grid_get(myGrid,j,0);
    if (candidate) && instance_exists(candidate) 
    if (candidate.isSelected == false || candidate.allowMultipleSelection) 
    {
        toReturn = candidate.id; 
        break;
    }
}

return toReturn;
