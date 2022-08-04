
function robostate_stand_initialize(robo){ with robo {

sprite_index = spr_robo_green
}}


function robostate_stand_input(robo){ with robo {

robo_get_input()
}}


function robostate_stand_step(robo){ with robo {

robo_check_flashlight()
robo_check_bombthrow()

if input.punch_pressed
{
	robo_switch_state(state_windup)
	exit
}

if input.move
{
	robo_switch_state(state_walk)
	exit
}
}}