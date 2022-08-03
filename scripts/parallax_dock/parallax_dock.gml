
function parallax_dock(){

if not instance_exists(o_stage) exit

if variable_instance_exists(o_console, "parallax")
{
	o_console.parallax.dock.enabled = not o_console.parallax.dock.enabled
	return o_console.parallax.dock.enabled
}

var pd = new Console_dock()
pd.initialize()
pd.name = "Parallax editor"
pd.before_func = function(){
	if not instance_exists(o_stage) enabled = false
}

o_console.object = o_stage
o_console.parallax = {selected: undefined, selected_index: 0, dock: pd}

reveal = false
o_console.parallax.reveal_checkbox = new_cd_checkbox("", "o_menu.reveal")
o_console.parallax.reveal_checkbox.func = function(){
	if o_console.parallax.reveal_checkbox.on
	{
		o_console.object.stage.reveal = o_console.parallax.selected_index
	}
	else
	{
		o_console.object.stage.reveal = -1
	}
}

var selector = new_scrubber("Selected layer", "o_console.parallax.selected_index", 1)
with selector
{
	att.value_min = 0
	att.allow_float = false
	att.scrubber_pixels_per_step = 15
	
	on_input = function(){
		if value < ds_list_size(o_console.object.stage.layers)
		{
			o_console.parallax.selected = o_console.object.stage.layers[| value]
			
			if o_console.parallax.reveal_checkbox.on
			{
				o_console.object.stage.reveal = value
			}
		}
		else o_console.parallax.selected = undefined
	}
	
	on_input()
}
o_console.parallax.selector = selector

var el = [
	[new_cd_button("Scope stage", function(){o_console.object = o_stage})],
	[new_cd_button("Reset all stages", initialize_stages)],
	new_separator(),
	["Camera follow mouse",new_cd_checkbox("", "o_camera.follow_mouse")],
	[new_scrubber("Lerp mult", "o_console.object.stage.lerp_mult", .1)],
	[new_cd_button("Sort layers", function(){ o_console.object.stage.sort(); o_console.parallax.selector.on_input()})],
	[new_cd_button("Copy layers", function(){ with o_console.object.stage {

		var str = ""
		static sf = function(float){
			var s = shave("0", string_format_float(float, 3))
			if s == "." or s == "" s = "0"
			return s
		}

		for(var i = 0; i <= ds_list_size(layers)-1; i++)
		{
			var l = layers[| i]
			str += stitch(
				"{sprite: "+sprite_get_name(l.sprite)+
				", wlerp: "+sf(l.wlerp)+
				", hlerp: "+sf(l.hlerp)+
				", originx: ",l.originx,
				", originy: ",l.originy,
				", group: \""+l.group+"\""+
				", anim: ",l.anim,
				", bind: "+(l.bind ? "true" : "false")+
				", hide: "+(l.hide ? "true" : "false")+
				",},\n")
		}
		
		str = slice(str, , -2)
		clipboard_set_text(str)

	}})],
	new_separator(),
	[selector, new_cd_var("o_console.parallax.selected.name")],
	["Reveal",o_console.parallax.reveal_checkbox],
	[new_scrubber("x", "o_console.parallax.selected.originx", 2),new_scrubber("y", "o_console.parallax.selected.originy", 2),],
	[new_scrubber("wlerp", "o_console.parallax.selected.wlerp", .002),new_scrubber("hlerp", "o_console.parallax.selected.hlerp", .002),],
	[new_display_box("TWL","o_console.parallax.selected.true_wlerp", false),new_display_box("THL","o_console.parallax.selected.true_hlerp", false),],
	[new_scrubber("anim speed", "o_console.parallax.selected.anim", .002),],
	["Bind to previous layer",new_cd_checkbox("", "o_console.parallax.selected.bind")],
	[new_text_box("group", "o_console.parallax.selected.group"),],
]

pd.set(el)

add_console_element(pd)
return true
}