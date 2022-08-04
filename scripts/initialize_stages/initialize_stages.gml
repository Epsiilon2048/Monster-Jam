
function initialize_stages(){

stages = {}

stages.grave = new PX_STAGE()
stages.grave.initialize(
	480*1.5,	270,	//stage wh
	480*1.5/2, 270/2,	//origin
	game_width,	game_height,	//cam wh
[				//layers
{sprite: spr_haunted_graveyardlayer_00, wlerp: 1, hlerp: 1, originx: 0, originy: 0, group: "", anim: 0, bind: false, hide: false,},
{sprite: spr_haunted_graveyardlayer_01, wlerp: .85, hlerp: .85, originx: 0, originy: 0, group: "", anim: 0, bind: false, hide: false,},
{sprite: spr_haunted_graveyardlayer_02, wlerp: .8, hlerp: .8, originx: 0, originy: 0, group: "", anim: 0, bind: false, hide: false,},
{sprite: spr_haunted_graveyardlayer_03, wlerp: .6, hlerp: .6, originx: 0, originy: 0, group: "", anim: 0, bind: false, hide: false,},
{sprite: spr_haunted_graveyardlayer_04, wlerp: .5, hlerp: .5, originx: 0, originy: 0, group: "", anim: 0, bind: false, hide: false,},
{sprite: spr_haunted_graveyardlayer_05, wlerp: .2, hlerp: .2, originx: 0, originy: 0, group: "", anim: 0, bind: false, hide: false,},
])

return "Re-initialized stages"
}

initialize_stages()