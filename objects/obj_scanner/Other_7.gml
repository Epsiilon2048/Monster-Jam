
if signal
{
	signal ++
	
	if signal > SIGNAL_REPEATS
	{
		sprite_index = spr_scanner
		signal = false
	}
}