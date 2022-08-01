
function cat_check_orb(){

var orb = instance_place(x, y, obj_orb)
if instance_exists(orb) and not orb.dying
{
	orbs ++
	orb.dying = true
	orb.visible = false
	orb.fov = 0
	instance_destroy(orb)
	
	if orbs >= obj_catman.ORBS_FOR_FORM
	{
		orbs = 0
		final_form = obj_catman.FINAL_FORM_TIME
		cat_toggle_catvision(true)
		set_bar("SEEK AND SLAY", , monster_red)
		return true
	}
	else if obj_cat.player.player_local
	{
		var num = obj_catman.ORBS_FOR_FORM-orbs
		set_bar(stitch(num," ORB",((num == 1) ? "" : "s")," REMAINING"))
	}
}

return false
}