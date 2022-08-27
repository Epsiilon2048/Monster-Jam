
function wind_index_direction(index){

switch index
{
	default:
		return 0
	case windex.n:
	case windex.nn:
		return 270
	case windex.s:
	case windex.ss:
		return 90
	case windex.e:
	case windex.ee:
		return 0
	case windex.w:
	case windex.ww:
		return 180
}
}