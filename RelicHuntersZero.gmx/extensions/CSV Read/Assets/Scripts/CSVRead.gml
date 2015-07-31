////ReadCSV(file);
//Created by Arrogant Pixel
//Reads a csv from the working directory (Included Files)
//returns data in 1d array containing the database, width & height.
//Ideally you should use a temp var to store the information and then read it into
//a grid via the ds_grid_read function
/*
    eg
    var data = CSVRead("MyCsvFile");
    myGrid = ds_grid_create(myGrid,data[1],data[2]);
    ds_grid_read(myGrid,data[0]);
*/

var csv = argument0; //file name
var data;
var file = file_text_open_read(working_directory+"/"+string(csv)+".csv");

var str = file_text_readln(file);

//show_message("adasdasd"+string(str));
file_text_close(file);

var charCount = string_length(str);
var returnCount = 0;

var col = 0;
var row = 0;
setString = "";
var maxCol = 0;

var g = ds_grid_create(50,50);

for(var i=1;i<charCount;i++){
    var char = string_char_at(str,i);
    if(char == chr(13)){
        ds_grid_set(g,col,row,setString);
        col = 0;
        row ++;
        setString = "";
    }else if(char != ","){
        setString += char;
    }
    if(char == ","){
        ds_grid_set(g,col,row,setString);
        col++;
        maxCol = col;
        setString = "";
    }
    
    if(col > maxCol && row > 0){
        maxCol = col+1;
        ds_grid_resize(g,maxCol+10,row+10);
    }
}


var str;
str[0] = ds_grid_write(g);
str[1] = maxCol;
str[2] = row;

ds_grid_destroy(g);


return str;
