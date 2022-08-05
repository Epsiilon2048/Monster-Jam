emission = 0
z = 0

emission_color = 0x0000FF

SPD = 7

FOV = 20

var l = instance_create_layer(x, y, "Lights", obj_scannerlight)
l.parent = id

signal = false
SIGNAL_RANGE = 150
SIGNAL_REPEATS = 4