
function populate_orbs(){

static list = ds_list_create()
static orbs = 4
static list1 = [0, 3, 2, 6, 4, 7, 8]
static list2 = [1, 0, 0, 2, 5, 4, 3]

with obj_orbspawn
{
	ds_list_add(list, self)
}

repeat orbs
{
	var i = (list1[obj_cat.orb_index1]+list2[obj_cat.orb_index2]) mod ds_list_size(list)
	var spawn = list[| i]
	create_orb(spawn)
	ds_list_delete(list, i)
	
	obj_cat.orb_index1 = (obj_cat.orb_index1+1) mod array_length(list1)
	obj_cat.orb_index2 = (obj_cat.orb_index2+1) mod array_length(list2)
}

ds_list_clear(list)
}