
function cat_stun(){

if final_form
{
	stun = STUN_TIME_MON
	cat_switch_state(state_mon_stunned)
}
else
{
	stun = STUN_TIME
	cat_switch_state(state_stunned)
}
}