
function cat_toggle_catvision(on=not catvision){

catvision = on
if catvision
{
	emission_color = hex_to_color(0xE13744)
}
else
{
	emission_color = c_white
}
}