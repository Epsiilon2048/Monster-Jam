
if player_id == obj_rollback.cat_id
{
	object = instance_create_layer(0, 0, "Instances", obj_cat, {player: id})
	if player_local 
	{
		instance_create_layer(0, 0, "Instances", obj_catlight, {parent: object})
		
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
	}
}

if player_local
{
	instance_create_depth(x, y, 0, obj_camera)
	camera_set_following(object, true)
}