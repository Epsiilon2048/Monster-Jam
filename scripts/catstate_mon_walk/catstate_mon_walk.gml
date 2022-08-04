
function catstate_mon_walk_initialize(){ with obj_cat {

sprite_index = spr_monster_walk
image_index = 0
footstep = 0
}}


function catstate_mon_walk_input(){ with obj_cat {

cat_get_input()
}}


function catstate_mon_walk_step(){ with obj_cat {

if cat_increment_form_timer()
{
	cat_switch_state(state_walk)
	cat_end_transformation()
	exit
}

if input.action_pressed
{
	cat_switch_state(state_mon_slash)
	exit
}

if not input.move
{
	cat_switch_state(state_mon_stand)
	exit
}

if (input.right - input.left) != 0
{
	image_xscale = input.right - input.left
}

direction = point_direction(0, 0, input.right - input.left, input.down - input.up)

var colliding = move_collide_lendir(FORM_SPD, direction) 
var nodiagonal = direction == 0 or direction == 90 or direction == 180 or direction == 270

if colliding and nodiagonal and not box_colliding(x+lengthdir_x(31, direction), y+lengthdir_y(27, direction))
{
	cat_switch_state(state_mon_jump)
}

if not (footstep mod FORM_FOOTSTEP_INTERVAL)
{
	play_sound_for_player(player.player_id, 
		choose(
			snd_monwalk1,
			snd_monwalk2,
			snd_monwalk3,
			snd_monwalk4,
		), 5, false
	)
}
footstep ++
}}