
function robostate_pause_initialize(robo){ with robo {

sprite_index = spr_robo_green
}}

function robostate_pause_step(robo){ with robo {

if not player.pause
{
	robo_switch_state(state_stand)
}
}}