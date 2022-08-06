
function reset_game(){

with obj_robospawn
{
	spawned = false
}

if instance_exists(obj_cat) instance_destroy(obj_cat)
if instance_exists(obj_robo) instance_destroy(obj_robo)
if instance_exists(obj_orb) instance_destroy(obj_orb)

instance_create_layer(0, 0, "Instances", o_stage)
instance_create_layer(0, 0, "Instances", obj_startbutton)
instance_create_layer(0, 0, "Instances", obj_menuinfo)
instance_create_layer(0, 0, "Instances", obj_whos_the_cat)
}