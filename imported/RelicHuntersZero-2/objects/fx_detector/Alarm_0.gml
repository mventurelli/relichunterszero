///Create child if possible, create arrow
if (allowChild)
{
    var child = instance_create_layer(x,y,"Interactive",fx_detector);
    if (!instance_exists(fx_detectorArrow)) var arrow = instance_create_layer(x,y,"Interactive",fx_detectorArrow);
    
    child.allowChild = false;
}

