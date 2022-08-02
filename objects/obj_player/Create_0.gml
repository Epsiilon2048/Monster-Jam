
if player_id == rollback_cat_player
{
	object = instance_create_layer(0, 0, "Instances", obj_cat, {player: id})
	if player_local 
	{
		instance_create_layer(0, 0, "Instances", obj_catlight, {parent: object})
		
		set_bar(
			"You are the DIVINE CREATURE", 
			(irandom(6) == 1) ? "Absorb ORBS to reach TRUE FORB" : "Absorb ORBS to reach your TRUE FORM",
			monster_red
		)
		obj_gui.bar_time = -2.5*60
		obj_gui.intro_time = 0
		
		obj_local.local_id = player_id
		obj_local.local_player = self
		obj_local.local_is_cat = true
	}
}
else
{
	object = instance_create_layer(0, 0, "Instances", obj_robo, {player: id})
	if player_local 
	{
		instance_create_layer(0, 0, "Instances", obj_crewlight, {parent: object})
		
		obj_local.local_id = player_id
		obj_local.local_player = self
		obj_local.local_is_cat = false
		
		set_bar(
			"You are a HUNTER OF THE DARK", 
			"Entrap the creature before it takes its TRUE FORM",
		)
	}
}

if player_local
{
	instance_create_depth(x, y, 0, obj_camera)
	camera_set_following(object, true)
}