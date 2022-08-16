
function draw_whos_the_cat(){ with obj_whos_the_cat {

var singleplayer = (instance_number(obj_player) <= 1)
var w = singleplayer ? "Which will you be?" : "Who shall be the creature?"

draw_set_font(fnt_text)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

var ch = string_height(" ")

draw_set_color(c_gray)
draw_text(x, y, w)
draw_set_color(c_white)

var xx = x
var yy = y+string_height(" ")

draw_set_font(fnt_small)
draw_set_halign(fa_left)
draw_set_valign(fa_top)


var ch = string_height(" ")

with obj_player
{
	if singleplayer
	{
		yy += ch-3
		if obj_menuinfo.cat_player == player_id draw_set_color(monster_red)
		else if mouse_on_button draw_set_color(c_gray)
		draw_text(xx, yy, singleplayer ? "creature" : string_lower(player_name))
		draw_set_color(c_white)
	}
	else
	{
		//if obj_whos_the_cat.avatar_surfaces[player_id] == -1
		{
			//obj_whos_the_cat.avatar_surfaces[player_id] = surface_create(500, 500)
			surface_set_target(obj_whos_the_cat.avatar_surfaces[player_id])
			draw_sprite_stretched(player_avatar_sprite, 0, 0, 0, 500, 500)
			gpu_set_blendmode(bm_subtract)
			draw_sprite_stretched(spr_avatar_cutout, 0, 0, 0, 500, 500)
			gpu_set_blendmode(bm_normal)
			surface_reset_target()
		}
		
		gpu_set_tex_filter(true)
		draw_surface_stretched(obj_whos_the_cat.avatar_surfaces[player_id], xx, yy, 17, 17)
		gpu_set_tex_filter(false)
		
		draw_ellipse(xx, yy, xx+17, yy+17, true)
		
		yy += 19
		if obj_menuinfo.cat_player == player_id draw_set_color(monster_red)
		else if mouse_on_button draw_set_color(c_gray)
		draw_text(xx, yy, string_lower(player_name))
		draw_set_color(c_white)
	}
}

yy += ch+3
var r = singleplayer ? "hunter" : "random"

if is_random draw_set_color(monster_red)
else if random_mouse_on draw_set_color(c_gray)
draw_text(xx, yy, r)
draw_set_color(c_white)

}}