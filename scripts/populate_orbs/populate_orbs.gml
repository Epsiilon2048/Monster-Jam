
function populate_orbs(){

static list = ds_list_create()
static orbs = 4

with obj_orbspawn
{
	ds_list_add(list, self)
}

repeat orbs
{
	var i = irandom(ds_list_size(list)-1)
	var spawn = list[| i]
	instance_create_layer(spawn.x, spawn.y, "Instances", obj_orb)
	ds_list_delete(list, i)
}

ds_list_clear(list)
}