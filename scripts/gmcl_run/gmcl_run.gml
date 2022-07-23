
function gmcl_run(compiled_command){

/*
ACTION BASED ON SUBJECT DATATYPE
REAL (base10)	Set console scope to asset index or instance id
REAL (base16)	Return base10 of
STRING			Return
METHOD			Run method with args
OBJECT			Set console scope to asset index
ASSET			Return asset index
UNDEFINED		Throw error
*/

static method_exec = function(ind, args){
	run_in_console = true
	try 
	{
		var output

		if instance_exists(object)
		{ 
			with object output = script_execute_ext_builtin(ind, args)
		}
		else 
		{
			output = script_execute_ext_builtin(ind, args)
		}
				
		run_in_console = false
		return output
	}
	catch(_exception)
	{
		run_in_console = false
		prev_exception = _exception
		return format_output([{str: "[SCRIPT ERROR]", scr: error_report, output: true}," "+_exception.message], true, -1, "Runner error")
	}
}

with o_console { try {
	
if compiled_command == "" return ""	

var com = compiled_command.commands
var tag = compiled_command.tag

if tag != ""
{
	var output = tags[$ tag].func(com)
	if not is_array(output) return [output]
	else return output
}

var output_string = array_create(array_length(com), "")

for(var i = 0; i <= array_length(com)-1; i++)
{
	if com[i] == 0
	{
		output_string[i] = 0
	}
	else
	{
		if not is_undefined(com[i].error) output_string[i] = format_output(com[i].error)
		else
		{
			var args = array_struct_get(com[i].args, "value")
			var subject = com[i].subject
			
			for(var j = 0; j <= array_length(com[i].variables)-1; j++)
			{
				var varstring = args[com[i].variables[j]]
				var value
				
				run_in_console = true
				
				if is_string(varstring)
				{
					if is_struct(object) or instance_exists(object) with object value = variable_string_info(varstring)
					else value = variable_string_info(varstring)
				}
				else if is_numeric(varstring)
				{
					value = { value: method_exec(varstring), exists: true }
				}
				else if is_method(varstring)
				{
					value = { value: method_exec(varstring), exists: true }
				}
				
				run_in_console = false
				
				if is_struct(value) and value.exists
				{
					args[com[i].variables[j]] = value.value
				}
				else
				{
					output_string[i] = format_output(exceptionVariableNotExists)
					continue
				}
			}
	
			switch subject.type 
			{
			#region Real
			case dt_real:
				output_string[i] = real(subject.value)
			break
			#endregion

			#region Method
			case dt_method:
				output_string[i] = method_exec(subject.value, args)
			break
			#endregion
			
			#region Object
			case dt_instance:
				object = instance_exists(subject.value) ? subject.value : noone
				instance_variables = variable_instance_get_names(object)
				array_sort(instance_variables, true)
			
				if subject.value == noone output_string[i] = format_output("Reset console scope")
				else output_string[i] = format_output(
						"Scope set to "+stitch(object_get_name(subject.value.object_index)," (",subject.value.id,")")
					)
			
			break
			#endregion
		
			#region Variable	
			case dt_variable:

				var _value = variable_string_get(subject.value)

				if array_length(com[i].args) == 0
				{			
					var string_value
					if is_numeric(_value)
					{
						string_value = string_format_float(_value, undefined)
						
						var ds_scope = string_scope_to_id(subject.value, true)
						if ds_map_exists(ds_types, ds_scope)
						{
							switch ds_types[? ds_scope]
							{
								case ds_type_list: string_value = string_insert("|", ds_list_to_array(_value), 2)
								break
								case ds_type_map: string_value = string_insert("?", ds_map_to_struct(_value), 2)
								break
								case ds_type_grid: string_value = "<ds grid>"
							}
						}
					}
					else string_value = _value
				
					output_string[i] = format_output(string_value)
				}
				else
				{
					var _value = args[i]
					
					variable_string_set(subject.value, _value)
					
					var string_value = string_format_float(_value)
					output_string[i] = format_output("Set "+subject.plain+" to "+string_value)
				}
	
			break
			#endregion
	
			#region Asset
			case dt_asset:
				var _asset = string_delete(subject.plain, 1, string_pos("/", subject.plain))

				if string_is_int(_asset)
				{
					if object_exists(real(_asset))	output_string[i] = "Object "+object_get_name(real(_asset))
					else							output_string[i] = "Noone"
				}
				else 
				{
					if asset_get_index(_asset) != -1	output_string[i] = "Asset index "+string(asset_get_index(_asset))
					else								output_string[i] = "Asset does not exist"
				}
			break
			#endregion
	
			#region String
			case dt_string:
				output_string[i] = subject.value
			break 
			#endregion
	
			#region Color
			case dt_color:
				_col = subject.value
				output_string[i] = new_color_dock("o_console._col", false, true, true, true, true)
			break
			#endregion
	
			#region Undefined
			case undefined:
				output_string[i] = format_output(
					[{str: "[COMPILE ERROR]", scr: noscript}," "+subject.error], 
				true, -1)
			#endregion
			}
		}
	}
}
return output_string

}
catch(_exception)
{
	
//damn tho wouldnt this suck
prev_exception = _exception
return [format_output([{str: "[CONSOLE ERROR]", scr: error_report, output: true}," "+exceptionUnknown], true, -1)]

}
}}