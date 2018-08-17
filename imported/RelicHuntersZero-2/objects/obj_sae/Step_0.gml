///Talk when player is nearby

if instance_exists(class_player)
{
    var distToPlayer = point_distance(x,y-8,class_player.x,class_player.y);
    
    if (distToPlayer <= 300) && (!instance_exists(obj_sae_balloon))
    {
            myBalloon = instance_create_layer(x-22,y,"Interactive_Over",obj_sae_balloon);
            if (!image_xscale) myBalloon.x -= 50;
    }
}

