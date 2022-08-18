
global.namecolors = {
	indigo: hex_to_color(0x4237E1),
	ocean: hex_to_color(0x4bee6f),
	bumblebee: hex_to_color(0xf4f640),
	fuchsia: hex_to_color(0xe264f0),
}

function create_player_characters(){ with obj_player {
	
if player_id == obj_menuinfo.cat_player
{
	object = instance_create_layer(0, 0, "Instances", obj_cat, {player: id})
	
	var roll = irandom(6)
	
	if player_local 
	{
		instance_create_layer(0, 0, "Instances", obj_catlight, {parent: object})
		instance_create_layer(0, 0, "Instances", obj_catambient, {parent: object})
		
		set_bar(
			cat_is_morgan ? "You are MORGAN" : "You are the DIVINE CREATURE", 
			(roll == 1) ? "Absorb ORBS to reach TRUE FORB" : "Absorb ORBS to reach your TRUE FORM",
			monster_red
		)
		obj_gui.bar_time = -2.5*60-140
		obj_gui.intro_time = 0
		
		obj_local.local_id = player_id
		obj_local.local_player = self
		obj_local.local_is_cat = true
	}
}
else
{
	object = instance_create_layer(0, 0, "Instances", obj_robo, {
		player: id,
		colorname: "bumblebee",
		EMISSION_COLOR: global.namecolors[$ "bumblebee"],
	})
	
	instance_create_layer(0, 0, "Instances", obj_flashlight, {parent: object})
	
	if player_local 
	{
		instance_create_layer(0, 0, "Instances", obj_crewlight, {parent: object})
		
		obj_local.local_id = player_id
		obj_local.local_player = self
		obj_local.local_is_cat = false
		
		set_bar(
			"You are a HUNTER OF THE DARK", 
			cat_is_morgan ? "Entrap morgan before it TAKES FORM" : "Entrap the creature before it TAKES FORM",
		)
		instance_destroy(o_stage)
		camera_set_following(object, true)
	}
}
}}