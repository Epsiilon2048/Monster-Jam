
reset_timer += -signbool(done)
if reset_timer >= RESET_TIME
{
	reset_game()
	done = true
}
else if done and reset_timer <= 0
{
	instance_destroy()
}