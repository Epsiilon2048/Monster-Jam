
function catstate_mon_stand_initialize(){ with obj_cat {

sprite_index = spr_monster
}}


function catstate_mon_stand_input(){ with obj_cat {

cat_get_input()
}}


function catstate_mon_stand_step(){ with obj_cat {

if cat_increment_form_timer()
{
	cat_switch_state(obj_catman.state_stand)
	cat_toggle_catvision(false)
	exit
}

if input.action_pressed
{
	cat_switch_state(obj_catman.state_mon_slash)
	exit
}

if input.move
{
	cat_switch_state(obj_catman.state_mon_walk)
	exit
}
}}