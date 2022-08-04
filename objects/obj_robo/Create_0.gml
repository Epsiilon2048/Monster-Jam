
z = 0
emission = 0

state_pause = new Robostate("pause")
state_stand = new Robostate("stand")
state_walk = new Robostate("walk")
state_windup = new Robostate("windup")
state_punch = new Robostate("punch")
state_stunned = new Robostate("stunned")
state_dead = new Robostate("dead")

SPD = 1.3
STUN_TIME = 3*60
stun = 0
LIGHT_FOV = 100
LIGHT_COLOR = hex_to_color(0xfff1bf)
LIGHT_SIZE = 350
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
	color: LIGHT_COLOR,
	size: LIGHT_SIZE,
	str: 0,
	fov: LIGHT_FOV,
	parent: self,
})

flashlight = true

robo_get_input()