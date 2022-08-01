
function draw_intro_circle(){

var time = animcurve_channel_evaluate(circle_intro, intro_time/(4*60))

if time >= 1
{
	if surface_exists(circle_surface)
	{
		surface_free(circle_surface)
	}
	exit
}

if not surface_exists(circle_surface)
{
	circle_surface = surface_create(game_width, game_height)
}

var radius = time*game_width/1.5

surface_reset_target()
surface_set_target(circle_surface)
draw_clear_alpha(monster_red, 1)
gpu_set_blendmode(bm_subtract)
draw_circle(game_width/2, game_height/2, radius, false)
gpu_set_blendmode(bm_normal)
surface_reset_target()
surface_set_target(gui_surface)

draw_surface(circle_surface, 0, 0)
}