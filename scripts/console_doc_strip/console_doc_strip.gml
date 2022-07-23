
function draw_doc_strip(x, y, doc, x2){ with o_console.DOC_STRIP {

if is_undefined(doc) doc = ""

var text
var color = undefined
if is_struct(doc)
{
	text = doc.description
	color = o_console.colors[$ doc.type]
	if is_undefined(text) text = ""
}
else text = string(doc)

if is_undefined(color) color = (text == "") ? o_console.colors.plain : o_console.colors.output

var old_color = draw_get_color()
var old_font = draw_get_font()
var old_halign = draw_get_halign()
var old_valign = draw_get_valign()

draw_set_font(o_console.font)
var ch = string_height("W")
var asp = ch/char_height
var _wdist = round(wdist*asp)
var _hdist = round(hdist*asp)

var width = string_width(text)
var height = max(ch, string_height(text))

if is_undefined(x2) and text == "" return false

x2 = max(is_undefined(x2) ? 0 : x2, x+_wdist*2+width)
var y2 = y+_hdist*2+height

draw_console_body(x, y, x2, y2)

if text != "" 
{
	draw_set_color(color)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)

	draw_rectangle(x, y, x+o_console.BAR._sidebar_width, y2, false)
	draw_rectangle(x+1, y+1, x2-1, y2-1, true)
	
	draw_set_color(o_console.colors.plain)
	draw_color_text(x+_wdist, y+_hdist+1, text)
}

draw_set_color(old_color)
draw_set_font(old_font)
draw_set_halign(old_halign)
draw_set_valign(old_valign)

return true
}}