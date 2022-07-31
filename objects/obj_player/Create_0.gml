
if player_id == obj_rollback.cat_id
{
	object = instance_create_layer(0, 0, "Instances_behind", obj_cat, {player: id})
	if player_local 
	{
		instance_create_layer(0, 0, "Instances_behind", obj_catlight, {parent: object})
	}
	
	obj_lightman.cat_is_local = player_local
}
else
{
	object = instance_create_layer(0, 0, "Instances_behind", obj_robo, {player: id})
	if player_local 
	{
		instance_create_layer(0, 0, "Instances_behind", obj_crewlight, {parent: object})
	}
}

if player_local
{
	instance_create_depth(x, y, 0, obj_camera)
	camera_set_following(object, true)
}