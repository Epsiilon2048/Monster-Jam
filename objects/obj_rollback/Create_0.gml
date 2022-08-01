
cat_id = rollback_cat_player//irandom_range(0, rollback_players-1)

if start_in_rollback
{
	rollback_define_player(obj_player)
	rollback_define_input({
		left:				[vk_left,	ord("A")],
		up:					[vk_up,		ord("W")],
		right:				[vk_right,	ord("D")],
		down:				[vk_down,	ord("S")],
		fl_toggle:			[ord("F")],
		mx:					[m_axisx],
		my:					[m_axisy],
		action:				[mb_left],
	})

	rollback_use_random_input(false)

	if not rollback_join_game()
	{
		rollback_create_game(rollback_players, rollback_testing)
	}
}

room_goto_next()