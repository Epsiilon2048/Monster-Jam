
function console_include_tag_color(command){ with o_console {

command = shave(" ", command)

if command == "*" return {text: "*", colors: dt_method}

for(var i = 0; i <= array_length(builtin_excluded)-1; i++)
{
	if string_pos(builtin_excluded[i], command) == 1
	{
		return {text: command, colors: dt_method}
	}
}

return {text: command, colors: "plain"}
}}