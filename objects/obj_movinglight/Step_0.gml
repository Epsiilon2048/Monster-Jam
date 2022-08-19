
var dist = point_distance(x, y, mouse_x, mouse_y)
if dist > 20
{
	speed = (dist-20)/20
}
else speed = 0

dir = point_direction(x, y, mouse_x, mouse_y)
direction = dir

if keyboard_check_pressed(ord("F")) on = not on