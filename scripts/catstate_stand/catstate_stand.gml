
function catstate_stand_initialize(){ with obj_cat {

sprite_index = spr_cat
}}


function catstate_stand_input(){ with obj_cat {

cat_get_input()
}}


function catstate_stand_step(){ with obj_cat {

cat_check_catvision()

if cat_check_orb()
{
	cat_switch_state(state_mon_stand)
	exit
}

if input.move
{
	cat_switch_state(state_walk)
	exit
}
}}