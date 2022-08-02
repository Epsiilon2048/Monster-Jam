
BLAST_RADIUS = 60
SPD_LERP = 0.07

ring = -1
spd = 7
emission_color = monster_red

draw_radius = function(){
	
	if ring > 0
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
	draw_radius()
}