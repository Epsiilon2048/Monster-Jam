
function array_to_ds_list(array){

var ind = ds_list_create()

for(var i = 0; i <= array_length(array)-1; i++)
{
	ds_list_add( ind, array[@ i] )
}

return ind
}