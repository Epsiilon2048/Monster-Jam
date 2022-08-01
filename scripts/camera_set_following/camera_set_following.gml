
function camera_set_following(obj=self, jump=false){

obj_camera.target = obj

if jump 
{
	obj_camera.x = obj.x
	obj_camera.y = obj.y
}

camera_set_view_pos(view_camera[0], 
	round(clamp(obj_camera.x-game_width/2, 0, room_width-camera_get_view_width(view_camera[0]))),
	round(clamp(obj_camera.y-game_height/2, 0, room_height-camera_get_view_height(view_camera[0])))
)
}