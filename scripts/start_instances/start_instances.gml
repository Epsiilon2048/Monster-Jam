
function create_default_instances(){

var create = function(inst){instance_create_depth(0, 0, 0, inst)}

create(obj_rollback)
create(obj_local)

create(o_console)
create(obj_gui)
create(obj_debug)
create(obj_cursor)

create(obj_lightset)
create(obj_lightman)
}