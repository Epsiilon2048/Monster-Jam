
function point_colliding(xx, yy){

return 
	0 > xx or xx > room_width or
	0 > yy or yy > room_height or
	tilemap_get_at_pixel(layer_tilemap_get_id("Collision"), xx, yy) or
	instance_position(xx, yy, obj_colltile)
}