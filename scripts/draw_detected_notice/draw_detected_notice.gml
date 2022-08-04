
function draw_detected_notice(){

static xx = game_width/2
static yy = game_height/4

draw_set_color(monster_red)
draw_set_font(fnt_text)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_text(xx, yy, "*DETECTED!*")

draw_set_color(c_white)
}