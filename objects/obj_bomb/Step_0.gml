
if not instance_exists(parent)
{
	instance_destroy()
	exit
}

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
		play_sound_for_player(parent.player.player_id, snd_bomb_beep, 1, false)
	}
	
	image_speed = spd/7
}
else if ring > -1
{
	ring = ring+0.2
}

if spd == 0 and parent.input.secondary_pressed
{
	parent.bombs_out --
	visible = false
	instance_create_layer(x, y, layer, obj_explosion)
	play_sound_for_player(parent.player.player_id, snd_explosion, 2, false)
	instance_destroy()
}