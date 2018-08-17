///distance_to_closest_player_fast(x, y)
var _x = argument0;
var _y = argument1;
var distance = distance_far;
var tempDistance = distance_far;
for (var i = 1; i <= max_players; i += 1) {
	tempDistance = distance_to_player_fast(i, _x, _y);
	if (tempDistance < distance) {
		distance = tempDistance;
	}
}

return distance;