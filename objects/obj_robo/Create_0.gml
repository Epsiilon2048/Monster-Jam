
state_stand = new Robostate("stand")
state_walk = new Robostate("walk")
state_dead = new Robostate("dead")

SPD = 1.3
LIGHT_FOV = 100
BOMBS = 2
bombs_out = 0

EMISSION_COLOR = 0xE13742
emission_color = EMISSION_COLOR

robo_switch_state(state_stand)

with obj_robospawn if not spawned
{
	spawned = true
	other.x = x
	other.y = y
	break
}

light = instance_create_layer(x, y, "Lights", obj_light, {
	color: hex_to_color(0xfff1bf),
	size: 350,
	str: 0,
	fov: LIGHT_FOV,
	parent: self,
})

flashlight = true

robo_get_input()