///Activation

if (activate)
{
    if (myItem != noone)
    {
        if (global.gameMode == gamemode_adventure)
        {
            var fxX, fxY;
            if (instance_exists(class_player))
            {
                var pp = instance_nearest(x,y,class_player);
                fxX = pp.x;
                fxY = pp.y;
            }
            else{
                fxX = x;
                fxY = y;
            }
            
            var effect = instance_create_layer(fxX,fxY,"GUI",fx_digItem);
            var relic = instance_create_layer(x,y,"GUI",myItem);
            
            effect.relic = myItem;
            effect.itemSprite = relic.sprite_index;
            with (relic) instance_destroy();
        }
        
        
        if (global.gameMode == gamemode_endless)
        {
            var oX, oY;
            if (instance_exists(class_player))
            {
                var pp = instance_nearest(x,y,class_player);
                oX = pp.x;
                oY = pp.y;
            }
            else{
                oX = x;
                oY = y;
            }
            audio_stop_all();
            instance_create_layer(oX,oY,"GUI",myItem);
            if (global.ambientSound) audio_play_sound(global.ambientSound,9,true);
        }
    }
    
    if (!global.totalDigs) achievement_give("ACHIEVEMENT_FIRSTDIG");
    
    global.totalDigs++;
    
    if (instance_exists(fx_bigMessage)) with (fx_bigMessage) instance_destroy();
    
    instance_destroy();
}

