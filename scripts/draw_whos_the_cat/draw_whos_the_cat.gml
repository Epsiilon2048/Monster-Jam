
function draw_whos_the_cat(){ with obj_whos_the_cat {
	
draw_set_font(fnt_text)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

var ch = string_height(" ")

draw_set_color(c_gray)
draw_text(x, y, "Who shall be the creature?")
draw_set_color(c_white)

var yy = y+6

with obj_player
{
	yy += ch-3
	if obj_menuinfo.cat_player == player_id draw_set_color(monster_red)
	else if mouse_on_button draw_set_color(c_gray)
	draw_text(obj_whos_the_cat.x, yy, player_name)
	draw_set_color(c_white)
}

yy += ch+3
var r = "Random"
if instance_number(obj_player) <= 1 r = "No one"

if is_random draw_set_color(monster_red)
else if random_mouse_on draw_set_color(c_gray)
draw_text(x, yy, r)
draw_set_color(c_white)

}}