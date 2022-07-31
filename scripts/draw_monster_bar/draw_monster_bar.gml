
function draw_monster_bar(){

static xx = 15
static yy = game_height-10
static bar_width = sprite_get_width(spr_monsterbar)

var progress = min(1, obj_cat.final_form/obj_catman.FINAL_FORM_TIME*1.05)

draw_sprite(spr_monsterbar, 0, xx, yy)
draw_sprite_stretched(spr_monsterbar_progress, 0, xx, yy, progress*(bar_width-2), 2)
}