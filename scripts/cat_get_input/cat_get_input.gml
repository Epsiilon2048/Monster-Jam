
function cat_get_input(){

if not instance_exists(player) exit
input = rollback_get_input(player.player_id)
input.move = input.left or input.up or input.right or input.down
}