
function robostate_stand_initialize(robo){ with robo {

sprite_index = spr_robo_green
}}


function robostate_stand_input(robo){ with robo {

robo_get_input()
}}


function robostate_stand_step(robo){ with robo {

if input.move
{
	robo_switch_state(obj_roboman.state_walk)
	exit
}
}}