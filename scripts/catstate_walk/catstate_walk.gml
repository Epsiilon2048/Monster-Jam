
function catstate_walk_initialize(){ with obj_cat {

sprite_index = morgan ? spr_morgan_walk : spr_cat_walk
image_index = 0
footstep = 0
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

move_collide(lengthdir_x(CAT_SPD, direction), lengthdir_y(CAT_SPD, direction))

if not (footstep mod CAT_FOOTSTEP_INTERVAL)
{
	play_sound_for_player(player.player_id, 
		choose(
			snd_catwalk1,
			snd_catwalk2,
			snd_catwalk3,
			snd_catwalk4,
			snd_catwalk5,
		), 5, false
	)
}
footstep ++
}}