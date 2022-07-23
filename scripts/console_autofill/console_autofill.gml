
function Autofill_sublist() constructor {

enabled = true

show_all_if_blank = false
show_all_always = false

list = undefined
self.min = 0
self.max = infinity

color = undefined

get = noscript

format = format_autofill_item


sort = function(){
	if is_array(list)	array_sort(list, true)
	else				ds_list_sort(list, true)
}


get_size = function(){
	
	if is_numeric(list)		return ds_list_size(list)
	else if	is_array(list)	return array_length(list)
	else					return 0
}


get_range = function(term){
	
	var minmax
	if enabled
	{
		if show_all_always or (show_all_if_blank and term == "")
		{
			minmax = {min: 0, max: get_size()}
			if minmax.max == 0 minmax = -1//{min: -1, max: -1}
		}
		else minmax = autofill_in_list(list, term, undefined)
	}
	else minmax = -1//{min: -1, max: -1}
	
	if minmax == -1
	{
		self.min = -1
		self.max = -1
	}
	else
	{
		self.min = minmax.min
		self.max = minmax.max
	}
	
	return minmax
}
}



function format_autofill_item(item){

if not is_struct(item) item = new Autofill_item(item, item, undefined, undefined)
else if instanceof(item) != "Autofill_item" item = struct_replace(new Autofill_item("", "", undefined, undefined), item)

return item
}



function Autofill_item(name, value, side_text, color) constructor {

if is_numeric(name) self.name = string_format_float(name, float_count_places(name, 3))
else self.name = string(name)

self.value = value
self.side_text = side_text
self.color = color

if is_undefined(value) and name != "undefined" and name != "null" self.value = name
}



function Console_autofill_list() constructor{

list = -1
lists = -1

association = noone

initialize = function(){

	list = ds_list_create()
	lists = ds_list_create()
	include_side_text = false
	
	mouse_index = -1
	key_index = -1
	
	x = 0
	y = 0
	left = 0
	top = 0
	right = 0
	bottom = 0
	
	width = 500
	height = 400
	
	entries_width = 0
	entries_height = 0
	
	entries_length = 0
	
	scrollbar = new Console_scrollbar() with scrollbar {
		initialize()
		wbar_enabled = true
		hbar_enabled = true
		condensed = true
		wresize = true
		hresize = true
	}
	
	mouse_on = false
	clicking = false
}


sort = noscript
before_get = noscript


clear = function(){
	entries_length = 0
	ds_list_clear(self.list)
	ds_list_clear(self.lists)
}


add = function(list){
	
	var size = ds_list_size(self.list)
	
	// Get minmax of list, if provided
	var _min
	var _max
	var list_len
	var color = undefined
	var format = format_autofill_item
	if is_struct(list)
	{
		list_len = is_array(list.list) ? array_length(list.list) : ds_list_size(list.list)
		
		_min = list.min
		_max = min(list_len, list.max)
		
		color = list.color
		format = list.format
		
		list = list.list
	}
	else
	{
		list_len = is_array(list) ? array_length(list) : ds_list_size(list)
		_min = 0
		_max = list_len
	}
	
	// Convert to ds list
	if is_array(list) for(var i = _min; i <= _max-1; i++)
	{
		ds_list_add(self.list, list[i])
	}
	else if is_numeric(list) for(var i = _min; i <= _max-1; i++)
	{
		ds_list_add(self.list, list[| i])
	}
	
	// Convert items to Autofill item objects
	for(var i = size; i <= ds_list_size(self.list)-1; i++)
	{	
		self.list[| i] = format(self.list[| i])
		
		if is_undefined(self.list[| i].color) self.list[| i].color = color
		
		if not is_undefined(self.list[| i].side_text) and self.list[| i].side_text != "" include_side_text = true
		
		entries_length = max(entries_length, string_length(self.list[| i].name))
	}
}


add_to_lists = function(list){
	ds_list_add(lists, list)
}


set = function(list){
	
	ds_list_clear(self.list)
	ds_list_clear(self.lists)
	
	include_side_text = false
	add(list)
	add_to_lists(list)
	
	sort()
}


set_multiple = function(lists){

	clear()

	for(var i = 0; i <= array_length(lists)-1; i++)
	{
		add(lists[i])
		add_to_lists(lists[i])
	}
	
	sort()
}


get = function(term){
	
	ds_list_clear(list)
	before_get()
	
	for(var i = 0; i <= ds_list_size(lists)-1; i++)
	{
		var li = lists[| i]
		if is_struct(li) and instanceof(li) == "Autofill_sublist" with li
		{
			get()
			sort()
			get_range(term)
		}
		else
		{
			var minmax = autofill_in_list(li, term, undefined)
			
			if minmax == -1 li = []
			else
			{
				//show_debug_message(minmax.max - minmax.min)
				var newli = array_create(minmax.max - minmax.min)
			
				if is_numeric(li) li = ds_list_to_array(li)
			
				if is_array(li)	array_copy(newli, 0, li, minmax.min, minmax.max - minmax.min)
			
				li = newli
			}
		}
		
		add(li)
	}
}


get_array = function(){
	return ds_list_to_array(list)
}


destroy = function(){
	
if ds_exists(ds_type_list, list) ds_list_destroy(list)
if ds_exists(ds_type_list, lists) ds_list_destroy(lists)
}
	

get_input = function(){
	
	var tb = o_console.TEXT_BOX
	
	var ch = string_height("W")
	var cw = string_length("W")
	var asp = ch/tb.char_height
	var _text_wdist = round(tb.text_wdist*asp)
	
	entries_width = entries_length*cw
	entries_height = ds_list_size(list)*ch
	
	left = x
	top = y
	right = left+width-1
	bottom = top+height-1
	
	scrollbar.set_boundaries(entries_width, entries_height, left, top, right, bottom)
	scrollbar.get_input()
}
}


function draw_autofill_list_new(x, y, list){ with o_console.TEXT_BOX {

list.x = x
list.y = y
list.get_input()


var ch = string_height("W")
var asp = ch/char_height
var _text_wdist = round(text_wdist*asp)

draw_console_body(x, y, x+700, y+ch*ds_list_size(list.list))

for(var i = 0; i <= ds_list_size(list.list)-1; i++)
{
	if not is_undefined(list.list[| i].color) draw_set_color(list.list[| i].color)
	draw_rectangle(x, y+ch*i, x+2, y+ch*i+ch, false)
	
	draw_set_color(c_white)
	draw_text(x+_text_wdist, y+ch*i, list.list[| i].name)
}

//list.scrollbar.draw()
}}