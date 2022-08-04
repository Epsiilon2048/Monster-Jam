
SPD = 1
RADIUS = 5
target = noone
target_x = 0
target_y = 0
dist = 0
dir = 0

surface_resize(application_surface, game_width, game_height)
camera_set_view_size(view_camera[0], game_width, game_height)
view_set_wport(0, game_width)
view_set_hport(0, game_height)
//view_wport[0] = game_width
//view_hport[0] = game_height