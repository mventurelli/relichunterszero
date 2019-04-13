///Target Search + Adjustment

event_inherited();

var myTargetType = -1;
var isEnemy = true;

if (faction == f_enemy) myTargetType = class_player;
else if (faction == f_player)
{
    myTargetType = class_enemy;
    isEnemy = false;
}

weapon_homing_update(myTargetType,isEnemy);