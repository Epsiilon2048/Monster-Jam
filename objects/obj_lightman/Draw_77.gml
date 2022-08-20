
var scalex = win_width/game_width
var scaley = win_height/game_height

var se = surface_exists
var sc = surface_create
if !se(buffer_surface)	buffer_surface	= sc(game_width, game_height)
if !se(buffer_surface2)	buffer_surface2	= sc(game_width, game_height)

var read_surface = buffer_surface2
var write_surface = buffer_surface
var s

if instance_exists(o_stage)
{
	draw_surface(application_surface, 0, 0)
	exit
}

surface_set_target(read_surface)
draw_surface_stretched(application_surface, 0, 0, game_width, game_height)
surface_reset_target()

surface_set_target(write_surface)
var tex = surface_get_texture(write_surface)
shader_set(shd_lightmix)
shauni("u_ambient_intensity", obj_lightset.ambient_intensity+obj_local.local_is_cat*obj_lightset.cat_ambient)
shauni("u_light_mult", obj_lightset.light_mult)
shauni("u_vertical_pow", obj_lightset.vertical_pow)
shauni("u_vertical_factor", obj_lightset.vertical_factor)
shauni_surface("u_light", light_surface)
shauni_surface("u_mask", mask_surface)
shauni("u_texel", texture_get_texel_width(tex), texture_get_texel_height(tex))
draw_surface(read_surface, 0, 0)
shader_reset()
surface_reset_target()

s = read_surface
read_surface = write_surface
write_surface = s

if obj_local.local_is_cat
{
	surface_set_target(write_surface)
	shader_set(shd_kitty)
	shauni_color("u_vignette_color", c_black, , true)
	draw_surface(read_surface, 0, 0)
	shader_reset()
	surface_reset_target()
	
	s = read_surface
	read_surface = write_surface
	write_surface = s
}

if	not obj_local.local_is_cat and instance_exists(obj_local.local_player) and instance_exists(obj_local.local_player.object) 
	and obj_local.local_player.object.dead
{
	surface_set_target(write_surface)
	shader_set(shd_dead)
	draw_surface(read_surface, 0, 0)
	shader_reset()
	surface_reset_target()
	
	s = read_surface
	read_surface = write_surface
	write_surface = s
}
else
{
	shader_set(shd_chrab)
	shauni("u_dist", 1)
	shauni("u_texel", 1/win_width, 1/win_height)
	shauni("u_wave_time", step/pi/7)
	shauni("u_wave_intensity", obj_local.local_is_cat and instance_exists(obj_cat) and obj_cat.final_form)
	shauni("u_cam_y", cam_y)
}

draw_surface_ext(read_surface, 0, 0, scalex, scaley, 0, c_white, 1)
shader_reset()

//shader_set(shd_alpha)
if draw_normal_surface draw_surface_ext(normal_surface, 0, 0, scalex, scaley, 0, c_white, 1)
if draw_light_surface draw_surface_ext(light_surface, 0, 0, scalex, scaley, 0, c_white, 1)
if draw_mask_surface draw_surface_ext(mask_surface, 0, 0, scalex, scaley, 0, c_white, 1)
//shader_reset()