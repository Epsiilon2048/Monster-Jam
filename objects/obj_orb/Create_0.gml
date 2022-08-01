
step = 0
emission_color = c_white
dying = false

if collision_point(x, y, obj_orb, false, true) 
{
	dying = true
	visible = false
	instance_destroy()
}