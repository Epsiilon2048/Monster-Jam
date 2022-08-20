
function px_lerp(cam_l, sprite_l, stage_l){
	
//return 1 - (sprite_l - (cam_l*( 1 - (sprite_l-cam_l) / (stage_l-cam_l) )) )/stage_l
return 1 - (sprite_l-cam_l) / (stage_l-cam_l)
}


function calc_px_info(stage_x, stage_y, stage_w, stage_h, stage_ox, stage_oy, cx, cy, cw, ch){

static calc = function(stage_p, stage_l, stage_o, cam_p, cam_l){

return {
	stage_p: 
		stage_p - (stage_o-stage_l/2)				// Starting from stage position
	,
	cam_o: 
		- cam_p										// Offset so that the camera position is the zero
		+ max(0, cam_p - (stage_p+stage_l-cam_l))	// Correct for when the stage is behind the camera
		- max(0, stage_p - cam_p)					// Correct for when the stage is in front of the camera
	,
}
}

var px = calc(stage_x, stage_w*scale, stage_ox*scale, cx*scale, cw*scale)
var py = calc(stage_y, stage_h*scale, stage_oy*scale, cy*scale, ch*scale)

global.px_cam_x = cx
global.px_cam_y = cy
global.px_stage_x = px.stage_p
global.px_stage_y = py.stage_p
global.px_cam_ox = px.cam_o
global.px_cam_oy = py.cam_o
}



function px_offset(px, sprite_p, is_x=true){

var stage_p	= is_x ? global.px_stage_x : global.px_stage_y
var cam_p	= is_x ? global.px_cam_x : global.px_cam_y
var cam_o	= is_x ? global.px_cam_ox : global.px_cam_oy

return
(
	lerp(stage_p, cam_p, px)	// Starting from stage position, interpolate to camera position
	+ sprite_p					// Correct for sprite position
	+ cam_o						// Offset to camera position
	
)	*scale					// Scale everything
}