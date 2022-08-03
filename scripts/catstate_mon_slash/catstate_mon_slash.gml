
function catstate_mon_slash_initialize(){ with obj_cat {

sprite_index = spr_monster_slash
image_index = 0

cat_slash_collision()
}}


function catstate_mon_slash_input(){ with obj_cat {

cat_get_input()
}}


function catstate_mon_slash_step(){ with obj_cat {

cat_increment_form_timer()
}}


function catstate_mon_slash_anim_end(){ with obj_cat {

if cat_increment_form_timer()
{
	cat_switch_state(state_stand)
	cat_end_transformation()
	exit
}

if input.move
{
	cat_switch_state(state_mon_walk)
	exit
}

cat_switch_state(state_mon_stand)
}}