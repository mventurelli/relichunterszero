///ds_grid_get_below(grid,x,y)
// Returns the best possible value below the indicated coordinates, or return -1

var myGrid = argument0;
var myX = argument1;
var myY = argument2;

var toReturn = -1;
var candidate = noone;


if (ds_exists(myGrid,ds_type_grid))
{
    //Go straight down
    for (var i=myY+1; i<ds_grid_height(myGrid); i++)
    {
        candidate = ds_grid_get(myGrid,myX,i);
        if (candidate) && (instance_exists(candidate))
        {
            if (candidate.isSelected == false || candidate.allowMultipleSelection) 
            {
                toReturn = candidate.id; 
                break;
            }
        }
    }
    
    //If still didnt find anyone, check all the width by moving like a pendulum on the row
    if (toReturn == -1)
    {
        for (var j=1; j<=ds_grid_width(myGrid); j++)
        {
            candidate = ds_grid_get(myGrid, myX - j, myY+1);  
            if (candidate) && (instance_exists(candidate))
            {
                if (candidate.isSelected == false || candidate.allowMultipleSelection) 
                {
                    toReturn = candidate.id; 
                    break;
                }
            }
            
            candidate = ds_grid_get(myGrid, myX + j, myY+1);  
            if (candidate) && (instance_exists(candidate))
            {
                if (candidate.isSelected == false || candidate.allowMultipleSelection) 
                {
                    toReturn = candidate.id; 
                    break;
                }
            }  
        }  
    }
    
    //If still didnt find anyone, get the very own coordinates
    if (toReturn == -1)
    {
        candidate = ds_grid_get(myGrid,myX,myY);
        if (candidate) && (instance_exists(candidate))
        {
            toReturn = candidate.id;
        }
    }
}
else show_debug_message("Tried to run ds_grid_get_below but the provided Grid ID was invalid");

//End
return toReturn;
