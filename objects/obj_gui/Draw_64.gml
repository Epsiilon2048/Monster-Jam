
if not instance_exists(obj_local.local_player) exit

step ++

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
	draw_map()
	
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