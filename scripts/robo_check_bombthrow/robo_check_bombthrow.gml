
function robo_check_bombthrow(){

if input.action_pressed
{
	instance_create_layer(x, y, layer, obj_bomb, {
		direction: point_direction(x, y, input.mx, input.my)
	})
}
}