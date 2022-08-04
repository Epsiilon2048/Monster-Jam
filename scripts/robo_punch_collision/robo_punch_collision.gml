
function robo_punch_collision(){

static left = sprite_get_bbox_left(spr_robo_green_punch_hb)-sprite_get_xoffset(spr_robo_green_punch_hb)
static top = sprite_get_bbox_top(spr_robo_green_punch_hb)-sprite_get_yoffset(spr_robo_green_punch_hb)
static right = sprite_get_bbox_right(spr_robo_green_punch_hb)-sprite_get_xoffset(spr_robo_green_punch_hb)
static bottom = sprite_get_bbox_bottom(spr_robo_green_punch_hb)-sprite_get_yoffset(spr_robo_green_punch_hb)

if rectangle_in_rectangle(
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
		with obj_cat cat_switch_state(state_pause)
		with obj_robo robo_switch_state(state_pause)
		
		if obj_local.local_is_cat
		{
			set_bar("THE HUNTERS HAVE CAPTURED YOU", "YOU LOSE", monster_red)
		}
		else
		{
			set_bar("THE HUNTERS HAVE CAPTURED THE CREATURE", "YOU WIN", hex_to_color(0x31e092))
		}
	}
}
}