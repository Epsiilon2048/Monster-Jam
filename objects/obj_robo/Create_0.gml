
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

BOMBS = 2
bombs_out = 0

#macro ROBO_LIGHT_FOV 100
#macro ROBO_LIGHT_COLOR 0xBFF1FF
#macro ROBO_LIGHT_SIZE 350
#macro ROBO_FOOTSTEP_INTERVAL 26

light_fov = ROBO_LIGHT_FOV
light_color = ROBO_LIGHT_COLOR
light_size = ROBO_LIGHT_SIZE
light_dir = 0

footstep = 0

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

dead = false

flashlight = true

robo_get_input()