
function robostate_stunned_initialize(robo){ with robo {

sprite_index = sprite_stand
}}

function robostate_stunned_step(robo){ with robo {

stun --

if stun <= 0
{
	robo_switch_state(state_stand)
	exit
}
}}