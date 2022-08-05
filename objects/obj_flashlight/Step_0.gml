
if not instance_exists(parent)
{
	exit
}

on = parent.flashlight

if on
{
	fov = parent.light_fov
	color = parent.light_color
	size = parent.light_size
	dir = parent.light_dir

	x = parent.x+lengthdir_x(7, dir)
	y = parent.y+lengthdir_y(7, dir)
}