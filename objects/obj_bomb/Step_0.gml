
if spd > 0
{	
	if move_collide_lendir(spd, direction)
	{
		direction = -direction
		//x += lengthdir_x(1, direction)
		//y += lengthdir_y(1, direction)
	}
	
	spd = lerp(spd, 0, SPD_LERP)
	if spd < 0.2
	{
		spd = 0
		ring = 0
	}
}
else if ring > -1
{
	ring = ring+0.2
}