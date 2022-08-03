
emission_color = 0x0000FF

SPD = 7
LIGHT_SIZE = 500

light = instance_create_layer(x, y, "Lights", obj_light, {
	parent: self,
	color: 0x0000FF,
	size: LIGHT_SIZE,
	str: 1,
	fov: 20,
})

signal = false
SIGNAL_RANGE = 150
SIGNAL_REPEATS = 4