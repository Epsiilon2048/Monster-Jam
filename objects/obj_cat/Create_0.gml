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

STUN_TIME = 2.7*60
STUN_TIME_MON = 1*60
stun = 0
JUMP_DIST = 31
JUMP_HEIGHT = 30
JUMP_SPD = 1
jump = 0
SPD = 2
FORM_SPD = 1.5
ORBS_FOR_FORM = 3
FINAL_FORM_TIME = 24*60

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