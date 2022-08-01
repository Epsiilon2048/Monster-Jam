
function cat_slash_collision(){

static list = ds_list_create()
static left = sprite_get_bbox_left(spr_monster_slash_hb)-sprite_get_xoffset(spr_monster_slash_hb)
static top = sprite_get_bbox_top(spr_monster_slash_hb)-sprite_get_yoffset(spr_monster_slash_hb)
static right = sprite_get_bbox_right(spr_monster_slash_hb)-sprite_get_xoffset(spr_monster_slash_hb)
static bottom = sprite_get_bbox_bottom(spr_monster_slash_hb)-sprite_get_yoffset(spr_monster_slash_hb)

collision_rectangle_list(x+left, y+top, x+right, y+bottom, obj_robo, false, true, list, false)

for(var i = 0; i <= ds_list_size(list)-1; i++)
{
	var robo = list[| i]
	with robo robo_switch_state(obj_roboman.state_dead)
}

ds_list_clear(list)
}