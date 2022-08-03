
function PX_STAGE() constructor{


add_layer = function(layer_att, use_width, sort){
	
	static vseg = variable_struct_exists_get
	
	var this = {}; with this {
			
	sprite		= layer_att.sprite
	x			= 0
	y			= 0
	
	bm			= vseg(layer_att, "bm",			bm_normal													)
	alpha		= vseg(layer_att, "alpha",		1															)
	color		= vseg(layer_att, "color",		c_white														)
	
	hide		= vseg(layer_att, "hide",		false														)
																										
	name		= vseg(layer_att, "name",		sprite_get_name(sprite)										)
																											
	anim		= vseg(layer_att, "anim",		0															)
	subimg		= vseg(layer_att, "subimg",		0															)
																										
	before		= vseg(layer_att, "before",		noscript													)
	after		= vseg(layer_att, "after",		noscript													)
																										
	bind		= vseg(layer_att, "bind",		false														)
																										
	width		= vseg(layer_att, "width",		sprite_get_width (sprite)									)
	height		= vseg(layer_att, "height",		sprite_get_height(sprite)									)
	originx		= vseg(layer_att, "originx",	0															)
	originy		= vseg(layer_att, "originy",	0															)
					
	wlerp		= vseg(layer_att, "wlerp",		px_lerp(other.cam_w, width -originx, other.width )			)
	hlerp		= vseg(layer_att, "hlerp",		px_lerp(other.cam_h, height-originy, other.height)			)
	
	asp			= width/height
	lerp_add	= vseg(layer_att, "lerp_add",	0															)
	
	group		= vseg(layer_att, "group",		""															)
	
	if not is_undefined(use_width) and use_width
	{
		hlerp = px_lerp(other.cam_h, width*(other.cam_h/other.cam_w) - originy, other.height)
	}
		
	true_wlerp	= wlerp + lerp_add*asp
	true_hlerp	= hlerp + lerp_add*asp
	
	if string_pos("s_", name) == 1 name = string_delete(name, 1, 2)
	}
	
	ds_list_add(layers, this)
}



initialize = function(width, height, originx=width/2, originy=height/2, cam_w=game_width, cam_h=game_height, layers, groups={}){
	
	static vseg = variable_struct_exists_get
	
	self.width		= width
	self.height		= height
	self.originx	= originx
	self.originy	= originy
	self.cam_w		= cam_w
	self.cam_h		= cam_h
	self.groups		= groups
	
	self.layers		= ds_list_create()
	
	lerp_mult = 1
	
	reveal = -1
	
	shader_script = noscript
	
	color = c_white
	add_alpha = 0
	add_color = c_white
	
	var _l = is_numeric(layers) ? layers : array_to_ds_list(layers)
	
	for(var i = 0; i <= ds_list_size(_l)-1; i++)
	{
		add_layer(_l[| i])
	}
	
	layer_count = ds_list_size(self.layers)
}

sort = function(){ struct_list_sort(layers, "true_wlerp", false) }


get_layer = function(ind){
	
	if is_numeric(ind) return layers[| ind]
	
	for(var i = 0; i <= ds_list_size(layers); i++)
	{
		if layers[| i].name == ind return layers[| i]
	}
}



destroy = function(){
	
	delete x
	delete y
	delete width
	delete height
	delete cam_w
	delete cam_h
	
	ds_list_destroy(layers)
}
}