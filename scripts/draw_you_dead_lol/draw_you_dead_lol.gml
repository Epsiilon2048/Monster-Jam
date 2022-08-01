
function draw_you_dead_lol(){

static xx = game_width/2
static yy = game_height/3

draw_set_color(monster_red)
draw_set_font(fnt_text)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_text(xx, yy, "you dead lol")

draw_set_color(c_white)
}