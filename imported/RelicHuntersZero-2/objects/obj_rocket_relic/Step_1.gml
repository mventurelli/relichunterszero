///Spawn mini-rockets before exploding
if (explode)
{
    var spawnAngle = 0;
    repeat(4)
    {
        child = instance_create_layer(x,y,"Interactive",obj_rocket_homing);
        child.immortalTimer = 500000;
        child.image_xscale = 0.5;
        child.image_yscale = 0.5;
        
        child.faction = faction;
        child.damage = 120;
        
        child.curveRatio = 6;
        child.curveRatioDecay = 0.016;
        
        child.direction = spawnAngle;
        spawnAngle += 90;
    }
}

