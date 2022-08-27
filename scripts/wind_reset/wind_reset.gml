
function wind_reset(dir=windex.neutral){ with obj_windman {

tilemap_clear(windgrass_tm, dir)
ds_grid_clear(grid, new Windcell())
}}