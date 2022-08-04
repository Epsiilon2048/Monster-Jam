
function create_map_surface(surface=map_surface){ with obj_gui {

if not surface_exists(map_surface) or not layer_exists("Collision") exit

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
	var tile = tilemap_get(tilemap, xx, yy)
	if tile
	{
		draw_set_color(crew_purple)
		draw_point(xx, yy)
		continue
	}
}
draw_set_color(c_white)
surface_reset_target()
}}