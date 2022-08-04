
gui_surface = -1

step = 0

catvision_time = 0

map_surface = -1

test = true

intro_time = 0

bar_time = 0
bar_text = ""
bar_text2 = ""
bar_color = c_white

circle_surface = -1

draw_set_circle_precision(64)

curve = animcurve_get(ac_gui)
circle_intro = animcurve_get_channel(curve, "circle_intro")

stage_screen = c_aqua