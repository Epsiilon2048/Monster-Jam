
image_alpha += 0.01

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
		state = 1
		if image_alpha > 0.5
		{
			instance_destroy(obj_menuinfo)
			instance_destroy()
			create_player_characters()
			audio_stop_sound(music)
			audio_play_sound(snd_menu_enter, 2, false)
			exit
		}
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