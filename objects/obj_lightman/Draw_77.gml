
//gpu_set_blendmode_ext(bm_one, bm_zero);
shader_set(shd_lightmix)
shauni("u_ambient_intensity", obj_lightset.ambient_intensity)
shauni_surface("u_light", light_surface)
shauni_surface("u_mask", mask_surface)
shauni("u_texel", 1/game_width, 1/game_height)
draw_surface_ext(application_surface,0,0,4,4,0,c_white,1);
shader_reset()
gpu_set_blendmode(bm_normal);

//shader_set(shd_alpha)
if draw_normal_surface draw_surface_ext(normal_surface, 0, 0, 4, 4, 0, c_white, 1)
if draw_light_surface draw_surface_ext(light_surface, 0, 0, 4, 4, 0, c_white, 1)
if draw_mask_surface draw_surface_ext(mask_surface, 0, 0, 4, 4, 0, c_white, 1)
//shader_reset()