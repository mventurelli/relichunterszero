// 
frame = argument[0];

switch (frame)
{
   case "highlight":
	 image_index = 1;
     break;
   case "white":
	 image_index = 2;
     break;
   case "default":
   default:
     image_index = 0;
     break;
}
image_speed = 0;