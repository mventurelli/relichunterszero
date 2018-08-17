///Main
duration = 2000000;
duration_current = 0;
value = 0;
myX = display_get_width()*0.5;
myY = display_get_height()*0.23;

headshot = false;
coin = false;

//Animation
size_start = 0.5;
size_max = 1.75;
size_end = 1;
size_accel_up = 0.06;
size_accel_down = 0.04;
size_friction = 0.02;
size_speed_up = 0.15;
size_speed_down = 0.1;
size_speed_current = 0;

orientation = 0; //0=growth, 1=shrink, 2=stable
size_current = size_start;
kill_count = 0;

/*
while (instance_number(gui_score) > 1) 
{
    other_gui = instance_find(gui_score,0);
    if instance_exists(other_gui) && (other_gui != id)
    {
        previous_value = other_gui.value;
        kill_count+= other_gui.kill_count;
        with (other_gui) instance_destroy();
    }
    else {
        other_gui = instance_find(gui_score,1);
        if instance_exists(other_gui) && (other_gui != id)
        {
        previous_value = other_gui.value;
        kill_count+= other_gui.kill_count;
        with (other_gui) instance_destroy();
        }
    }
}
*/
/*var testScores = instance_number(gui_score);
if (testScores > 1)
{
    for (i=0; i<testScores; i++)
    {
        other_gui = instance_find(gui_score,i);
        if instance_exists(other_gui) && (other_gui != id)
        {
            previous_value = other_gui.value;
            kill_count+= other_gui.kill_count;
            with (other_gui) instance_destroy();
        }
    }
}*/

myString = "";
setup = false;
showScore = false;
