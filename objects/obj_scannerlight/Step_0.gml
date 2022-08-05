
if not instance_exists(parent)
{
	instance_destroy()
	exit
}

dir = parent.direction
x = parent.x+lengthdir_x(3, dir)
y = parent.y+lengthdir_y(3, dir)