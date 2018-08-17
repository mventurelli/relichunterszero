///range_convert(minrange1,maxrange1,minrange2,maxrange2,value)
//Converts and interpolates value from (minrange1,maxrange1) to (minrange2,maxrange2).
//Got this from user Spikehead777 at http://gmc.yoyogames.com/index.php?showtopic=519248

var value,minrange1,maxrange1,minrange2,maxrange2,dec;

minrange1 = argument0;
maxrange1 = argument1;
minrange2 = argument2;
maxrange2 = argument3;
value = argument4;

dec = (value-minrange1)/(maxrange1-minrange1);
return dec*(maxrange2-minrange2)+minrange2;
