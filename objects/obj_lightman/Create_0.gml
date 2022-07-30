//Resize the application surface to be lower res (for pixel games + performance boost)
surface_resize(application_surface, 320, 180)
display_set_gui_maximize()

//turn of automaic drawing of application surface
application_surface_draw_enable(false)

//view coordinates
vx = 0
vy = 0

vertex_format_begin()
vertex_format_add_position_3d()
vf = vertex_format_end()
vb = vertex_create_buffer()

light_surface = -1
mask_surface = -1
depth_surface = -1


function BGbegin(){
	gpu_set_colorwriteenable(1, 1, 1, 0)
}

function BGend(){
	gpu_set_colorwriteenable(1, 1, 1, 1)
}

var _bg_layer = layer_get_id("Background")
var _bg_layer2 = layer_get_id("Background2")
layer_script_begin(_bg_layer, BGbegin)
layer_script_end(_bg_layer2, BGend)


// Normal layer functions
buffer_surface = -1
global.vx = 0
global.vy = 0

function layer_normal_begin(){
	//if not surface_exists(obj_lightman.normal_surface) 
	//{
	//	obj_lightman.normal_surface = surface_create(320, 180)
	//}
	//surface_set_target(obj_lightman.normal_surface)
	//matrix_set(matrix_world, matrix_build(-global.vx, -global.vy, 0, 0, 0, 0, 1, 1, 1))
	//draw_clear_alpha(c_white, 0)
}

function layer_normal_end(){
	//surface_reset_target()
	//matrix_set(matrix_world, matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1))
}

var _n_layer = layer_get_id("Normal")
layer_script_begin(_n_layer, layer_normal_begin)
layer_script_end(_n_layer, layer_normal_end)

draw_light_surface = false
draw_normal_surface = false
draw_mask_surface = false

depth_list = ds_grid_create(2, 1)
depth_objects = [
	obj_robo,
	obj_cat,
	obj_scanner,
	obj_wall,
]

cat_is_local = false