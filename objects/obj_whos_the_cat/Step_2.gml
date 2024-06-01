
var singleplayer = (instance_number(obj_player) <= 1)

draw_set_font(fnt_text)

var xx = x
var yy = y+string_height(" ")

draw_set_font(fnt_small)
var ch = string_height("a")

for(var i = 0; i <= array_length(avatar_surfaces)-1; i++)
{
	if not surface_exists(avatar_surfaces[i])
	{
		avatar_surfaces[i] = surface_create(500, 500)
	}
}

with obj_player
{
	yy += ch-3
	
	mouse_on_button = obj_menuinfo.cat_player != player_id and point_in_rectangle(
		obj_menuinfo.input.mx, obj_menuinfo.input.my, 
		xx, yy+1, xx+string_width(singleplayer ? "creature" : string_lower(player_name)), yy+ch
	)
	
	if mouse_on_button and obj_menuinfo.input.action_pressed
	{
		//obj_menuinfo.cat_player = player_id
		obj_whos_the_cat.is_random = false
	}
}

yy += ch+3
var r = singleplayer ? "hunter" : "random"

random_mouse_on = not is_random and point_in_rectangle(
	obj_menuinfo.input.mx, obj_menuinfo.input.my, 
	xx, yy+4, xx+string_width(r), yy+ch
)

if random_mouse_on and obj_menuinfo.input.action_pressed 
{
	is_random = true
	obj_menuinfo.cat_player = -1
}