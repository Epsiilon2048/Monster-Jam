
function draw_intro_circle(){

if intro_time > 100 and instance_exists(o_stage)
{
	instance_destroy(o_stage)
	camera_set_following(obj_cat, true)
}

var time = animcurve_channel_evaluate(circle_intro, max(0, (intro_time-140)/(4*60)))

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

var radius = time*game_width

surface_reset_target()
surface_set_target(circle_surface)
draw_clear_alpha(monster_red, intro_time/100)
gpu_set_blendmode(bm_subtract)
draw_circle(obj_cat.x-cam_x, obj_cat.y-cam_y, radius, false)
gpu_set_blendmode(bm_normal)
surface_reset_target()
surface_set_target(gui_surface)

draw_surface(circle_surface, 0, 0)
}