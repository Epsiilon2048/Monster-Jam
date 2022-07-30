
function catstate_mon_stand_initialize(){ with obj_cat {

sprite_index = spr_monster
cat_toggle_catvision(true)
}}


function catstate_mon_stand_input(){ with obj_cat {

cat_get_input()
}}


function catstate_mon_stand_step(){ with obj_cat {

if input.fl_toggle_pressed
{
	cat_switch_state(obj_catman.state_stand)
}

if input.move
{
	cat_switch_state(obj_catman.state_mon_walk)
	exit
}
}}