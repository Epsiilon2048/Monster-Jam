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