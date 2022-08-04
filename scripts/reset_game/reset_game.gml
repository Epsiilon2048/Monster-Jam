
function reset_game(){

instance_destroy(obj_cat)
instance_destroy(obj_robo)
instance_destroy(obj_orb)
instance_create_layer(0, 0, "Instances", o_stage)
instance_create_layer(0, 0, "Instances", obj_startbutton)
instance_create_layer(0, 0, "Instances", obj_menuinfo)
}