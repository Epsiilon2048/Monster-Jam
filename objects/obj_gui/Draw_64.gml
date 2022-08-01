
step ++

if not instance_exists(obj_local.local_player) exit

// Crew GUI
if not obj_local.local_is_cat
{
	if obj_local.local_player.object.state.name == "dead"
	{
		draw_you_dead_lol()		
		exit
	}
	
	draw_cat_detector_icon()
	exit
}



// Kitty GUI
if instance_exists(obj_cat)
{
	if not surface_exists(map_surface)
	{
		map_surface = surface_create(1, 1)
		create_map_surface(map_surface)
	}
	
	draw_map()
	
	if obj_cat.final_form > 0 
	{
		draw_monster_bar()
		catvision_time = 0
		exit
	}
	
	draw_orbs_notice()
	
	if obj_cat.catvision
	{
		catvision_time ++
		draw_catvision_notice()
	}
	else catvision_time = 0
}