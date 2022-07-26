
function robostate_walk_initialize(robo=self){ with robo {

sprite_index = spr_greenman_walk
}}


function robostate_walk_input(robo=self){ with robo {

robo_get_input()
}}


function robostate_walk_step(robo=self){ with robo {

if not input.move
{
	robo_switch_state(, obj_roboman.state_stand)
	exit
}

if (input.right - input.left) != 0
{
	image_xscale = input.right - input.left
}

direction = point_direction(0, 0, input.right - input.left, input.down - input.up)

x += lengthdir_x(obj_roboman.SPD, direction)
y += lengthdir_y(obj_roboman.SPD, direction)
}}