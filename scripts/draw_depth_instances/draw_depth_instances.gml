
function draw_depth_instances(before_script=noscript, after_script=noscript){

if instance_exists(o_stage)
{
	exit
}

for(var i = 0; i <= ds_grid_height(depth_list)-1; i++)
{
	with depth_list[# 0, i] 
	{
		before_script()
		if variable_instance_exists(self, "draw") draw()
		else if z == 0 draw_self()
		else draw_sprite_ext(sprite_index, image_index, x, y-z, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
		after_script()
	}
}
}


global.mask_u_y = shader_get_uniform(shd_mask, "u_y")
global.mask_u_emission_color = shader_get_uniform(shd_mask, "u_emission_color")
global.mask_u_emission_add = shader_get_uniform(shd_mask, "u_emission_add")
global.mask_u_texel = shader_get_uniform(shd_mask, "u_texel")

function mask_before_script(){

var local = (object_index == obj_robo or object_index == obj_cat) and instance_exists(player) and player.player_local

var e = emission + (local ? 0.2 : 0)
var c = emission_color

shader_set_uniform_f(global.mask_u_y, (y-cam_y)/game_height)
shader_set_uniform_f(global.mask_u_emission_color, color_get_red(c)/255, color_get_green(c)/255, color_get_blue(c)/255, 1)
shader_set_uniform_f(global.mask_u_emission_add, e)

var tex = sprite_get_texture(sprite_index, image_index)
shader_set_uniform_f(global.mask_u_texel, texture_get_texel_width(tex), texture_get_texel_height(tex))
}

global.shadow_u_pos = shader_get_uniform(shd_shadow, "u_pos")
global.shadow_u_z = shader_get_uniform(shd_shadow, "u_z")

global.light_u_color = shader_get_uniform(shd_light, "u_color")
global.light_u_pos = shader_get_uniform(shd_light, "u_pos")
global.light_u_z = shader_get_uniform(shd_light, "u_z")
global.light_zz = shader_get_uniform(shd_light, "zz")
global.light_u_str = shader_get_uniform(shd_light, "u_str")
global.light_u_fov = shader_get_uniform(shd_light, "u_fov")
global.light_u_dir = shader_get_uniform(shd_light, "u_dir")
global.light_u_game_height = shader_get_uniform(shd_light, "u_game_height")
global.light_reflection = shader_get_uniform(shd_light, "reflection")
global.light_diffusion = shader_get_uniform(shd_light, "diffusion")
global.light_u_mask = shader_get_sampler_index(shd_light, "u_mask")