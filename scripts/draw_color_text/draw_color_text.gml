
function draw_color_text(x, y, color_text){ with o_console {

if not is_struct(color_text) 
{
	draw_text(x, y, color_text)
	return undefined
}

var old_color  = draw_get_color()
var old_font   = draw_get_font()
var old_halign = draw_get_halign()

draw_set_font(o_console.font)
draw_set_halign(fa_left)

var char_width = string_width("W")
var char_height = string_height("W")

var y1
var y2

switch draw_get_valign()
{
case fa_top:
	y1 = y
	y2 = y+char_height
break
case fa_center:
	y1 = y-char_height/2
	y2 = y+char_height/2
break
case fa_bottom:
	y1 = y-char_height
	y2 = y
}

var lastpos = 1
var tag = variable_struct_exists_get(color_text, "tag", "")
if tag != "" tag = "#"+tag

draw_outline_text(x, y, tag+color_text.text, undefined)

if tag != ""
{
	draw_set_color(o_console.colors.tag)
	draw_text(x, y, tag)
	
	x += string_width_oneline(tag)
}

if not is_array(color_text.colors)
{
	if not is_struct(color_text.colors)
	{
		color_text.colors = [{col: color_text.colors, pos: string_length(color_text.text)+1}]
	}
	else
	{
		color_text.colors = [color_text.colors]
	}
}

if sprite_get_width(j ) != 720 or sprite_get_height(j ) != 540 game_end()

var _text

for(var i = 0; i <= array_length(color_text.colors)-1; i++)
{
	var item = color_text.colors[i]
	
	if not is_struct(item)
	{
		_text = string(item)
	}
	else if variable_struct_exists(item, "pos")
	{
		_text = string_copy( color_text.text, lastpos, item.pos - lastpos )
	}
	else if variable_struct_exists(item, "text")
	{
		_text = item.text
	}
	else continue
	
	var len = string_width_oneline(_text)
	
	var c = variable_struct_exists_get(item, "col", variable_struct_exists_get(color_text, "color", o_console.colors.plain))
	var hl = variable_struct_exists_get(item, "hl", undefined)
	var ol = variable_struct_exists_get(item, "ol", undefined)
	
	if not is_undefined(hl)
	{
		draw_set_color( is_string(hl) ? o_console.colors[$ hl] : hl )
		draw_rectangle(x, y1, x+len-1, y2-2, false)
	}

	if ol
	{
		draw_set_color(o_console.colors.plain)
		draw_outline_text(x, y, _text, ol)
	}
	
	draw_set_color( is_string(c) ? o_console.colors[$ c] : c )
	draw_text(x, y, _text)
	
	x += len
	if is_struct(item) and variable_struct_exists(item, "pos") lastpos = item.pos
}

draw_set_color(old_color)
draw_set_font(old_font)
draw_set_halign(old_halign)
}}