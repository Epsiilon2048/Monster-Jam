
function robo_stun(){

if state != state_punch and state != state_windup
{
	stun = STUN_TIME
	robo_switch_state(state_stunned)
}
}