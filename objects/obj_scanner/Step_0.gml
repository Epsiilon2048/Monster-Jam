
if not rollback_game_running exit

direction += SPD

if instance_exists(obj_cat) and SIGNAL_RANGE >= point_distance(x, y, obj_cat.x, obj_cat.y)
{
	var pass = false
	
	var d1 = direction-FOV/2
	var x2 = x+lengthdir_x(SIGNAL_RANGE, d1)
	var y2 = y+lengthdir_y(SIGNAL_RANGE, d1)

	var d2 = direction+FOV/2
	var x3 = x+lengthdir_x(SIGNAL_RANGE, d2)
	var y3 = y+lengthdir_y(SIGNAL_RANGE, d2)
	
	if	instance_exists(collision_line(x, y, x2, y2, obj_cat, false, true)) or
		instance_exists(collision_line(x, y, x3, y3, obj_cat, false, true))
	{
		pass = true
	}
	
	var dir = point_direction(x, y, obj_cat.x, obj_cat.y)
	
	var x3 = x+lengthdir_x(SIGNAL_RANGE, dir)
	var y3 = y+lengthdir_y(SIGNAL_RANGE, dir)
	
	if pass and points_colliding(x, y, x3, y3, , obj_cat)
	{
		if not signal
		{
			sprite_index = spr_scannerwave
			signal = true
		}
	}
}