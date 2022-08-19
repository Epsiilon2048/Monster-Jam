
if not surface_exists(surface)
{
	surface = surface_create(width, height)
}

var asset = asset_get_index(sprite_name)
if asset != -1 and sprite != asset 
{
	sprite = asset
	width = sprite_get_width(sprite)
	height = sprite_get_height(sprite)
	offsetx = sprite_get_xoffset(sprite)
	offsety = sprite_get_yoffset(sprite)
	surf_x = gui_width/2-width/2*scale
	surf_y = gui_height/2-height/2*scale
	array = array_create(width, -1)
	surface_resize(surface, width, height)
}

if mouse_check_button_pressed(mb_middle)
{
	mx = gui_mx
	my = gui_my
}
else if mouse_check_button(mb_middle)
{
	surf_x += gui_mx-mx
	surf_y += gui_my-my
	mx = gui_mx
	my = gui_my
}

draw_sprite_ext(sprite, 0, surf_x+offsetx*scale, surf_y+offsety*scale, scale, scale, 0, c_white, 1)
draw_surface_ext(surface, surf_x, surf_y, scale, scale, 0, c_white, 1)
draw_rectangle(surf_x, surf_y, surf_x+width*scale, surf_y+height*scale, true)

var cx = floor(gui_mx/scale)*scale + (surf_x - floor(surf_x/scale)*scale)
var cy = floor(gui_my/scale)*scale + (surf_y - floor(surf_y/scale)*scale)

draw_rectangle(cx, cy, cx+scale, cy+scale, true)

var px = clamp((cx-surf_x)/scale, 0, width-1)
if mouse_check_button(mb_left)
{
	var py = clamp(cy-surf_y, 0, height*scale)/(height*scale)
	array[px] = py
	
	surface_set_target(surface)	
	draw_point_color(px, 0, merge_color(0x00FF00, c_black, py))
	surface_reset_target()
}
else if mouse_check_button(mb_right)
{
	array[px] = -1
	
	surface_set_target(surface)
	gpu_set_blendmode(bm_subtract)
	draw_point_color(px, 0, c_white)
	gpu_set_blendmode(bm_normal)
	surface_reset_target()
}

draw_set_alpha(0.2)
draw_set_color(c_grey)
for(var i = 0; i <= width-1; i++)
{
	if array[i] >= 0 
	{
		var xx = surf_x+i*scale
		var yy = surf_y+floor(array[i]*height)*scale
		draw_rectangle(xx, yy, xx+scale, yy+scale, false)
	}
}
draw_set_color(c_white)
draw_set_alpha(1)