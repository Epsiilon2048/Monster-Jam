
if not instance_exists(player) and not dead
{
	instance_destroy()
	exit
}

state.step(self)