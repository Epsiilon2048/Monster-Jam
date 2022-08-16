
function robostate_walk_initialize(robo){ with robo {

sprite_index = sprite_walk
image_index = 0
footstep = 0
}}


function robostate_walk_input(robo){ with robo {

robo_get_input()
}}


function robostate_walk_step(robo){ with robo {

robo_check_flashlight()
robo_check_bombthrow()

if input.punch_pressed
{
	robo_switch_state(state_windup)
	exit
}

if not input.move
{
	robo_switch_state(state_stand)
	exit
}

direction = point_direction(0, 0, input.right - input.left, input.down - input.up)

move_collide(lengthdir_x(SPD, direction), lengthdir_y(SPD, direction))

if not (footstep mod ROBO_FOOTSTEP_INTERVAL)
{
	play_sound_for_player(player.player_id, 
		choose(
			snd_robowalk1,
			snd_robowalk2,
			snd_robowalk3,
		), 5, false
	)
}
footstep ++
}}