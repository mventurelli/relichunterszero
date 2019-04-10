/// @description Follow Camera
var finalOffsetX = offsetX*camera_get_view_width(view_camera[0]);
var finalOffsetY = offsetY*camera_get_view_height(view_camera[0]);

x = camera_get_view_x(view_camera[0]) + finalOffsetX;
y = camera_get_view_y(view_camera[0]) + finalOffsetY;