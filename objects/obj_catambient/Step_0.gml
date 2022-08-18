
if not instance_exists(obj_cat)
{
	instance_destroy()
	exit
}

color = monster_red//merge_color(c_white, monster_red, 0.3)
on = not obj_cat.catvision

x = obj_cat.x
y = obj_cat.y