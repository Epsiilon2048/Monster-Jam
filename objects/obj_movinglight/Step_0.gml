
var dist = point_distance(x, y, mouse_x, mouse_y)
if dist > 10
{
	speed = (dist-10)/10
}
else speed = 0

dir = point_direction(x, y, mouse_x, mouse_y)
direction = dir