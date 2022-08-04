
if not instance_exists(parent)
{
	exit
}

fov = parent.light.fov
color = parent.light.color
size = parent.size
dir = parent.light.dir

x = parent.x+lengthdir_x(7, dir)
y = parent.y+lengthdir_y(7, dir)