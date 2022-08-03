
function catstate_mon_stand_initialize(){ with obj_cat {

sprite_index = spr_monster
}}


function catstate_mon_stand_input(){ with obj_cat {

cat_get_input()
}}


function catstate_mon_stand_step(){ with obj_cat {

if cat_increment_form_timer()
{
	cat_switch_state(state_stand)
	cat_end_transformation()
	exit
}

if input.action_pressed
{
	cat_switch_state(state_mon_slash)
	exit
}

if input.move
{
	cat_switch_state(state_mon_walk)
	exit
}
}}