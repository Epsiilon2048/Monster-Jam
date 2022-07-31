
step ++



// Crew GUI
if not obj_lightman.cat_is_local
{
	draw_cat_detector_icon()
	exit
}



// Kitty GUI
if instance_exists(obj_cat)
{
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