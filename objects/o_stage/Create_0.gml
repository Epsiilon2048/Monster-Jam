
x=0
y=0

obj_lightset.ambient_intensity = 1

stage = stages.grave

guides = false
in_bounds = false

init = function(){
	surface = surface_create(stage.cam_w, stage.cam_h)
	init = noscript
}

use_depth_map = false
draw_depth_map = false
depth_map = -1
surface = -1

_mx = 0
_my = 0
_cam_x = 0
_cam_y = 0