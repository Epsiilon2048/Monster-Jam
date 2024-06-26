
#macro game_width 320
#macro game_height 180

#macro cam_width camera_get_view_width(view_camera[0])
#macro cam_height camera_get_view_height(view_camera[0])
#macro cam_x camera_get_view_x(view_camera[0])
#macro cam_y camera_get_view_y(view_camera[0])

#macro cat_is_morgan (instance_exists(obj_cat) and obj_cat.morgan)

#macro monster_red (cat_is_morgan ? 0x10D2F9 : 0x241CEE)
#macro crew_purple 0x70424A
#macro robo_blue 0xE16E5B

#macro start_in_rollback true
#macro rollback_testing false
#macro rollback_one_player true

#macro fnt_small global.smallfont

enum windex
{
	neutral,
	e, ee,
	w, ww,
	s, ss,
	n, nn
}

global.prev_cat = 1