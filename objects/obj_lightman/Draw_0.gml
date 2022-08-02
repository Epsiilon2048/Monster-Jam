var _vb = vb
var _vx = vx
var _vy = vy

if not surface_exists(light_surface)
{
	light_surface = surface_create(game_width, game_height)
}

if not surface_exists(mask_surface)
{
	mask_surface = surface_create(game_width, game_height)
}

if not surface_exists(depth_surface)
{
	depth_surface = surface_create(game_width, game_height)
}

if not surface_exists(buffer_surface)
{
	buffer_surface = surface_create(game_width, game_height)
}

sort_instance_depths()

matrix_set(matrix_world, matrix_build(-vx, -vy, 0, 0, 0, 0, 1, 1, 1))

//Draw Normal
//surface_set_target(normal_surface)
//shader_set(shd_norm_neutral)
//with(obj_robo){
//	draw_self()	
//}
//shader_reset()
//surface_reset_target()

//Draw vertical mask
surface_set_target(mask_surface)
draw_clear_alpha(c_black, 0)
shader_set(shd_mask)
draw_depth_instances(mask_before_script)
shader_reset()
with obj_bomb
{
	gpu_set_blendmode(bm_add)
	draw_radius()
	gpu_set_blendmode(bm_normal)
}
surface_reset_target()

//Draw lights and shadows
surface_set_target(light_surface)
draw_clear_alpha(c_black, 0)
gpu_set_ztestenable(true)
gpu_set_zwriteenable(true)
var z = 0

var l = obj_light
repeat 2
{
	with(l){
		//Draw the shadows (AKA light blockers)
		if shadows
		{
			gpu_set_blendmode(bm_normal)
			shader_set(shd_shadow)
			shauni("u_pos", x, y)
			shauni("u_z", z)
			vertex_submit(_vb, pr_trianglelist, -1)
		}
	
		//Draw the Light
		gpu_set_blendmode(bm_add)
		//gpu_set_blendmode_ext_sepalpha(bm_inv_dest_alpha, bm_one, bm_zero, bm_zero)
		shader_set(shd_light)
		shauni_color("u_color", color, , true)
		shauni("u_pos", x, y)
		shauni("u_z", z)
		shauni("zz", size)
		shauni("u_str", str)
		shauni("u_fov", fov)
		shauni("u_dir", dir)
		shauni("u_game_height", game_height)
	
		shauni("reflection", obj_lightset.reflection)
		shauni("diffusion", obj_lightset.diffusion)
	
		//shauni_surface("u_nmap", obj_lightman.normal_surface)
		shauni_surface("u_mask", obj_lightman.mask_surface)
		//draw_rectangle_color(_vx, _vy, _vx+game_width, _vy+game_height, color, color, color, color, 0) //canvas for drawing the light
		draw_surface_ext(obj_lightman.light_surface, _vx, _vy, 1, 1, 0, c_white, 1)
	
		z --
	}
	l = obj_locallight
}
gpu_set_ztestenable(false)
gpu_set_zwriteenable(false)
shader_reset()
surface_reset_target()

gpu_set_blendmode(bm_normal)
surface_set_target(depth_surface)
draw_clear_alpha(c_black, 0)
draw_depth_instances()
surface_reset_target()

matrix_set(matrix_world, matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1))

shader_set(shd_lighthide)
shauni("u_base_boost", obj_lightset.character_boost)
shauni("u_texh", 1/game_height)
shauni_surface("u_light", light_surface)
shauni_surface("u_mask", mask_surface)
draw_surface(depth_surface, vx, vy)
shader_reset()

//shader_set(shd_lightmix)
//shauni_surface("u_light", light_surface)
//shauni_surface("u_mask", mask_surface)
//draw_surface(application_surface, vx, vy)
//shader_reset()
//gpu_set_blendmode(bm_normal)