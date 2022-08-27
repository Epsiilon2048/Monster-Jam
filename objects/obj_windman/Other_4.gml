
windgrass_tm = layer_tilemap_get_id("Windgrass")
width = tilemap_get_width(windgrass_tm)
height = tilemap_get_height(windgrass_tm)

ds_grid_resize(grid, width, height)
wind_reset()