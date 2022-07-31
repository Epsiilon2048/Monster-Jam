
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
		return true
	}
}

return false
}