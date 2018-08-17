///Create Kamis

if (floor(image_index) == spawnFrame) && (!hasSpawned) 
{
    repeat(spawnAmount)
    {    
        var hasFreeSpace = false;
        var c = 0;
        
        while ( (!hasFreeSpace) && (c < 100) )
        {
            spawnX = x + irandom_range(-64,64) + 64;
            spawnY = y + irandom_range(-64,64) + 64;
          
            if (collision_point(spawnX,spawnY,obj_limit,false,true) < 0) hasFreeSpace = true;
            
            c++;
        }
        
        instance_create_layer(spawnX,spawnY,"Interactive",obj_kamiAlly);
    }   
    
    hasSpawned = true;
}

