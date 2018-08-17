///Fade In, Wait, Then Fade Out and Die

alphaSpeedIn = 1/fadeInDuration;
alphaSpeedOut = 1/fadeOutDuration;

switch (alphaOrientation)
{
    case "in":
    {
        image_alpha += alphaSpeedIn * delta_time;
        if (image_alpha >= 1) alphaOrientation = "still";
        break;
    }
       
    case "still":
    {
        stillTimeCurrent += delta_time;
        if (stillTimeCurrent >= stillDuration) alphaOrientation = "out";
        break;
    }
    
    case "out":
    {
        image_alpha -= alphaSpeedOut * delta_time;
        if (image_alpha < 0) instance_destroy();
        break;
    }    
}

