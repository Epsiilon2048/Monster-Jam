
state_stand = new Catstate("stand")
state_walk = new Catstate("walk")
state_mon_stand = new Catstate("mon_stand")
state_mon_walk = new Catstate("mon_walk")
state_mon_slash = new Catstate("mon_slash")

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