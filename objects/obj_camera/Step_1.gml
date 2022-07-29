
if instance_exists(object_following)
{
	x = object_following.x
	y = object_following.bbox_bottom - (object_following.bbox_bottom-object_following.bbox_top)/2
	camera_set_view_pos(view_camera[0], x-game_width/2, y-game_height/2)
}