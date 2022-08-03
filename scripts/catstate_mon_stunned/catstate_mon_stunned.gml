
function catstate_mon_stunned_initialize(){ with obj_cat {

sprite_index = spr_monster
}}


function catstate_mon_stunned_step(){ with obj_cat {

cat_increment_form_timer()

stun --

if stun <= 0
{
	robo_switch_state(state_mon_stand)
	exit
}
}}