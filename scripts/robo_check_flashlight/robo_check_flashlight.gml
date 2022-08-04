
function robo_check_flashlight(){

if input.fl_toggle_pressed 
{
	robo_toggle_flashlight()
	play_sound_for_player(player.player_id, snd_menu_click, 4, false)
}
}