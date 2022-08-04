
function populate_orbs(){

static list = ds_list_create()
static orbs = 4
static list1 = [0, 3, 2, 6, 4, 7, 8]
static list2 = [1, 0, 0, 2, 5, 4, 3]
static index1 = 0
static index2 = 4

with obj_orbspawn
{
	ds_list_add(list, self)
}

repeat orbs
{
	var i = (list1[index1]+list2[index2]) mod ds_list_size(list)
	var spawn = list[| i]
	instance_create_layer(spawn.x, spawn.y, "Instances", obj_orb)
	ds_list_delete(list, i)
	
	index1 = (index1+1) mod array_length(list1)
	index2 = (index2+1) mod array_length(list2)
}

ds_list_clear(list)
}