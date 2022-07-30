
var scalex = win_width/game_width
var scaley = win_height/game_height

var read_surface = application_surface
var write_surface = buffer_surface
var s

surface_set_target(write_surface)
shader_set(shd_lightmix)
shauni("u_ambient_intensity", obj_lightset.ambient_intensity+cat_is_local*obj_lightset.cat_ambient)
shauni_surface("u_light", light_surface)
shauni_surface("u_mask", mask_surface)
shauni("u_texel", 1/game_width, 1/game_height)
draw_surface(read_surface, 0, 0)
shader_reset()
surface_reset_target()

s = read_surface
read_surface = write_surface
write_surface = s

//surface_set_target(write_surface)
//shader_set(shd_chrab)
//shauni("u_dist", 1)
//shauni("u_texel", 1/game_width, 1/game_height)
//draw_surface(read_surface, 0, 0)
//shader_reset()
//surface_reset_target()
//
//s = read_surface
//read_surface = write_surface
//write_surface = s

shader_set(shd_chrab)
shauni("u_dist", 1)
shauni("u_texel", 1/win_width, 1/win_height)
draw_surface_ext(read_surface, 0, 0, scalex, scaley, 0, c_white, 1)
shader_reset()



//shader_set(shd_alpha)
if draw_normal_surface draw_surface_ext(normal_surface, 0, 0, scalex, scaley, 0, c_white, 1)
if draw_light_surface draw_surface_ext(light_surface, 0, 0, scalex, scaley, 0, c_white, 1)
if draw_mask_surface draw_surface_ext(mask_surface, 0, 0, scalex, scaley, 0, c_white, 1)
//shader_reset()