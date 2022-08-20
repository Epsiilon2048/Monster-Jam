function window_resize(width=win_width, height=win_height){

surface_resize(application_surface, width, height)
window_set_size(width, height)
display_set_gui_size(width, height)
view_set_wport(0, width)
view_set_hport(0, height)

window_width_prev = width
window_height_prev = height

with o_stage
{
	scale = width/game_width
}
}