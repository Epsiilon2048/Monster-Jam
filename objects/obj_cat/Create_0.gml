emission = 0
z = 0

state_pause = new Catstate("pause")
state_stand = new Catstate("stand")
state_walk = new Catstate("walk")
state_stunned = new Catstate("stunned")
state_mon_stand = new Catstate("mon_stand")
state_mon_walk = new Catstate("mon_walk")
state_mon_jump = new Catstate("mon_jump")
state_mon_slash = new Catstate("mon_slash")
state_mon_stunned = new Catstate("mon_stunned")

jump_curve = animcurve_get_channel(cat_curve, "jump")

#macro CAT_STUN_TIME 130
#macro CAT_SPD 2
#macro MON_STUN_TIME 60
#macro MON_JUMP_DIST 31
#macro MON_JUMP_HEIGHT 30
#macro MON_JUMP_SPD 1
#macro MON_FORM_TIME 1440 // 24 seconds
#macro MON_SPD 1.5
#macro MON_ORBS 3
#macro CAT_FOOTSTEP_INTERVAL 8
#macro MON_FOOTSTEP_INTERVAL 33

stun = 0
jump = 0

orb_index1 = 0
orb_index2 = 4

footstep = 0

emission_color = c_white

x = obj_catspawn.x
y = obj_catspawn.y

state = state_stand

catvision = false
final_form = 0
orbs = 0

cat_get_input()
populate_orbs()

//draw = function(){
//	draw_self()
//	var ldx = lengthdir_x(31, direction)
//	var ldy = lengthdir_y(27, direction)
//	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
//	draw_rectangle(bbox_left+ldx, bbox_top+ldy, bbox_right+ldx, bbox_bottom+ldy, true)
//}