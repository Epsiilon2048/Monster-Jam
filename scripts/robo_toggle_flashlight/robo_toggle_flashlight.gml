
function robo_toggle_flashlight(on=not flashlight){

flashlight = on
if flashlight 
{
	light.fov = obj_roboman.LIGHT_FOV
	emission_color = EMISSION_COLOR
}
else
{
	light.fov = 0
	emission_color = c_white
}
}