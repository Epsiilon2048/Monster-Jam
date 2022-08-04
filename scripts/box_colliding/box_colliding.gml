
function box_colliding(x, y){

var originx = sprite_get_xoffset(sprite_index)
var originy = sprite_get_yoffset(sprite_index)

var left = x+sprite_get_bbox_left(sprite_index)-originx
var top = y+sprite_get_bbox_top(sprite_index)-originy
var right = x+sprite_get_bbox_right(sprite_index)-originx
var bottom = y+sprite_get_bbox_bottom(sprite_index)-originy

return
	point_colliding(left, top) or
	point_colliding(right, top) or
	point_colliding(right, bottom) or
	point_colliding(left, bottom)
}