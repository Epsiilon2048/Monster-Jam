
function wind_set(windcell, dir=windex.neutral, str=0){

windcell.dir = dir
windcell.str = str

windcell.index = dir + floor(clamp(str-1, 0, 1))
}