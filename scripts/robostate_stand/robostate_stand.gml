
function robostate_stand_initialize(robo=self){ with robo {

sprite_index = spr_greenman
}}


function robostate_stand_input(robo=self){ with robo {

robo_get_input()
}}


function robostate_stand_step(robo=self){ with robo {

if input.move
{
	robo_switch_state(, obj_roboman.state_walk)
	exit
}
}}