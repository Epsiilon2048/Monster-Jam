
function catstate_mon_walk_initialize(){ with obj_cat {

sprite_index = spr_monster
}}


function catstate_mon_walk_input(){ with obj_cat {

cat_get_input()
}}


function catstate_mon_walk_step(){ with obj_cat {

if cat_increment_form_timer()
{
	cat_switch_state(obj_catman.state_walk)
	cat_toggle_catvision(false)
	exit
}

if input.action_pressed
{
	cat_switch_state(obj_catman.state_mon_slash)
	exit
}

if not input.move
{
	cat_switch_state(obj_catman.state_mon_stand)
	exit
}

if (input.right - input.left) != 0
{
	image_xscale = input.right - input.left
}

direction = point_direction(0, 0, input.right - input.left, input.down - input.up)

move_collide(lengthdir_x(obj_catman.SPD, direction), lengthdir_y(obj_catman.SPD, direction), 1)
}}