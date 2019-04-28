/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

///Anti-Bug: Teleport If Inside Wall
if collision_point(x,y,obj_limit,false,true)
{
    //Middle of Boss Room
    x=mySpawnX;
    y=mySpawnY;
}