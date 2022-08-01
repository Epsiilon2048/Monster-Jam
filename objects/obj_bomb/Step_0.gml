
if spd > 0
{	
	if move_collide_lendir(spd, direction)
	{
		direction = -direction
	}
	
	spd = lerp(spd, 0, SPD_LERP)
	if spd < 0.01
	{
		spd = 0
	}
}