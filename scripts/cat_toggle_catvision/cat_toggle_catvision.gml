
function cat_toggle_catvision(on=not catvision){

catvision = on
if catvision
{
	emission_color = morgan ? MORGAN_EMISSION_COLOR : CAT_EMISSION_COLOR
}
else
{
	emission_color = c_white
}
}