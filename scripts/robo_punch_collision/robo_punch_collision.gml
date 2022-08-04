
function robo_punch_collision(){

static left = sprite_get_bbox_left(spr_robo_green_punch_hb)-sprite_get_xoffset(spr_robo_green_punch_hb)
static top = sprite_get_bbox_top(spr_robo_green_punch_hb)-sprite_get_yoffset(spr_robo_green_punch_hb)
static right = sprite_get_bbox_right(spr_robo_green_punch_hb)-sprite_get_xoffset(spr_robo_green_punch_hb)
static bottom = sprite_get_bbox_bottom(spr_robo_green_punch_hb)-sprite_get_yoffset(spr_robo_green_punch_hb)

if instance_exists(obj_cat) and rectangle_in_rectangle(
	x+left*image_xscale, y+top, x+right*image_xscale, y+bottom, 
	obj_cat.bbox_left, obj_cat.bbox_top, obj_cat.bbox_right, obj_cat.bbox_bottom
)
{
	if obj_cat.final_form
	{
		with obj_cat cat_stun()
	}
	else
	{
		obj_cat.image_yscale = -1
		obj_cat.image_speed = 0
		obj_cat.y -= 16
		
		robos_win()
	}
}

robos_win()
}