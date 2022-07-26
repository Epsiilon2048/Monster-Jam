
function robo_get_input(){

input = rollback_get_input(player_id)
input.move = input.left or input.up or input.right or input.down

//if input.move
{
	//light.dir = point_direction(0, 0, input.right-input.left, input.down-input.up)
	light.dir = point_direction(x, y, input.mx, input.my)
	light.x = x+lengthdir_x(7, light.dir)
	light.y = y+lengthdir_y(7, light.dir)
}
}