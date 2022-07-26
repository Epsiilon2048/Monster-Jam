
rollback_define_player(obj_robo)
rollback_define_input({
	left:	[vk_left,	ord("A")],
	up:		[vk_up,		ord("W")],
	right:	[vk_right,	ord("D")],
	down:	[vk_down,	ord("S")],
	mx:		[m_axisx],
	my:		[m_axisy],
})

if not rollback_join_game()
{
	rollback_create_game(2, true)
}

room_goto_next()