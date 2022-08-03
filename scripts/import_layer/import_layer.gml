function import_layer(stage){

var fname = get_open_filename("*.png;*.jpg;*.jpeg;*.gif", "a")

var spr = sprite_add(fname, 0, false, false, 0, 0)

if spr == -1 return "Import failed"

stage.add_layer({sprite: spr})
return "Added layer"
}