
emission_color = 0x78B83C

robo_switch_state(, obj_roboman.state_stand)

with obj_robospawn if spawn_id == other.player_id
{
	other.x = x
	other.y = y
}

if player_local
{
	instance_create_depth(x, y, 0, obj_camera)
	camera_set_following()
}

light = instance_create_layer(x, y, "Lights", obj_light, {
	color: 0x00D7FF,
	size: 200,
	str: 1,
	fov: 120,
	parent: self,
})

robo_get_input()