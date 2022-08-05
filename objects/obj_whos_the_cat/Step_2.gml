
draw_set_font(fnt_text)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

var ch = string_height(" ")

var xx = x
var yy = y+6

with obj_player
{
	yy += ch-3
	
	mouse_on_button = obj_menuinfo.cat_player != player_id and point_in_rectangle(
		obj_menuinfo.input.mx, obj_menuinfo.input.my, 
		xx, yy+4, xx+string_width(player_name), yy+ch
	)
	
	if mouse_on_button and obj_menuinfo.input.action_pressed
	{
		obj_menuinfo.cat_player = player_id
		obj_whos_the_cat.is_random = false
	}
}

yy += ch+3

var r = "Random"
if instance_number(obj_player) <= 1 r = "No one"

random_mouse_on = not is_random and point_in_rectangle(
	obj_menuinfo.input.mx, obj_menuinfo.input.my, 
	xx, yy+4, xx+string_width(r), yy+ch
)

if random_mouse_on and obj_menuinfo.input.action_pressed 
{
	is_random = true
	obj_menuinfo.cat_player = -1
}