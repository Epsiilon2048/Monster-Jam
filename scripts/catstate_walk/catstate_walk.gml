
function catstate_walk_initialize(){ with obj_cat {

sprite_index = spr_cat_walk
}}


function catstate_walk_input(){ with obj_cat {

cat_get_input()
}}


function catstate_walk_step(){ with obj_cat {

cat_check_catvision()

if cat_check_orb()
{
	cat_switch_state(state_mon_walk)
	exit
}

if not input.move
{
	cat_switch_state(state_stand)
	exit
}

if (input.right - input.left) != 0
{
	image_xscale = input.right - input.left
}

direction = point_direction(0, 0, input.right - input.left, input.down - input.up)

move_collide(lengthdir_x(SPD, direction), lengthdir_y(SPD, direction))
}}