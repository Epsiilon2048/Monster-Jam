
function cat_win(){

with obj_cat cat_switch_state(state_pause)
with obj_robo robo_switch_state(state_pause)
		
if obj_local.local_is_cat
{
	set_bar(
	choose(
		"YOU HAVE SLAIN THE HUNTERS",
		"YOU HAVE FULFILLED YOUR DIVINE CONQUEST",
		"YOUR FAMILY IS NOW SAFE",
		"THE HUNTERS OF THE DARK ARE NO MORE",
	), 
	"YOU WIN", hex_to_color(0x31e092))
}
else
{
	set_bar(
	choose(
		"YOU AND YOUR FRIENDS AREN'T COMING HOME",
		"THE DIVINE CREATURE HAS ENACTED ITS REVENGE",
		"YOUR TEAM HAS BEEN ANNIHILATED",
		"THE CAT GOT THE BETTER OF YOU",
	), 
	"YOU LOSE", monster_red)
}
}