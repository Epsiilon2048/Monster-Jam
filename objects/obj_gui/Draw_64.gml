
if not obj_lightman.cat_is_local
{
	var scanner = noone

	with obj_scanner
	{
		if signal 
		{
			scanner = self
			break
		}
	}
	
	if instance_exists(scanner)
	{
		var w = cam_width
		var h = cam_height

		var xx = cam_x+w/2
		var yy = cam_y+h/2
		direction = point_direction(xx, yy, mouse_x, mouse_y)

		var ldx = lengthdir_x(1, direction)
		var ldy = lengthdir_y(1, direction)

		var left = cam_x
		var top = cam_y
		var right = cam_x+w
		var bottom = cam_y+h
		var i = 0

		while left < bbox_left and bbox_right < right and top < bbox_top and bbox_bottom < bottom
		{
			xx += ldx
			yy += ldy
	
			i ++
			if i > w*2 break
		}

		var w = cam_width
		var h = cam_height

		xx -= cam_x
		yy -= cam_y
		x = xx
		y = yy
		draw_self()
	}
}