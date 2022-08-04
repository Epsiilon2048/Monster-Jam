
if not rollback_game_running exit

x = game_width-10-sprite_width+cam_x
y = game_height-20-sprite_height+cam_y

if true//instance_number(obj_player) > 1
{	
	if position_meeting(obj_menuinfo.input.mx, obj_menuinfo.input.my, self)
	{
		state = 2
	
		if obj_menuinfo.input.action_pressed
		{
			clicking = true
		}
		else if clicking and not obj_menuinfo.input.action
		{
			// Do thing
			clicking = false
			state = 2
			instance_destroy(obj_menuinfo)
			instance_destroy(o_stage)
			instance_destroy()
			create_player_characters()
			exit
		}
	}
	else if clicking
	{
		if not obj_menuinfo.input.action
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
else state = 0