
emission_color = 0x78B83C

robo_switch_state(obj_roboman.state_stand)

with obj_robospawn if spawn_id == other.player.player_id
{
	other.x = x
	other.y = y
}

if player.player_local
{
	instance_create_depth(x, y, 0, obj_camera)
	camera_set_following()
}

light = instance_create_layer(x, y, "Lights", obj_light, {
	color: 0x00D7FF,
	size: 500,
	str: 0,
	fov: 120,
	parent: self,
})

robo_get_input()