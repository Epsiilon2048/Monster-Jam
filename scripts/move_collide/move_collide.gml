
function move_collide(hsp, vsp){

if hsp == 0 and vsp == 0 exit

var iter = max(abs(hsp), abs(vsp))

var hinc = hsp/iter
var vinc = vsp/iter

var hincsign = sign(hinc)
var vincsign = sign(vinc)

for(var i = 0; i <= iter; i++)
{
	if hincsign == -1
	{
		if points_colliding(bbox_left+hinc, bbox_bottom, bbox_left+hinc, bbox_top)
		{
			hinc = 0
		}
	}
	else if hincsign == 1
	{
		if points_colliding(bbox_right+hinc, bbox_bottom, bbox_right+hinc, bbox_top)
		{
			hinc = 0
		}
	}
	
	if vincsign == -1
	{
		if points_colliding(bbox_right, bbox_top+vinc, bbox_left, bbox_top+vinc)
		{
			vinc = 0
		}
	}
	else if vincsign == 1
	{
		if points_colliding(bbox_right, bbox_bottom+vinc, bbox_left, bbox_bottom+vinc)
		{
			vinc = 0
		}
	}
	
	if hinc == 0 and vinc == 0 break
	
	x += hinc
	y += vinc
}
}