
init()

target_x = mouse_x
target_y = mouse_y
	
dist = point_distance(x, y, target_x, target_y)
dir = point_direction(x, y, target_x, target_y)

_mx = lerp(_mx, clamp(target_x, game_width/2, stage.width-game_width/2), 0.04)
_my = lerp(_my, clamp(target_y, game_height/2, stage.height-game_height/2), 0.04)

_cam_x = clamp(_mx-game_width/2, 0, stage.width-cam_width)
_cam_y = clamp(_my-game_height/2, 0, stage.height-cam_height)