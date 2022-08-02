
///@param [hsp]
///@param [vsp]
///@param [speed_preservation_factor]
function move_collide(hsp=0, vsp=0){

var hblocked = false
var vblocked = false

// Normalize
var hdir = sign(hsp)
var vdir = sign(vsp)
var hinc = hdir
var vinc = vdir

if		abs(hsp) > abs(vsp) vinc = abs(vsp/hsp)*sign(vsp)
else if	abs(hsp) > abs(vsp) hinc = abs(hsp/vsp)*sign(hsp)

var hside
var vside

while not (hsp == 0 or hblocked) or not (vsp == 0 or vblocked)
{
	if hdir == 1	hside = bbox_right
	else			hside = bbox_left
	
	if vdir == 1	vside = bbox_bottom
	else			vside = bbox_top
	
	if hsp != 0 
	{
		if point_colliding(hside + hinc, bbox_top) or point_colliding(hside + hinc, bbox_bottom)
		{
			if hdir == 1
			{
				x = floor(x)
			}
			else
			{
				x = ceil(x)
			}
			
			var _hinc = hinc
			
			hsp -= _hinc
			hblocked = true
		}
		else
		{
			if abs(hinc) > abs(hsp)
			{
				if abs(hsp) > 1 hinc = 0
				else hinc = hsp
			}
			
			x += hinc
			hsp -= hinc
			
			if sign(hsp) != hdir
			{
				hsp = 0
				hinc = 0
			}
		
			hblocked = false
		}
	}
	
	if vsp != 0 
	{
		if point_colliding(bbox_left, vside + vinc) or point_colliding(bbox_right, vside + vinc)
		{
			if vdir == 1
			{
				y = floor(y)
			}
			else
			{
				y = ceil(y)
			}
			
			var _vinc = vinc
			
			vsp -= _vinc
			vblocked = true
		}
		else
		{
			if abs(vinc) > abs(vsp)
			{
				if abs(vsp) > 1 vinc = 0
				else vinc = vsp
			}
			
			y += vinc
			vsp -= vinc
			
			if sign(vsp) != vdir
			{				
				vsp = 0
				vinc = 0
			}
		
			vblocked = false
		}
	}
}

return hblocked or vblocked
}

function move_collide_lendir(spd, dir=gravity_direction){

return move_collide(lengthdir_x(spd, dir), lengthdir_y(spd, dir))
}