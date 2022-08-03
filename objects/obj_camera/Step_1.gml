
if instance_exists(target)
{
	target_x = target.x
	target_y = target.bbox_bottom - (target.bbox_bottom - target.bbox_top)/2
	
	dist = point_distance(x, y, target_x, target_y)
	dir = point_direction(x, y, target_x, target_y)
	
	if dist > RADIUS
	{
		x = lerp(x, target_x-lengthdir_x(RADIUS, dir), SPD)
		y = lerp(y, target_y-lengthdir_y(RADIUS, dir), SPD)
		camera_set_view_pos(view_camera[0], 
			floor(clamp(x-game_width/2, 0, room_width-cam_width)),
			floor(clamp(y-game_height/2, 0, room_height-cam_height))
		)
	}
}
else
{
	var lx = gui_mx/game_width
	var ly = gui_my/game_height
	target_x = clamp(lerp(0, room_width, lx), game_width/2, room_width-game_width/2)
	target_y = clamp(lerp(0, room_height, ly), game_height/2, room_height-game_height/2)
	
	x = lerp(x, target_x, 0.03)
	y = lerp(y, target_y, 0.03)
	
	camera_set_view_pos(view_camera[0], 
		floor(clamp(x-game_width/2, 0, room_width-cam_width)),
		floor(clamp(y-game_height/2, 0, room_height-cam_height))
	)
}