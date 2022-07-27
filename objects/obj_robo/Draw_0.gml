
draw_self()

state.draw(self)

var text = ""

if obj_roboman.draw_player_id
{
	text += " / "+string(player.player_id)
}

if obj_roboman.draw_state
{
	text += " / "+state.name
}

if text != ""
{
	draw_set_font(fnt_text)
	draw_set_halign(fa_center)
	draw_set_valign(fa_bottom)
	draw_text(x, bbox_top, slice(text, 4))
}