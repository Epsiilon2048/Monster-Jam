
function create_map_surface(surface){

var tilemap = layer_tilemap_get_id("Collision")
var width = tilemap_get_width(tilemap)
var height = tilemap_get_height(tilemap)
var tile_width = tilemap_get_tile_width(tilemap)
var tile_height = tilemap_get_tile_height(tilemap)

surface_resize(surface, width, height)
draw_clear_alpha(c_black, 0)
surface_set_target(surface)
for(var yy = 0; yy <= height; yy++)
for(var xx = 0; xx <= width; xx++)
{
	if position_meeting(xx*tile_width, yy*tile_height, obj_orb)
	{
		draw_set_color(c_white)
		draw_point(xx, yy)
		continue
	}
	
	var tile = tilemap_get(tilemap, xx, yy)
	if tile
	{
		draw_set_color(monster_red)
		draw_point(xx, yy)
		continue
	}
}
draw_set_color(c_white)
surface_reset_target()
}