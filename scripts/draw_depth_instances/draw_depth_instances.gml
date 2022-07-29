
function draw_depth_instances(before_script=noscript, after_script=noscript){

for(var i = 0; i <= ds_grid_height(depth_list)-1; i++)
{
	with depth_list[# 0, i] 
	{
		before_script()
		draw_self()
		after_script()
	}
}
}


function mask_before_script(){

var local = (object_index == obj_robo or object_index == obj_cat) and player.player_local
	
shauni("u_y", (y-camera_get_view_y(view_camera[0]))/game_height)
shauni_color("u_emission_color", emission_color, 1, true)
shauni("u_emission_add", local ? 0.07 : 0)
}


function light_hide_before_script(){

shauni("u_pos", (x-camera_get_view_x(view_camera[0]))/game_width, (y-camera_get_view_y(view_camera[0]))/game_height)
}