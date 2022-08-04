
if spd > 0
{	
	if move_collide_lendir(spd, direction)
	{
		direction = -direction
	}
	
	spd = lerp(spd, 0, SPD_LERP)
	if spd < 0.3
	{
		spd = 0
		ring = 0
		emission_color = 0xFF6F00
	}
	
	image_speed = spd/7
}
else if ring > -1
{
	ring = ring+0.2
}

if not instance_exists(parent) or (spd == 0 and parent.input.secondary_pressed)
{
	parent.bombs_out --
	visible = false
	instance_create_layer(x, y, layer, obj_explosion)
	instance_destroy()
}