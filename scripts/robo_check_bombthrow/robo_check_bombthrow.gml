
function robo_check_bombthrow(){

if bombs_out < BOMBS and input.action_pressed
{
	bombs_out ++
	var bomb = instance_create_layer(x, y, layer, obj_bomb, {
		direction: point_direction(x, y, input.mx, input.my),
	})
	bomb.parent = self
}
}