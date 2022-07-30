
function catstate_stand_initialize(){ with obj_cat {

sprite_index = spr_cat
}}


function catstate_stand_input(){ with obj_cat {

cat_get_input()
}}


function catstate_stand_step(){ with obj_cat {

if input.fl_toggle_pressed cat_switch_state(obj_catman.state_mon_stand)
cat_check_catvision()

if input.move
{
	cat_switch_state(obj_catman.state_walk)
	exit
}
}}