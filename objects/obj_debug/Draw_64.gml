
var text = ""


if draw_mouse_pos
{
	text += stitch("Mouse ",mouse_x," ",mouse_y,"\n")
}

if draw_win_dim
{
	text += stitch("Window ",window_get_width()," ",window_get_height(),"\n")
}


if text != "" 
{
	draw_set_font(fnt_text)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text(10, 10, text)
}