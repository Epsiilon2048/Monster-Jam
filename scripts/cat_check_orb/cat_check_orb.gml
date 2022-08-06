
function cat_check_orb(){

var orb = instance_place(x, y, obj_orb)
if instance_exists(orb) and not orb.dying
{
	orbs ++
	orb.dying = true
	orb.visible = false
	orb.fov = 0
	instance_destroy(orb)
	
	if orbs >= MON_ORBS
	{
		orbs = 0
		final_form = MON_FORM_TIME
		cat_toggle_catvision(true)
		
		with obj_orb
		{
			if not dying instance_destroy()
			dying = true
			visible = false
		}
		
		audio_play_sound(snd_monster_roar, 1, false)
		audio_play_sound(snd_monster_roar2, 1, false)
		
		if player.player_local
		{
			set_bar("SEEK AND SLAY THE HUNTERS", , monster_red)
		}
		else
		{
			set_bar("THE DIVINE CREATURE HAS TAKEN FORM", , monster_red)
		}
		
		return true
	}
	else if player.player_local
	{
		var num = MON_ORBS-orbs
		set_bar(stitch(num," ORB",((num == 1) ? "" : "S")," REMAINING"))
	}
}

return false
}