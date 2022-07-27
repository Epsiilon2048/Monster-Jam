
function robo_get_input(){
	
input = rollback_get_input(player.player_id)
input.move = input.left or input.up or input.right or input.down

light.dir = point_direction(x, y, input.mx, input.my)
light.x = x+lengthdir_x(7, light.dir)
light.y = y+lengthdir_y(7, light.dir)
}