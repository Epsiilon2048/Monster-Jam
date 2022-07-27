
function sort_instance_depths(){

var instances = 0
for(var i = 0; i <= array_length(depth_objects)-1; i++)
{
	instances += instance_number(depth_objects[i])
}

ds_grid_resize(depth_list, 2, instances)

var yy = 0
var _depth_list = depth_list
for(var i = 0; i <= array_length(depth_objects)-1; i++)
{
	with depth_objects[i]
	{
		_depth_list[# 0, yy] = id
		_depth_list[# 1, yy] = y
		yy++
	}
}

ds_grid_sort(depth_list, 1, true)
}