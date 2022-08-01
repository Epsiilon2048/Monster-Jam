
function point_colliding(xx, yy){

//with obj_wall 
//{
//	if point_in_rectangle(xx, yy, bbox_left, bbox_top+32, bbox_right, bbox_bottom)
//	{
//		return true
//	}
//}

return tilemap_get_at_pixel(layer_tilemap_get_id("Collision"), xx, yy)//position_meeting(xx, yy, obj_tri)
}