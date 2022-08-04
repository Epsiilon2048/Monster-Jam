
step ++

if not instance_exists(obj_local) exit

if not instance_exists(obj_local.local_player) or not instance_exists(obj_local.local_player.object)
{
	draw_set_color(c_ltgray)
	gpu_set_blendmode(bm_subtract)
	draw_rectangle(0, 0, game_width, game_height, false)
	gpu_set_blendmode(bm_normal)
	draw_set_color(c_white)
	
	with obj_startbutton
	{
		if obj_local.local_id == 0
		{
			draw_sprite(sprite_index, state, x-cam_x, y-cam_y)
		}
		else
		{
			draw_sprite(sprite_index, 0, x-cam_x, y-cam_y)
		}
	}
}
else
{
	if not surface_exists(gui_surface)
	{
		gui_surface = surface_create(game_width, game_height)
	}

	if not surface_exists(map_surface)
	{
		map_surface = surface_create(1, 1)
		create_map_surface(map_surface)
	}

	surface_set_target(gui_surface)
	draw_clear_alpha(c_black, 0)

	// Crew GUI
	if not obj_local.local_is_cat
	{
		if obj_local.local_player.object.state.name == "dead"
		{
			draw_you_dead_lol()
		}
		else 
		{
			//draw_cat_detector_icon()
			draw_map()
		}
	}

	// Kitty GUI
	else if instance_exists(obj_cat)
	{	
		if obj_cat.final_form > 0 
		{
			draw_monster_bar()
			catvision_time = 0
		}
		else
		{
			if obj_cat.catvision
			{
				catvision_time ++
				draw_catvision_notice()
			}
			else catvision_time = 0
		}
	
		draw_intro_circle()
	}

	draw_bar()
	bar_time ++
	intro_time ++

	surface_reset_target()

	draw_surface(gui_surface, 0, 0)
}