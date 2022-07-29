
function robo_get_input(){
	
input = rollback_get_input(player.player_id)
input.move = input.left or input.up or input.right or input.down

robo_point_light()
}