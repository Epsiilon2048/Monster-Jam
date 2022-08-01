
function Catstate(name) constructor{
	
var events = [
	"initialize",
	"step",
	"input",
	"draw",
	"gui",
	"anim_end",
]

for(var i = 0; i <= array_length(events)-1; i++)
{
	var scr = asset_get_index("catstate_"+name+"_"+events[i])
	if scr == -1 scr = noscript
	self[$ events[i]] = scr
}

self.name = name
}