
function camera_set_following(obj=self, jump=false){

obj_camera.target = obj

if jump 
{
	obj_camera.x = obj.x
	obj_camera.y = obj.y
}
}