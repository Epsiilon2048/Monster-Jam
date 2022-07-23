
function new_embedded_text(text){
var e = new Embedded_text()
e.set(text)
return e
}

function Embedded_text() constructor{
	
format_console_element()
	
set = function(text){

	dock_valign = fa_top

	static _colors_list			= ds_list_create()
	static _clickable_list		= ds_list_create()
	static _subclickable_list	= ds_list_create()
	
	delete self.colors		
	delete self.clickable	
	delete self.subclickable
	
	var _text = (is_struct(text) and variable_struct_exists(text, "__embedded__")) ? text.o : text
	
	_text = is_array(_text) ? _text : [ is_undefined(_text) ? "" : _text ]

	self.plain = ""
	self.colortext = ""
	self.width = 0
	self.height = 0
	self.mouse_index = -1
	self.click_index = -1
	self.mouse_on = false
	self.mouse_on_item = false
	
	self.x = variable_struct_exists_get(self, "x", 0)
	self.y = variable_struct_exists_get(self, "y", 0)

	var _width = 0
	var _click_id = 0
	
	for(var i = 0; i <= array_length(_text)-1; i++) 
	{
		var _str
		var _clickable = false
		var _color = false
		var cbox_length = 0
		var cbox_space = ""

		if is_struct(_text[i])
		{
			_str = string( variable_struct_exists_get(_text[i], "str", variable_struct_exists_get(_text[i], "s", "")) )
			var _newlines = string_count("\n", _str)
		
			var s = {}
			var c = {}

			_clickable = (
				variable_struct_exists(_text[i], "func") or 
				variable_struct_exists(_text[i], "vari") or
				variable_struct_exists(_text[i], "cbox") or 
				variable_struct_exists(_text[i], "outp") or
				
				variable_struct_exists(_text[i], "checkbox") or
				variable_struct_exists(_text[i], "outout") or
				variable_struct_exists(_text[i], "scr")
			)
			
			_color = _clickable or (
				variable_struct_exists(_text[i], "col") or 
				
				variable_struct_exists(_text[i], "ul") or 
				variable_struct_exists(_text[i], "hl")
			)
			   
			s.func	= variable_struct_exists_get(_text[i], "func",	noscript	)
			s.vari	= variable_struct_exists_get(_text[i], "vari",	""			)
			s.cbox	= variable_struct_exists_get(_text[i], "cbox",	""			)

			s.arg	= variable_struct_exists_get(_text[i], "arg",	undefined	)
			s.args	= variable_struct_exists_get(_text[i], "args",	[s.arg]		)
			s.outp	= variable_struct_exists_get(_text[i], "outp",	false		)
			s.dock	= variable_struct_exists_get(_text[i], "dock",	false	)
			
			//original names, kept for backwards compatability
			if s.cbox == ""			s.cbox	= variable_struct_exists_get(_text[i], "checkbox",	"")
			if s.vari == ""			s.vari	= variable_struct_exists_get(_text[i], "variable",	"")
			if s.outp == false		s.outp	= variable_struct_exists_get(_text[i], "output",	false)
			if s.func == noscript	s.func	= variable_struct_exists_get(_text[i], "scr",		noscript)
			
			c.col	= variable_struct_exists_get(_text[i], "col",	_clickable ? "embed" : "output"	)
			c.ul	= variable_struct_exists_get(_text[i], "ul",	undefined	)
			c.hl	= variable_struct_exists_get(_text[i], "hl",	undefined	)
			
			cbox_length = (s.cbox != "") ? string_length(cbox_true) : 0
			cbox_space = (s.cbox != "") ? string_repeat(" ", string_length(cbox_true)) : ""
			
			if _clickable
			{
				var j = 1
				
				if _newlines
				{ 
					while string_char_at(_str, j) == "\n"
					{
						_width = 0
						j++
					}
				}
				
				s.x  = _width
				s.y  = self.height
				s.id = _click_id
				
				if _newlines
				{
					var line_split = string_split("\n", _str)
					
					s.length = string_length(line_split[0]) + cbox_length
					
					for(var j = 1; j <= array_length(line_split)-1; j++)
					{
						ds_list_add(_subclickable_list, {
							id: _click_id,
							y:	s.y+j,
							length: string_length(line_split[j]),
						})
					}
				}
				else s.length = string_length(_str) + cbox_length
			
				ds_list_add(_clickable_list, s)
			}
		
			if _color
			{
				ds_list_add(_colors_list, {
					x: _width,
					y: self.height,
					id: _clickable ? _click_id++ : -1,
					str: _str,
					col: c.col,
					ul: c.ul,
					hl: c.hl,
					cbox: s.cbox,
				})
			}
		
			if not _newlines self.colortext += string_repeat(" ", string_length(_str) + cbox_length)
			else 
			{ //ughhhhhhhhhh im soooo tired of this part im just gonna go with the really garbage way of doing it
				var _colorstr = cbox_space
				
				for(var j = 1; j <= string_length(_str); j++)
				{
					if string_char_at(_str, j) == "\n"
					{
						_colorstr += "\n"
					}
					else _colorstr += " "
				}
				
				self.colortext += _colorstr
			}
		}
		else
		{
			_str = string(_text[i])
			var _newlines = string_count("\n", _str)
			self.colortext += _str
		}
		
		self.plain += ((_clickable and s.cbox != "") ? cbox_false : "") + _str
		
		self.height += _newlines
	
		_width = (_newlines ? 0 : _width) + (string_length(_str) - string_last_pos("\n", _str)) + cbox_length
	}

	self.colors			= ds_list_to_array(_colors_list)
	self.clickable		= ds_list_to_array(_clickable_list)
	self.subclickable	= ds_list_to_array(_subclickable_list)

	self.height += 1
	self.width = string_width(self.plain)/string_width("W")

	var old_font = draw_get_font()
	draw_set_font(o_console.font)
	
	left = x
	top = y
	right = x+width*string_width("W")
	bottom = y+height*string_height("W")

	ds_list_clear(_colors_list)
	ds_list_clear(_clickable_list)
	ds_list_clear(_subclickable_list)
	
	draw_set_font(old_font)
}



draw = function(){
	var old_font = draw_get_font()
	draw_set_font(o_console.font)
	draw_embedded_text(x, y, self, o_console.colors.output, 1)
	draw_set_font(old_font)
}



get_input = function(){
	var old_font = draw_get_font()
	draw_set_font(o_console.font)
	embedded_text_inputs(x, y, self, o_console.colors.output, 1)
	draw_set_font(old_font)
}
}



function draw_outline_text(x, y, text, layers){ with o_console.colors {

if is_undefined(layers) layers = outline_layers

if layers > 0
{
	draw_text(x-1, y+1, text)
	if layers > 1 
	{
		draw_text(x+1, y-1, text)
		if layers > 2
		{
			draw_text(x+1, y+1, text)
			if layers > 3
			{
				draw_text(x-1, y-1, text)
				if layers > 4
				{
					draw_text(x-1, y, text)
					if layers > 5
					{
						draw_text(x, y+1, text)
						if layers > 6
						{
							draw_text(x, y-1, text)
							if layers > 7
							{
								draw_text(x+1, y, text)
}}}}}}}}
}}



function embedded_text_inputs(x, y, text, plaintext_color, alpha){

var cw = string_width("W")
var ch = string_height("W")

if is_undefined(text) or not is_struct(text) return undefined

text.left = x
text.top = y
text.right = x+text.width*cw
text.bottom = y+text.height*ch

text.mouse_on = gui_mouse_between(text.left, text.top, text.right, text.bottom)
text.mouse_on_item = false

text.mouse_index = -1

var executing = undefined

if text.mouse_on and not mouse_on_console and not clicking_on_console
{
	for(var j = 0; j <= array_length(text.subclickable)-1; j++)
	{
		var c = text.subclickable[j]
		
		if gui_mouse_between(
			x,
			y + c.y*ch,
			x + c.length*cw,
			y + c.y*ch + ch
		){
			text.mouse_index = c.id
			break
		}
	}
	
	for(var i = 0; i <= array_length(text.clickable)-1; i++)
	{
		var c = text.clickable[i]

		if text.mouse_index == c.id or (not mouse_on_console and not clicking_on_console and c.length and gui_mouse_between(
			x + c.x*cw, 
			y + c.y*ch,
			x + (c.x + c.length)*cw,
			y + c.y*ch + ch
		)){
			text.mouse_index = c.id
			mouse_on_console = true
			
			if mouse_check_button_pressed(mb_left)
			{
				text.click_index = c.id
			}
			else if is_undefined(executing) and text.click_index == c.id and not mouse_check_button(mb_left)
			{
				text.click_index = -1
				executing = c
			}
		
			if not mouse_check_button(mb_left) and text.click_index == c.id text.click_index = -1
		
			text.mouse_on_item = true
		}
		else 
		{
			if text.mouse_index == c.id text.mouse_index = -1
			if not mouse_check_button(mb_left) and text.click_index == c.id text.click_index = -1
		}
	}
}
else 
{
	text.mouse_index = -1
	
	if not mouse_check_button(mb_left) text.click_index = -1
}

if not is_undefined(executing)
{
	//Set variable
	variable_string_set(executing.vari, executing.arg)
			
	//Set checkbox
	var _check = variable_string_get(executing.cbox)
	if is_numeric(_check) variable_string_set(executing.cbox, not _check)
				
	//Run method
	o_console.run_in_embed = true
	var _output = script_execute_ext_builtin(executing.func, executing.args)
	o_console.run_in_embed = false
			
	//Set output
	if executing.outp text.set(_output)
	
	//Set dock
	if executing.dock and docked dock.to_set = _output
}

if text.click_index != -1 clicking_on_console = true
}



function draw_embedded_text(x, y, text, plaintext_color, alpha){

var cw = string_width("W")
var ch = string_height("W")

var old_color = draw_get_color()
var old_alpha = draw_get_alpha()
var old_halign = draw_get_halign()
var old_valign = draw_get_valign()

if is_undefined(alpha) alpha = 1

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_alpha(alpha)

var plain_col = is_undefined(plaintext_color) ? o_console.colors.output : (is_string(plaintext_color) ? o_console.colors[$ plaintext_color] : plaintext_color)

draw_set_color(plain_col)
if is_undefined(text) or not is_struct(text)
{
	draw_outline_text(x, y, text, undefined)
	draw_text(x, y, text)
	draw_set_halign(old_halign)
	draw_set_valign(old_valign)
	return undefined
}

if o_console.colors.outline_layers
{
	draw_set_color(o_console.colors.selection)
	draw_outline_text(x, y, text.plain, undefined)
	draw_set_color(plain_col)
}

draw_text(x, y, text.colortext)

for(var i = 0; i <= array_length(text.colors)-1; i++)
{
	var c = text.colors[i]
	
	var nl = string_pos("\n", c.str)
	var cbox = ""
	
	if not is_undefined(c.hl) or not is_undefined(c.ul)
	{
		var hl = is_string(c.hl) ? o_console.colors[$ c.hl] : c.hl
		var ul = is_string(c.ul) ? o_console.colors[$ c.ul] : c.ul
		
		var len = nl ? nl-1 : string_length(c.str)
		
		var nl_count = nl ? string_count("\n", c.str) : 0
		
		if not is_undefined(hl)
		{
			draw_set_color(hl)
			draw_rectangle(	
				x + c.x*cw,			y + c.y*ch, 
				x + (c.x+len)*cw,	y + (c.y+1)*ch - 1,
				false
			)
		}
		if not is_undefined(ul)
		{
			draw_set_color(ul)
			draw_line(
				x + c.x*cw - 1,			y + (c.y+1)*ch - 3,
				x + (c.x+len)*cw - 1,	y + (c.y+1)*ch - 3
			)
		}
			
		var prev_nl = nl
		var _nl
			
		for(var j = 2; j <= nl_count+1; j++)
		{
			if j == nl_count+1
			{
				len = string_length(c.str) - string_last_pos("\n", c.str)
			}
			else
			{
				_nl = string_pos_index("\n", c.str, j)
				len = _nl - prev_nl - 1
				prev_nl = _nl
			}
				
			if len > 0 
			{
				if not is_undefined(hl)
				{
					draw_set_color(hl)
					draw_rectangle(
						x,			y + (c.y+j-1)*ch, 
						x + len*cw,	y + (c.y+j)*ch - 1,
						false
					)
				}
				if not is_undefined(ul)
				{
					draw_set_color(ul)
					draw_line(
						x - 1,			y + (c.y+j)*ch - 3, 
						x + len*cw - 1,	y + (c.y+j)*ch - 3
					)
				}
			}
		}
	}
	
	if is_string(c.col)
	{
		if		c.id != -1 and text.click_index == c.id								_col = o_console.colors.plain
		else if c.id != -1 and text.click_index == -1 and text.mouse_index == c.id	_col = o_console.colors.embed_hover
		else if variable_struct_exists(o_console.colors, c.col)						_col = o_console.colors[$ c.col]
		else																		_col = plain_col
	}
	else _col = c.col
	
	if c.cbox != ""
	{
		var cbox_value = variable_string_get(c.cbox)
		
		if is_numeric(cbox_value) cbox = cbox_value ? cbox_true : cbox_false
		else cbox = cbox_NaN
	}
	
	draw_set_color(_col)
	draw_text(
		x + c.x*cw, y + c.y*ch, 
		cbox + (nl ? string_copy(c.str, 1, nl-1) : c.str),
	)
	
	if nl draw_text(
		x, y + c.y*ch + ch,
		string_copy(c.str, nl+1, string_length(c.str)),
	)
}

draw_set_color(old_color)
draw_set_alpha(old_alpha)
draw_set_valign(old_halign)
draw_set_halign(old_valign)
}