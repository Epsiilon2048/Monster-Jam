
if player_id == obj_rollback.cat_id
{
	object = instance_create_layer(0, 0, "Instances_behind", obj_cat, {player: id})
}
else
{
	object = instance_create_layer(0, 0, "Instances_behind", obj_robo, {player: id})
}