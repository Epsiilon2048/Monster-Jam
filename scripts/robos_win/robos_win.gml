
function robos_win(){

with obj_cat cat_switch_state(state_pause)
with obj_robo robo_switch_state(state_pause)
		
if obj_local.local_is_cat
{
	set_bar(
	choose(
		"THE HUNTERS HAVE CAPTURED YOU",
		"YOU'VE LOST TO THE PATHETIC MACHINES",
		"THE ORBS WERE SIMPLY NOT ENOUGH",
		"YOU'VE FALLEN TO THE HUNTERS OF THE DARK",
	),
	"YOU LOSE", monster_red)
}
else
{
	set_bar(
	choose(
		"THE HUNTERS HAVE CAPTURED THE CREATURE",
		"YOU HAVE APPREHENDED THE DIVINE CREATURE",
		"THE DIVINE CREATURE IS NO MORE",
	),
	"YOU WIN", hex_to_color(0x31e092))
}
}