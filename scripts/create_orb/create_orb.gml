
function create_orb(orbspawn){

var orb = instance_create_layer(orbspawn.x, orbspawn.y, orbspawn.layer, obj_orb)
instance_create_layer(orbspawn.x, orbspawn.y, orbspawn.layer, obj_orblight, {parent: orb})
}