
if not instance_exists(player) and state.name != "dead"
{
	instance_destroy()
	exit
}

state.step(self)