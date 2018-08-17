///distance_to_player_fast(playerIndex, x, y)
var p = argument0;
var distance = distance_far;
if (global.playerAlive[p] == true)
{
	distance = point_distance(global.characterPos[p,0], global.characterPos[p,1], argument1, argument2);
}
return distance;
