event_inherited();

if (hp < 0)
{
    audio_play_exclusive(audio_emitter,false,1,sfx_debris1,sfx_debris2,sfx_debris3);
    
    //Spawn Halloween candy
    if (sprite == spr_pumpkin) {
        if (random(1) <= 0.12) {
            repeat(irandom_range(1,3)) instance_create_layer(x,y,"GUI",obj_pickup_candy);
            repeat(irandom_range(1,3)) instance_create_layer(x,y,"GUI",obj_pickup_candyLarge);
        }
    }
	
	instance_create_layer(x,y,"Interactive",breakObject);
        
    instance_destroy();
}

