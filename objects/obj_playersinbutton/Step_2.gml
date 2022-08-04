
{	
	if position_meeting(mouse_x, mouse_y, self)
	{
		state = 2
	
		if mouse_check_button_pressed(mb_left)
		{
			clicking = true
		}
		else if clicking and not mouse_check_button(mb_left)
		{
			// Do thing
			clicking = false
			state = 2
			rollback_start_game()
			exit
		}
	}
	else if clicking
	{
		if not mouse_check_button(mb_left)
		{
			clicking = false
			state = 1
		}
		else
		{
			state = 2
		}
	}
	else state = 1
}