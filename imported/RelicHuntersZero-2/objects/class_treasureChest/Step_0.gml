///Open

event_inherited();

if (!canActivate) {
    if (activateTimeCurrent < activateTime) activateTimeCurrent += delta_time;
    else canActivate = true;
}

if (activationClient != noone) && (canActivate)
{
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;

    if (wantToActivate) && (in_range)
    {
        unlock = true;
    }
}

