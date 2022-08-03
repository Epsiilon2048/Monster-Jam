
global.__shader_uniforms = {}
global.__current_uniform = -1

global.__shader_samplers = {}
global.__current_sampler = -1


function __declare_uniform(name, is_sampler=false){

if is_numeric(name)
{
	if is_sampler global.__current_sampler = name
	else global.__current_uniform = name
	exit
}

var current = shader_current()

if is_sampler
{	
	var pass = false
	if not variable_struct_exists(global.__shader_samplers, current)
	{
		global.__shader_samplers[$ current] = {}
		pass = true
		show_debug_message("SHAUNI / sampler / Indexed shader"+shader_get_name(current))
	}
	
	if pass or not variable_struct_exists(global.__shader_samplers[$ current], name)
	{
		global.__shader_samplers[$ current][$ name] = shader_get_sampler_index(current, name)
		show_debug_message("SHAUNI / sampler / Indexed uniform "+name+" from "+shader_get_name(current))
	}

	global.__current_sampler = global.__shader_samplers[$ current][$ name]
}
else
{
	var pass = false
	if not variable_struct_exists(global.__shader_uniforms, current)
	{
		global.__shader_uniforms[$ current] = {}
		pass = true
		show_debug_message("SHAUNI / uniform / Indexed shader "+shader_get_name(current))
	}
	
	if pass or not variable_struct_exists(global.__shader_uniforms[$ current], name)
	{
		global.__shader_uniforms[$ current][$ name] = shader_get_uniform(current, name)
		show_debug_message("SHAUNI / uniform / Indexed uniform "+name+" from "+shader_get_name(current))
	}

	global.__current_uniform = global.__shader_uniforms[$ current][$ name]
}
}



function shauni(name, x=0.0, y=0.0, z=0.0, w=0.0){

__declare_uniform(name)

shader_set_uniform_f(global.__current_uniform, x, y, z, w)
}



function shauni_int(name, a=0, b=0, c=0, d=0){

__declare_uniform(name)

shader_set_uniform_i(global.__current_uniform, x, y, z, w)
}



function shauni_texture(name, texture=surface_get_texture(surface_get_target())){

__declare_uniform(name, true)

texture_set_stage(global.__current_sampler, texture)
}



function shauni_surface(name, surface=surface_get_target()){

var texture = surface_get_texture(surface)
shauni_texture(name, texture)
}



function shauni_color(name, color=c_black, alpha=1.0, div255=false){

__declare_uniform(name)

var r = color_get_red(color)
var g = color_get_green(color)
var b = color_get_blue(color)

if div255
{
	r /= 255
	g /= 255
	b /= 255
}

shader_set_uniform_f(global.__current_uniform, r, g, b, alpha)
}



function shauni_texel(name, surface=surface_get_target()){
	
__declare_uniform(name)

var w = 1/surface_get_width(surface)
var h = 1/surface_get_height(surface)

shader_set_uniform_f(global.__current_uniform, w, h)
}



function shauni_texel_h(name, surface=surface_get_target()){
	
__declare_uniform(name)

var h = 1/surface_get_height(surface)

shader_set_uniform_f(global.__current_uniform, h)
}
