
function draw_bar(){

static xx = game_width/2
static yy = game_height/4.5

static bar_alpha = 0
static text_alpha = 0
static message2 = false
static text2_time = 0
static finished = false

if bar_time <= 0 
{
	bar_alpha = 0
	text_alpha = 0
	message2 = false
	text2_time = 0
	finished = false
	exit
}

if finished exit

var two_messages = bar_text2 != ""

var text = bar_text

if bar_time <= 4*60 and not two_messages
{
	bar_alpha = min(1, bar_alpha + 0.03)
}
if bar_time <= 3.5*60
{
	text_alpha = min(1, text_alpha + 0.02)
	if two_messages bar_alpha = min(1, bar_alpha + 0.03)
	
	message2 = false
}
if bar_time > 3.5*60 and not message2
{
	text_alpha = max(0, text_alpha - 0.02)
	if not two_messages bar_alpha = min(1, bar_alpha - 0.03)
	
	if text_alpha == 0
	{
		if two_messages
		{
			message2 = true
			text2_time = 0
		}
		else if bar_alpha == 0
		{
			finished = true
		}
	}
}
if bar_time > 3.5*60 and message2 and text2_time <= 3.5*60
{
	text = bar_text2
	text_alpha = min(1, text_alpha + 0.02)
	text2_time ++
}
if bar_time > 3.5*60 and text2_time > 3.5*60 and message2
{
	text = bar_text2
	text_alpha = min(1, text_alpha - 0.02)
	bar_alpha = min(1, bar_alpha - 0.03)
	text2_time ++
	
	if text_alpha == 0 finished = true
}



draw_sprite_ext(spr_bar, 0, xx, yy, 1, 1, 0, bar_color, bar_alpha)

var text_x = xx
var text_y = yy-1

draw_set_font(fnt_text)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(merge_color(c_black, bar_color, 0.4))
draw_set_alpha(text_alpha)
draw_text(text_x, text_y+1, text)
draw_set_color(bar_color)
draw_text(text_x, text_y, text)
draw_set_alpha(1)
draw_set_color(c_white)
}