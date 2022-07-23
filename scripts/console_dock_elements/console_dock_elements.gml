
#region Dock text
function new_cd_text(text, color){

var t = new Cd_text()
t.initialize(text)
t.color = color
return t
}



function new_cd_colortext(text){

var t = new Cd_text()
t.initialize(text.text)
t.color_text = text
return t
}



function new_cd_var(variable){
var v = new Cd_text()
v.set()
v.variable = variable
return v
}



function Cd_text() constructor{

format_console_element()

initialize = function(text){
	
	enabled = true
	
	set(text)
	
	x = 0
	y = 0
	
	left = 0
	top = 0
	right = 0
	bottom = 0
	
	color_text = undefined
	color = undefined
	color_method = noscript
	
	variable = undefined
	float_places = 1
	
	is_button = false
	mouse_on = false
	clicking = false
	
	func = noscript
}


set = function(text){

	if not variable_struct_exists(self, "enabled") initialize()

	var old_font = draw_get_font()
	draw_set_font(o_console.font)
	
	var cw = string_width("W")
	var ch = string_height("W")
	
	self.text = string(text)
	name = self.text
	width = string_width(self.text)/cw
	height = string_height(self.text)/ch	
	
	draw_set_font(old_font)
}

get_input = function(){
	
	if not enabled
	{
		left = x
		top = y
		right = x
		bottom = y
		return undefined
	}
	
	var old_font = draw_get_font()
	draw_set_font(o_console.font)
	
	var cw = string_width("W")
	var ch = string_height("W")
	
	if not is_undefined(variable)
	{
		var value = variable_string_get(variable)
		var newtext = string_format_float(value, float_places)
		
		if newtext != text
		{
			text = newtext
			color_text = color_method(newtext)
			width = string_width(text)/cw
			height = string_height(text)/ch
		}
	}
	
	left = x
	top = y
	right = x+width*cw
	bottom = y+height*ch
	
	if clicking and not mouse_check_button(mb_left)
	{
		clicking = false
		func()
	}
	
	mouse_on = (is_button or clicking) and not mouse_on_console and not clicking_on_console and gui_mouse_between(left, top, right, bottom)
	
	if mouse_on and mouse_check_button_pressed(mb_left)
	{
		clicking = true
	}
	
	draw_set_font(old_font)
}


draw = function(){

	if right == x and bottom == y return undefined

	var old_color = draw_get_color()
	var old_font = draw_get_font()
	var old_halign = draw_get_halign()
	var old_valign = draw_get_valign()
	
	draw_set_font(o_console.font)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)

	var dc = o_console.DOCK
	
	if not is_button or not (mouse_on or clicking)
	{
		if color_method == noscript
		{
			if is_undefined(color) draw_set_color(is_button ? o_console.colors.embed : o_console.colors.output)
			else draw_set_color(is_numeric(color) ? color : o_console.colors[$ color])
			draw_text(x, y+1, text)
		}
		else draw_color_text(x, y+1, color_text)
	}
	else
	{
		draw_set_color(clicking ? o_console.colors.plain : o_console.colors.embed_hover)
		draw_text(x, y+1, text)
	}
	
	draw_set_color(old_color)
	draw_set_font(old_font)
	draw_set_halign(old_halign)	draw_set_valign(old_valign)
}
}
#endregion
	
	
	
#region Dock checkbox
function new_cd_checkbox(text, variable){
var c = new Cd_checkbox()
c.initialize(text, variable)
return c
}
	
	
	
function Cd_checkbox() constructor{
	
format_console_element()
	
initialize = function(text, variable){
		
	enabled = true
	
	x = 0
	y = 0
	
	left = 0
	top = 0
	right = 0
	bottom = 0
	
	checkbox_x = 0
	checkbox_y = 0
	
	on = false
	
	self.text = text
	self.variable = variable
	
	text_color = "output"
	on_color = "plain"
	off_color = "plain"
	error_color = dt_deprecated
	
	mouse_on = false
	mouse_on_checkbox = false
	clicking = false
	
	error = false
	
	func = noscript
	
	update_id = o_console.TEXT_BOX.update_id++
}


get_input = function(){
	
	if not enabled
	{
		left = x
		top = y
		right = x
		bottom = y
		
		mouse_on = false
		clicking = false
		
		return undefined
	}
	
	var cb = o_console.CHECKBOX
	var tb = o_console.TEXT_BOX
	var ch = string_height("W")
	var asp = ch/cb.char_height
	var tb_asp = ch/tb.char_height
	
	var _width = round(cb.width*asp)
	var height = round(tb.text_hdist*tb_asp)*2 + ch
	
	left = x
	right = left+_width
	top = y
	bottom = top+height
	
	checkbox_x = x
	checkbox_y = y + floor(height/2) - ceil(_width/2)
	
	if not mouse_on_console and not clicking_on_console and gui_mouse_between(left, top, right, bottom)
	{
		mouse_on = true
		mouse_on_console = true
		
		if gui_mouse_between(checkbox_x, checkbox_y, checkbox_x+_width, checkbox_y+_width)
		{
			mouse_on_checkbox = true
			
			if mouse_check_button_pressed(mb_left)
			{
				clicking = true
				clicking_on_console = true
				on = not on
				func()
				with dock.association variable_string_set(other.variable, other.on)
			}
		}
	}
	else
	{
		mouse_on = false
	}
	
	if clicking and mouse_check_button(mb_left)
	{
		clicking_on_console = true
	}
	else clicking = false
	
	if not clicking and (dock.is_front or get_update_turn(update_id))
	{
		error = false
		
		with dock.association var info = variable_string_info(other.variable)
		
		if not info.exists or not is_numeric(info.value) error = true
		else on = bool(info.value)
	}
}


draw = function(){
	
	if right == x and top == y return undefined
	
	draw_checkbox(checkbox_x, checkbox_y, error ? undefined : on, mouse_on or clicking)
}
}
#endregion