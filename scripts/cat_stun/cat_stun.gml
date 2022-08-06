
function cat_stun(){

if final_form and state != state_mon_jump
{
	stun = MON_STUN_TIME
	cat_switch_state(state_mon_stunned)
}
else
{
	stun = CAT_STUN_TIME
	cat_switch_state(state_stunned)
}
}