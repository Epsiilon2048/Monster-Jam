
function catstate_mon_jump_initialize(){ with obj_cat {

sprite_index = spr_monster
jump = 0
}}


function catstate_mon_jump_input(){ with obj_cat {

}}


function catstate_mon_jump_step(){ with obj_cat {

cat_increment_form_timer()

z = MON_JUMP_HEIGHT*animcurve_channel_evaluate(jump_curve, min(1, jump/MON_JUMP_DIST))

x += lengthdir_x(MON_JUMP_SPD, direction)
y += lengthdir_y(MON_JUMP_SPD, direction)

jump += MON_JUMP_SPD

if jump >= MON_JUMP_DIST and not box_colliding(x, y)
{
	cat_switch_state(state_mon_stand)
	z = 0
	exit
}
}}