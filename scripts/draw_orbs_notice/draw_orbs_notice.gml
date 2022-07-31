
function draw_orbs_notice(){

static xx = 6
static yy = 10

draw_set_font(fnt_text)
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)

draw_text(xx, yy, stitch("Collect ORBS to transform  (",obj_cat.orbs,"/",obj_catman.ORBS_FOR_FORM,")"))

}