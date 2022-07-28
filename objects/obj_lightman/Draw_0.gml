var _vb = vb
var _vx = vx
var _vy = vy

if not surface_exists(light_surface)
{
	light_surface = surface_create(320, 180)
}

if not surface_exists(mask_surface)
{
	mask_surface = surface_create(320, 180)
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
surface_reset_target()

//Draw lights and shadows
surface_set_target(light_surface)
draw_clear_alpha(c_black, 0)
draw_surface_ext(application_surface, _vx, _vy, 1, 1, 0, obj_lightset.shadow_color, obj_lightset.ambient_intensity)
with(obj_light){
	
	//Draw the shadows (AKA light blockers)
	gpu_set_blendmode_ext_sepalpha(bm_zero, bm_one, bm_one, bm_one)
	shader_set(shd_shadow)
	shauni("u_pos", x, y)
	vertex_submit(_vb, pr_trianglelist, -1)
	
	//Draw the Light
	gpu_set_blendmode_ext_sepalpha(bm_inv_dest_alpha, bm_one, bm_zero, bm_zero)
	shader_set(shd_light)
	shauni("u_pos", x, y)
	shauni("zz", size)
	shauni("u_str", str)
	shauni("u_fov", fov)
	shauni("u_dir", dir)
	
	shauni("reflection", obj_lightset.reflection)
	shauni("diffusion", obj_lightset.diffusion)
	
	//shauni_surface("u_nmap", obj_lightman.normal_surface)
	shauni_surface("u_mask", obj_lightman.mask_surface)
	//draw_rectangle_color(_vx, _vy, _vx+320, _vy+180, color, color, color, color, 0) //canvas for drawing the light
	draw_surface_ext(application_surface, _vx, _vy, 1, 1, 0, color, 1)
}
shader_reset()
surface_reset_target()
matrix_set(matrix_world, matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1))

//Draw and blend the shadow surface to the application surface
//gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha)
gpu_set_blendmode(bm_normal)

//shader_set(shd_light_hide)
//shauni_surface("u_light", light_surface)
//shauni_surface("u_mask", mask_surface)
draw_depth_instances()
//shader_reset()

//shader_set(shd_lightmix)
//shauni_surface("u_light", light_surface)
//shauni_surface("u_mask", mask_surface)
//draw_surface(application_surface, vx, vy)
//shader_reset()
//gpu_set_blendmode(bm_normal)