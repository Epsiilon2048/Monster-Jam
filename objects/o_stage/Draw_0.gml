
if not surface_exists(surface)
{
	surface = surface_create(stage.cam_w, stage.cam_h)	
}

if use_depth_map and not surface_exists(depth_map)
{
	depth_map = surface_create(stage.cam_w, stage.cam_h)	
}

if	surface_get_width (surface) != stage.cam_w or 
	surface_get_height(surface) != stage.cam_h
{
	surface_resize(surface, stage.cam_w, stage.cam_h)
}

in_bounds = true

if	cam_x+stage.cam_w < x or x+stage.width  < cam_x or
	cam_y+stage.cam_h < y or y+stage.height < cam_y
{
	in_bounds = false
	exit
}

if true
{
	surface_set_target(surface)
	draw_clear_alpha(c_black, 0)

	var prev_wlerp = 1
	var prev_hlerp = 1

	calc_px_info(x, y, stage.width, stage.height, stage.originx, stage.originy, cam_x, cam_y, stage.cam_w, stage.cam_h)

	for(var i = 0; i <= ds_list_size(stage.layers)-1; i++)
	{
		var this = stage.layers[| i]
	
		if this.hide continue
	
		gpu_set_blendmode(this.bm)
	
		if this.bind
		{
			this.true_wlerp = prev_wlerp
			this.true_hlerp = prev_hlerp
		}
		else
		{
			if this.wlerp == 1 this.true_wlerp = 1
			else this.true_wlerp = (this.wlerp + this.lerp_add*this.asp)*stage.lerp_mult
	
			if this.hlerp == 1 this.true_hlerp = 1
			else this.true_hlerp = (this.hlerp + this.lerp_add*this.asp)*stage.lerp_mult
		}
	
		prev_wlerp = this.true_wlerp
		prev_hlerp = this.true_hlerp
	
		this.x = px_offset(this.true_wlerp, this.originx - (this.originx+this.width /2)*this.lerp_add*this.asp, true)
		this.y = px_offset(this.true_hlerp, this.originy - (this.originy+this.height/2)*this.lerp_add*this.asp, false)
	
		this.before()
	
		//if stage.reveal == i
		//{
		//	shader_set(shd_silhouette)
		//	shauni_color("u_color", c_red, 1, true)
		//}
	
		var alpha = this.alpha * variable_struct_exists_get(stage.groups, this.group, 1)
		
		var pass = false
		repeat 2
		{
			//if pass
			//{
			//	shader_set(shd_silhouette)
			//	shauni_color("u_color", make_color_rgb(this.true_wlerp*255, 0, 0), 1, true)
			//	surface_reset_target()
			//	surface_set_target(depth_map)
			//}
			
			if alpha >= 1 draw_sprite_tiled(this.sprite, this.subimg, this.x, this.y)
			else draw_sprite_ext(this.sprite, this.subimg, this.x, this.y, 1, 1, 0, c_white, alpha)
			
			pass = false
			if not use_depth_map break
		}	
	
		if use_depth_map
		{
			surface_reset_target()
			surface_set_target(surface)
		}
		
		shader_reset()

		this.after()
	
		if this.anim > 0 and (global.step mod this.anim) < 1 this.subimg ++
	}

	gpu_set_blendmode(bm_normal)
	surface_reset_target()
}

stage.shader_script()
draw_surface_ext(
	surface,
	clamp(cam_x, x, x+stage.width-stage.cam_w),
	clamp(cam_y, y, y+stage.height-stage.cam_h),
	1/1, 1/1, 0,
	stage.color, 1
)
if shader_current() != -1 shader_reset()

if guides
{
	for(var i = 0; i <= ds_list_size(stage.layers)-1; i++)
	{
		var this = stage.layers[| i]
	
		if not this.hide draw_circle_color(
			x + stage.width/2  + this.x + (this.width  - stage.cam_w)/2,
			y + stage.height/2 + this.y + (this.height - stage.cam_h)/2,
			this.width/stage.cam_w*1.4 + 1.3,
			c_red, c_red, global.selected != this
		)
	}
	
	draw_rectangle_color(
		x, y,
		x+stage.width, y+stage.height,
		c_red, c_red, c_red, c_red,
		true
	)
	
	draw_line_color(x, y+stage.originy, x+stage.width, y+stage.originy, c_red, c_red)
	draw_line_color(x+stage.originx, y, x+stage.originx, y+stage.height, c_red, c_red)
}

if	x < obj_camera.x and obj_camera.x < x+stage.width and
	y < obj_camera.y and obj_camera.y < y+stage.height
{
	global.camera_over = id	
}