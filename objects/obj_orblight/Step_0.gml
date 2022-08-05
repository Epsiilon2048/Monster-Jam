
if not instance_exists(parent)
{
	instance_destroy()
	on = false
	exit
}

color = color_add_hsv(color, 1.5)
size = 40 + 10*sin(step/13)
step ++