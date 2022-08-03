
function catstate_stunned_initialize(){ with obj_cat {

sprite_index = spr_cat
}}


function catstate_stunned_step(){ with obj_cat {

stun --

if stun <= 0
{
	robo_switch_state(state_stand)
	exit
}
}}