event_inherited();

myMap = global.inputSprint2;

//It's horrible but it's 3 am, do not judge me
if (myMap == mb_left) labelString = "LEFT MOUSE";
else if (myMap == mb_right) labelString = "RIGHT MOUSE";
else if (myMap == mb_middle) labelString = "MIDDLE MOUSE";       
else if (myMap == vk_left) labelString = "LEFT ARROW";
else if (myMap == vk_right) labelString = "RIGHT ARROW";
else if (myMap == vk_up) labelString =  "UP ARROW";
else if (myMap == vk_down) labelString = "DOWN ARROW"; 
else if (myMap == vk_enter) labelString = "ENTER";
else if (myMap == vk_shift) labelString = "SHIFT";
else if (myMap == vk_control) labelString = "CTRL";
else if (myMap == vk_alt) labelString = "ALT";
else if (myMap == vk_space) labelString = "SPACEBAR";
else if (myMap == vk_backspace) labelString = "BACKSPACE";
else if (myMap == vk_tab) labelString = "TAB";
else if (myMap == vk_home) labelString = "HOME";
else if (myMap == vk_end) labelString = "END";
else if (myMap == vk_delete) labelString = "DELETE";
else if (myMap == vk_insert) labelString = "INSERT";
else if (myMap == vk_pageup) labelString = "PAGE UP";
else if (myMap == vk_pagedown) labelString = "PAGE DOWN";
else labelString = chr(myMap);

