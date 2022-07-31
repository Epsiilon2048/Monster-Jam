
if instance_exists(target)
{
	target_x = target.x
	target_y = target.bbox_bottom - (target.bbox_bottom-target.bbox_top)/2
	
	dist = point_distance(x, y, target_x, target_y)
	dir = point_direction(x, y, target_x, target_y)
	
	if dist > RADIUS
	{
		x = lerp(x, target_x-lengthdir_x(RADIUS, dir), SPD)
		y = lerp(y, target_y-lengthdir_y(RADIUS, dir), SPD)
		camera_set_view_pos(view_camera[0], 
			round(clamp(x-game_width/2, 0, room_width-camera_get_view_width(view_camera[0]))),
			round(clamp(y-game_height/2, 0, room_height-camera_get_view_height(view_camera[0])))
		)
	}
}