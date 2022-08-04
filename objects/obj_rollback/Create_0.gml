
if start_in_rollback
{
	rollback_define_player(obj_player)
	rollback_define_input({
		left:		[vk_left,	ord("A")],
		up:			[vk_up,		ord("W")],
		right:		[vk_right,	ord("D")],
		down:		[vk_down,	ord("S")],
		fl_toggle:	[ord("F")],
		mx:			[m_axisx],
		my:			[m_axisy],
		mx_gui:		[m_axisx_gui],
		my_gui:		[m_axisy_gui],
		action:		[mb_left],
		secondary:	[mb_right],
		punch:		[vk_space],
	})

	rollback_use_random_input(false)
	if not rollback_join_game()
	{
		rollback_create_game(4, rollback_testing,)// "North America")
	}
	
	room_goto(rm_level)
}