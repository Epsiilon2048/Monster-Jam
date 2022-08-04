
if rollback_event_param.first_start
{
	instance_create_layer(x, y, layer, obj_startbutton)
	instance_create_depth(0, 0, 0, obj_menuinfo)
	instance_destroy()
}