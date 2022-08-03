
function draw_map(){

var width = surface_get_width(map_surface)
var height = surface_get_height(map_surface)

var xx = game_width-width-5
var yy = game_height-height-5

//draw_set_alpha(.7)
//draw_set_color(c_black)
//draw_rectangle(xx, yy, xx+width-1, yy+height-1, false)
//draw_set_alpha(1)
var colstep = (floor(step/3) mod 3)

draw_set_color(monster_red)
with obj_scanner
{
	var scanx1 = xx+x/room_width*width
	var scany1 = yy+y/room_height*height-1
	draw_rectangle(scanx1, scany1, scanx1, scany1, false)
	
	if signal
	{
		draw_set_color(colstep ? monster_red : c_black)
		draw_circle(xx+obj_cat.x/room_width*width, yy+obj_cat.y/room_height*height-1, 1.5, true)
	}
}

draw_surface_ext(map_surface, xx, yy, 1, 1, 0, c_white, 0.6)

draw_set_color(colstep ? c_aqua : c_black)
var catx = xx+obj_local.local_player.object.x/room_width*width
var caty = yy+obj_local.local_player.object.y/room_height*height-1
draw_rectangle(catx, caty, catx, caty, false)

draw_set_color(robo_blue)
with obj_bomb
{
	var bombx = xx+x/room_width*width
	var bomby = yy+y/room_height*height-1
	draw_rectangle(bombx, bomby, bombx, bomby, false)
}

draw_set_color(c_white)
with obj_orb
{
	var orbx = xx+x/room_width*width
	var orby = yy+y/room_height*height-1
	draw_rectangle(orbx, orby, orbx, orby, false)
}
}