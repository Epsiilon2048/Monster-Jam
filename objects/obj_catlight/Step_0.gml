
if not instance_exists(obj_cat)
{
	instance_destroy()
	exit
}

//x = cam_x+cam_width/2
//y = cam_y+cam_height/2

x = obj_cat.x
y = obj_cat.y

if obj_cat.catvision
{
	fov = 360
}
else
{
	fov = 0
}