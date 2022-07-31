
EMISSION_COLOR = 0x00FF00
emission_color = EMISSION_COLOR

robo_switch_state(obj_roboman.state_stand)

with obj_robospawn if spawn_id == other.player.player_id
{
	other.x = x
	other.y = y
}

light = instance_create_layer(x, y, "Lights", obj_light, {
	color: hex_to_color(0xfff1bf),
	size: 350,
	str: 0,
	fov: obj_roboman.LIGHT_FOV,
	parent: self,
})

flashlight = true

robo_get_input()