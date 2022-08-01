
function draw_map(){

static xx = 10
static yy = 20

var width = surface_get_width(map_surface)
var height = surface_get_height(map_surface)

draw_set_alpha(.8)
draw_set_color(c_black)
draw_rectangle(xx, yy, xx+width-1, yy+height-1, false)
draw_set_alpha(1)
draw_surface_ext(map_surface, xx, yy, 1, 1, 0, c_white, 0.7)

var colstep = (floor(step/2) mod 2)
draw_set_color(colstep ? monster_red : c_white)

var catx = xx+obj_cat.x/room_width*width
var caty = yy+obj_cat.y/room_height*height-1
draw_rectangle(catx, caty, catx, caty, false)

draw_set_color(c_white)
with obj_orb
{
	var orbx = xx+x/room_width*width
	var orby = yy+y/room_height*height-1
	draw_rectangle(orbx, orby, orbx, orby, false)
}
}