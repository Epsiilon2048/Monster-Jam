
function create_default_instances(){

var create = function(inst){instance_create_depth(0, 0, 0, inst)}

create(obj_rollback)

create(obj_catman)
create(obj_roboman)
create(obj_lightman)

create(o_console)
create(obj_gui)
create(obj_debug)
create(obj_cursor)

create(obj_lightset)
}