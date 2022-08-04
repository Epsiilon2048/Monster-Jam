
function cat_check_orb(){

var orb = instance_place(x, y, obj_orb)
if instance_exists(orb) and not orb.dying
{
	orbs ++
	orb.dying = true
	orb.visible = false
	orb.fov = 0
	instance_destroy(orb)
	
	if orbs >= ORBS_FOR_FORM
	{
		orbs = 0
		final_form = FINAL_FORM_TIME
		cat_toggle_catvision(true)
		
		with obj_orb
		{
			if not dying instance_destroy()
			dying = true
			visible = false
		}
		
		if player.player_local
		{
			set_bar("SEEK AND SLAY", , monster_red)
		}
		else
		{
			set_bar("THE CREATURE HAS TAKEN TRUE FORM", , monster_red)
		}
		
		return true
	}
	else if player.player_local
	{
		var num = ORBS_FOR_FORM-orbs
		set_bar(stitch(num," ORB",((num == 1) ? "" : "S")," REMAINING"))
	}
}

return false
}