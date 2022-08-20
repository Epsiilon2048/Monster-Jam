
function draw_catvision_notice(){

static xx = 6
static yy = game_height-15
static under_yy = 12

draw_set_color(monster_red)
draw_set_font(fnt_text)
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)

var n = clamp((3*60-catvision_time)/30, 0, 2)
var n2 = min(n, 1)

if n > 0
{
	draw_set_alpha(n/2)
	draw_text(xx, yy+under_yy, "You are visible!")
	draw_set_alpha(1)
}

draw_text(xx, yy+under_yy*(1-n2*n2), "CATVISION")

draw_set_color(c_white)
}