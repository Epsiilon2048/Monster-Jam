
function catstate_pause_initialize(){ with obj_cat {

}}


function catstate_pause_anim_end(){ with obj_cat {

if sprite_index == spr_monster_slash or sprite_index == spr_morgster_slash
{
	sprite_index = morgan ? spr_morgster : spr_monster
}

image_speed = 0
}}