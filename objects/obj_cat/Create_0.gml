
emission_color = c_white

x = obj_catspawn.x
y = obj_catspawn.y

state = obj_catman.state_stand

if player.player_local
{
	instance_create_depth(x, y, 0, obj_camera)
	camera_set_following()
}

cat_get_input()