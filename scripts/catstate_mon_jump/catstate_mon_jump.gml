
function catstate_mon_jump_initialize(){ with obj_cat {

sprite_index = spr_monster
jump = 0
}}


function catstate_mon_jump_input(){ with obj_cat {

}}


function catstate_mon_jump_step(){ with obj_cat {

cat_increment_form_timer()

z = JUMP_HEIGHT*animcurve_channel_evaluate(jump_curve, min(1, jump/JUMP_DIST))

x += lengthdir_x(JUMP_SPD, direction)
y += lengthdir_y(JUMP_SPD, direction)

jump += JUMP_SPD

if jump >= JUMP_DIST and not box_colliding(x, y)
{
	cat_switch_state(state_mon_stand)
	z = 0
	exit
}
}}