///draw_text_special(x,y,text,font,color,vspace,width,fullalign,iconsprite,mode,halign,valign);
/*
script by vdweller (http://gmc.yoyogames.com/index.php?showtopic=609737)

argument0=x
argument1=y
argument2=text
argument3=font
argument4=color
argument5=vertical spacing (-1 default)
argument6=max width (-1 default)
argument7=full align
argument8=icon sprite resource (-1 for none)
argument9: 0= draw text, 1= return text width, 2= return text height
argument10: 0= align text left, 1= align text center, 2= align text right
argument11: 0= align text top, 1= align text middle, 2= align text bottom

special characters:
\sym{x} draw a symbol of a symbol spriteset (argument8) with subimage x
\col{R,G,B}text/ changes color to RGB value for text
*/

var list_char;list_char=ds_list_create();
var list_line;list_line=ds_list_create(); //list members are other lists containing the line's characters
var list_alignmentapplies;list_alignmentapplies=ds_list_create();
var list_linewidth;list_linewidth=ds_list_create();
var i,j,k,m,p,t,z,c,a,changeline;
var cred,cgreen,cblue;
var numspaces;
var forcealign;
var symbolsize;
var txtwidth;txtwidth=argument6;
if argument6=-1 then txtwidth=99999;
var tspac;tspac=argument5;
var wordspace;
var spacewidth;
var diesiwidth;
var offx,offy;

draw_set_font(argument3);
symbolsize=string_height("0");
if argument5=-1 then tspac=symbolsize;
spacewidth=string_width(" ");
diesiwidth=string_width("\#");
//insert all chars into the list and transform symbols
i=0;
do
{
i+=1;
k=0;
if string_char_at(argument2,i)="\" then
{
    //if i<string_length(argument2)-5 then
    //{
    if string_copy(argument2,i,5)="\sym{" then
    {
    i+=5;j=i;do j+=1 until string_char_at(argument2,j)="}";
    ds_list_add(list_char,"sym"+string_copy(argument2,i,j-i));
    i=j;k=1; //special symbol found
    }
    
    if string_copy(argument2,i,5)="\col{" then
    {
    i+=5;j=i;do j+=1 until string_char_at(argument2,j)="}";
    ds_list_add(list_char,"col"+string_copy(argument2,i,j-i));
    i=j+1;
    j=i;do {ds_list_add(list_char,string_char_at(argument2,j));j+=1} until string_char_at(argument2,j)="/";
    ds_list_add(list_char,"col"+string(color_get_red(argument4))+","+string(color_get_green(argument4))+","+string(color_get_blue(argument4)));
    i=j;k=1; //special symbol found
    }
    
    if string_copy(argument2,i,2)="\#" then
    {
    i+=1;
    ds_list_add(list_char,"pr#");
    k=1; //special symbol found
    }
    //}
}
if k=0 then ds_list_add(list_char,string_char_at(argument2,i));
}
until i=string_length(argument2);

//create lines
i=-1;
t=-1; //tracks start of line relative to list_char
j=0; //text width
changeline=0; //if line changes then it is set to 1
do
{
i+=1;
k=ds_list_find_value(list_char,i);
if string_length(k)=1 then j+=string_width(k) else {if string_copy(k,1,3)="sym" then j+=symbolsize;if string_copy(k,1,3)="pr#" then j+=diesiwidth;}

if k<>"#" then
{
    if j>=txtwidth then
    {
    changeline=1;forcealign=argument7;
    i+=1;m=j;do
    {
    i+=-1;
    z=ds_list_find_value(list_char,i);
    if string_length(z)=1 then m+=-string_width(z) else {if string_copy(k,1,3)="sym" then m+=-symbolsize;if string_copy(k,1,3)="pr#" then m+=-diesiwidth;}
    }
    until ds_list_find_value(list_char,i)=" ";
    ds_list_add(list_linewidth,m);
    }
}
else
{
    changeline=1;forcealign=false;ds_list_add(list_linewidth,j);
}   

    if changeline=1 then //line change
    {
    j=0; //text width resets to 0
    changeline=0; //line change resets to 0
    p=ds_list_create();
    ds_list_add(list_line,p);
    ds_list_add(list_alignmentapplies,forcealign);
        repeat i-t
        {
        t+=1;
        ds_list_add(p,ds_list_find_value(list_char,t));
        }
    }
}
until i=ds_list_size(list_char)-1;

//add last line
p=ds_list_create();
ds_list_add(list_line,p);
ds_list_add(list_alignmentapplies,false);
repeat i-t+1
{
t+=1;
ds_list_add(p,ds_list_find_value(list_char,t));
}
ds_list_add(list_linewidth,j);

switch argument9
{
case 0: //draw text normally
{

break;
}

case 1: //return width
{
ds_list_sort(list_linewidth,0);
j=ds_list_find_value(list_linewidth,0);

ds_list_destroy(list_char);
i=-1;
repeat ds_list_size(list_line)
{
i+=1;
ds_list_destroy((ds_list_find_value(list_line,i)));
}
ds_list_destroy(list_line);
ds_list_destroy(list_alignmentapplies);
ds_list_destroy(list_linewidth);
return j;
break;
}

case 2:  //return height
{
j=ds_list_size(list_line)*tspac;

ds_list_destroy(list_char);
i=-1;
repeat ds_list_size(list_line)
{
i+=1;
ds_list_destroy((ds_list_find_value(list_line,i)));
}
ds_list_destroy(list_line);
ds_list_destroy(list_alignmentapplies);
ds_list_destroy(list_linewidth);
return j;
break;
}
}

//draw text
draw_set_color(argument4);
i=-1;
repeat ds_list_size(list_line)
{
i+=1;
j=-1;
k=0;
a=0; //because wordspace=floor((txtwidth-c)/numspaces),due to the floor() some space will be lost. 'a' stores that extra space.
p=ds_list_find_value(list_line,i);
wordspace=spacewidth;
switch argument10
{
case 0:{offx=0;break;}
case 1:{offx=-round(ds_list_find_value(list_linewidth,i)/2);break;}
case 2:{offx=-ds_list_find_value(list_linewidth,i);break;}
}

switch argument11
{
case 0:{offy=0;break;}
case 1:{offy=-round(0.5*ds_list_size(list_line)*tspac);break;}
case 2:{offy=-ds_list_size(list_line)*tspac;break;}
}

if argument7=1 then //find number of spaces in line
{
if ds_list_size(list_line)>1 then
{
if ds_list_find_value(list_alignmentapplies,i)=true then
{
numspaces=0;t=-1;c=0;
repeat ds_list_size(p)-1
{
t+=1;
m=ds_list_find_value(p,t);
if string_length(m)=1 then {if m<>" " then c+=string_width(m) else numspaces+=1;} else {if string_copy(m,1,3)="sym" then c+=symbolsize;if string_copy(m,1,3)="pr#" then c+=diesiwidth;}
}
if numspaces>0 then
{
wordspace=floor((txtwidth-c)/numspaces);
a=txtwidth-c-numspaces*wordspace;
}
}
}
switch argument10
{
case 0:{offx=0;break;}
case 1:{offx=-round((argument6)/2);break;}
case 2:{offx=-argument6;break;}
}
}

    repeat ds_list_size(p)
    {
    j+=1;
    m=ds_list_find_value(p,j);
        if string_length(m)=1 then
        {
        draw_text(argument0+k+offx,argument1+offy+tspac*i,m);
        if m=" " then {k+=wordspace;if a>0 then {a+=-1;k+=1;}} else k+=string_width(m);
        }
        else
        {
            if string_copy(m,1,3)="col" then
            {
            t=3;z=3;do z+=1 until string_char_at(m,z)=",";cred=string_copy(m,t+1,z-t-1);z+=1;t=z;
            do z+=1 until string_char_at(m,z)=",";cgreen=string_copy(m,t,z-t);t=z;
            cblue=string_copy(m,t+1,string_length(m)-z);
            draw_set_color(make_color_rgb(real(cred),real(cgreen),real(cblue)));
            }
            
            if string_copy(m,1,3)="sym" then
            {
            draw_sprite_ext(argument8,real(string_digits(m)),argument0+k+offx+symbolsize/2,argument1+offy+tspac*i+(symbolsize/2),symbolsize/sprite_get_width(argument8),symbolsize/sprite_get_width(argument8),0,c_white,1);
            k+=symbolsize;
            }
            
            if string_copy(m,1,3)="pr#" then
            {
            draw_text(argument0+k+offx,argument1+offy+tspac*i,"\#");
            k+=diesiwidth;
            }
        }
    }
}

ds_list_destroy(list_char);
i=-1;
repeat ds_list_size(list_line)
{
    i+=1;
    ds_list_destroy((ds_list_find_value(list_line,i)));
}
ds_list_destroy(list_line);
ds_list_destroy(list_alignmentapplies);
ds_list_destroy(list_linewidth);
