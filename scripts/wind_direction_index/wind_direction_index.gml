
function wind_direction_index(dir360, strength=1){

strength = floor(clamp(strength, 0, 2))-1
if strength == 0 return windex.neutral

dir360 = dir360 mod 360

if dir360 < 90-45 or dir360 > 360-45	return windex.e+strength
if 90-45 < dir360 and dir360 < 180-45	return windex.s+strength
if 180-45 < dir360 and dir360 < 270-45	return windex.w+strength
if 270-45 < dir360 and dir360 < 360-45	return windex.n+strength
}