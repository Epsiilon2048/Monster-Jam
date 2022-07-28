
function catstate_walk_initialize(){ with obj_cat {

sprite_index = spr_cat_walk
}}


function catstate_walk_input(){ with obj_cat {

cat_get_input()
}}


function catstate_walk_step(){ with obj_cat {

if not input.move
{
	cat_switch_state(obj_catman.state_stand)
	exit
}

if (input.right - input.left) != 0
{
	image_xscale = input.right - input.left
}

direction = point_direction(0, 0, input.right - input.left, input.down - input.up)

x += lengthdir_x(obj_catman.SPD, direction)
y += lengthdir_y(obj_catman.SPD, direction)
}}