
for(var i = 0; i <= array_length(avatar_surfaces)-1; i++)
{
	if surface_exists(avatar_surfaces[i])
	{
		surface_free(avatar_surfaces[i])
	}
}