
function points_colliding(x1, y1, x2, y2, points_between=-1, search_object=noone){

var searching = instance_exists(search_object)

if searching and points_between == -1
{
	points_between = point_distance(x1, y1, x2, y2) / 4
}

if points_between > 0 or searching
{
	var between_dist = point_distance(x1, y1, x2, y2)/(points_between+1)
	var dir = point_direction(x1, y1, x2, y2)
	var ldx = lengthdir_x(between_dist, dir)
	var ldy = lengthdir_y(between_dist, dir)
	var xx = x1
	var yy = y1

	for(var i = 0; i <= points_between+1; i++)
	{
		if point_colliding(xx, yy)
		{
			return not searching
		}
		
		if searching and position_meeting(xx, yy, search_object)
		{
			return true
		}
		
		xx += ldx
		yy += ldy
	}
	
	return false
}
else
{
	return point_colliding(x1, y1) or point_colliding(x2, y2)
}
}