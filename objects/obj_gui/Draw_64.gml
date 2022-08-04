
step ++

if not instance_exists(obj_local) exit

if instance_exists(o_stage)
{
	if rollback_game_running stage_screen = merge_color(stage_screen, c_gray, .01)
	
	draw_set_color(stage_screen)
	gpu_set_blendmode(bm_subtract)
	draw_rectangle(0, 0, game_width, game_height, false)
	gpu_set_blendmode(bm_normal)
	draw_set_color(c_white)
	
	draw_sprite(spr_monster_jam, 0, 20, 20)
}

with obj_reset
{
	gpu_set_blendmode(bm_subtract)
	draw_set_color(merge_color(c_black, c_white, max(0, (reset_timer-2*60)/(RESET_TIME-2*60))))
	draw_rectangle(0, 0, game_width, game_height, false)
	draw_set_color(c_white)
	gpu_set_blendmode(bm_normal)
}

draw_whos_the_cat()

if not instance_exists(obj_local.local_player) or not instance_exists(obj_local.local_player.object)
{
	with obj_playersinbutton
	{
		draw_pre_game_text()
		draw_sprite(sprite_index, state, x-cam_x, y-cam_y)
	}
	
	with obj_startbutton
	{
		//if obj_local.local_id == 0
		//{
			draw_sprite_ext(sprite_index, state, x-cam_x, y-cam_y, 1, 1, 0, c_white, image_alpha)
		//}
		//else
		//{
		//	draw_sprite(sprite_index, 0, x-cam_x, y-cam_y)
		//}
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
		var obj = obj_local.local_player.object
		if obj.state.name == "dead"
		{
			draw_you_dead_lol()
		}
		else 
		{
			//draw_cat_detector_icon()
			draw_map()
			
			if obj.stun > 0
			{
				draw_stunned_notice()
			}
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
			if obj_cat.stun > 0
			{
				draw_stunned_notice()
			}
			else 
			{
				var detected = false
				with obj_scanner
				{
					if signal
					{
						detected = true
						break
					}
				}
				
				if detected draw_detected_notice()
			}
			
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