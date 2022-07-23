//draw the background then the application surface 
//draw_clear_alpha(c_teal,1);

gpu_set_blendmode_ext(bm_one, bm_zero);
shader_set(shd_lightmix)
shauni_surface("u_light", light_surface)
shauni_surface("u_mask", mask_surface)
draw_surface_ext(application_surface,0,0,4,4,0,c_white,1);
shader_reset()
gpu_set_blendmode(bm_normal);

if draw_normal_surface draw_surface_ext(normal_surface, 0, 0, 4, 4, 0, c_white, 1)
if draw_light_surface draw_surface_ext(light_surface, 0, 0, 4, 4, 0, c_white, 1)
if draw_mask_surface draw_surface_ext(mask_surface, 0, 0, 4, 4, 0, c_white, 1)