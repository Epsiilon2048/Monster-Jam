emission = 0
z = 0

BLAST_RADIUS = 30
SPD_LERP = 0.07

ring = -1
spd = 7
emission_color = c_white

draw_radius = function(){
	
	if ring > 0 and (1 - ring/10) > 0
	{
		draw_set_color(c_red)
		draw_set_alpha(1 - ring/10)
		draw_circle(x, y, BLAST_RADIUS*min(1, ring), true)
		draw_set_alpha(1)
		draw_set_color(c_white)
	}
}

draw = function(){
	draw_self()
	if ring > 0 and (1 - ring/10) > 0
	{
		draw_set_color(0xE16E5B)
		draw_set_alpha(1 - ring/10)
		draw_circle(x, y, BLAST_RADIUS*min(1, ring), true)
		draw_set_alpha(1)
		draw_set_color(c_white)
	}
}