
function robo_add_sprites(names){

var robo = "spr_robo_"+colorname+"_"

for(var i = 0; i <= array_length(names)-1; i++)
{
	var name = names[i]
	self[$ "sprite_"+name] = asset_get_index(robo+name)
}

delete colorname
}