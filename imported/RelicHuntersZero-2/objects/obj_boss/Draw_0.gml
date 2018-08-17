draw_self();

//Placeholder Generator Feedback
myGenerator = -1;

if (instance_exists(obj_generator1)) if (obj_generator1.isVulnerable) myGenerator = obj_generator1;
if (instance_exists(obj_generator2)) if (obj_generator2.isVulnerable) myGenerator = obj_generator2;
if (instance_exists(obj_generator3)) if (obj_generator3.isVulnerable) myGenerator = obj_generator3;

if (myGenerator != -1)
{
    if (instance_exists(myGenerator)) 
    {
		myGeneratorBBoxCenter = get_bbox_center(myGenerator);
        draw_set_alpha(0.6);
        draw_line_width_colour(x,y,myGeneratorBBoxCenter[0],myGeneratorBBoxCenter[1],3,c_blue,c_blue);
        draw_set_alpha(1);
    }
}

//Pause Animation
old_image_speed = image_speed;
if (global.pause)
{
    image_speed = 0;
    path_end();
}
else image_speed = old_image_speed;

