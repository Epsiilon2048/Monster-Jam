
var players = 2
cat_id = 0//irandom_range(0, players-1)

rollback_define_player(obj_player)
rollback_define_input({
	left:	[vk_left,	ord("A")],
	up:		[vk_up,		ord("W")],
	right:	[vk_right,	ord("D")],
	down:	[vk_down,	ord("S")],
	mx:		[m_axisx],
	my:		[m_axisy],
})

rollback_use_random_input(false)

if not rollback_join_game()
{
	rollback_create_game(players, true)
}

room_goto_next()