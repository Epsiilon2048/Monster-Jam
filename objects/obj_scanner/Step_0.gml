
if not rollback_game_running exit

direction += SPD
light.dir = direction

light.x = x+lengthdir_x(2, direction)
light.y = y+lengthdir_y(2, direction)

var x2 = x+lengthdir_x(SIGNAL_RANGE, light.dir-light.fov/2)
var y2 = y+lengthdir_y(SIGNAL_RANGE, light.dir-light.fov/2)
					 
var x3 = x+lengthdir_x(SIGNAL_RANGE, light.dir+light.fov/2)
var y3 = y+lengthdir_y(SIGNAL_RANGE, light.dir+light.fov/2)

light.size = LIGHT_SIZE
if	points_colliding(x, y, x2, y2, , obj_cat) or
	points_colliding(x, y, x3, y3, , obj_cat)
{
	light.size = 2000
	//light.color = c_white
	if not signal
	{
		sprite_index = spr_scannerwave
		signal = true
	}
}