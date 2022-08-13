
step ++

//Creates Quadwith two triangles. Used to make the shadows. 
//Z coordinate is used as a flag to determine if the vertex will be repositioned in the shader
function Quad(_vb, _x1, _y1, _x2, _y2){
	//Upper triangle
	//_x1 = floor(_x1)
	//_y1 = floor(_y1)
	//_x2 = floor(_x2)
	//_y2 = floor(_y2)
	
	vertex_position_3d(_vb, _x1, _y1, 0)//0)
	vertex_position_3d(_vb, _x1, _y1, 1)//2) //repositioned vertex
	vertex_position_3d(_vb, _x2, _y2, 0)//1)
	
	//Lower Triangle
	vertex_position_3d(_vb, _x1, _y1, 1)//2) //repositioned vertex
	vertex_position_3d(_vb, _x2, _y2, 0)//1)
	vertex_position_3d(_vb, _x2, _y2, 1)//3) //repositioned vertex
}



//Construct the vertex buffer with every wall
//Instead of using the four edges as the walls,  we use the diagonals instead (Optimization)
vertex_begin(vb, vf)
var _vb = vb

with obj_wall if shadows {
	Quad(_vb, bbox_left, bbox_top+13, bbox_right, bbox_bottom+1) //Negative Slope Diagonal Wall
	Quad(_vb, bbox_left, bbox_bottom+1, bbox_right, bbox_top+13) //Positive Slope Diagonal Wall
	//Quad(_vb, x, y, x+sprite_width, y+sprite_height) //Negative Slope Diagonal Wall
	//Quad(_vb, x+sprite_width, y, x, y+sprite_height) //Positive Slope Diagonal Wall
}
with obj_tri {
	Quad(_vb, x, y, x+sprite_width, y+sprite_height) //large diagonal wall
	Quad(_vb, x, y+sprite_height, mid_x, mid_y) //small diagonal wall
}
with obj_robo {
	Quad(_vb, bbox_left+1, bbox_bottom+1, bbox_right, bbox_bottom+1)
	Quad(_vb, bbox_left+1, bbox_bottom+1-3, bbox_right, bbox_bottom+1) //Negative Slope Diagonal Wall
	Quad(_vb, bbox_left+1, bbox_bottom+1, bbox_right, bbox_bottom+1-3) //Positive Slope Diagonal Wall
}
with obj_cat {
	if final_form > 0
	{
		Quad(_vb, bbox_left-3, bbox_bottom+1, bbox_right+2, bbox_bottom+1)
		Quad(_vb, bbox_left-3, bbox_bottom-2, bbox_right+2, bbox_bottom+1) //Negative Slope Diagonal Wall
		Quad(_vb, bbox_left-3, bbox_bottom+1, bbox_right+2, bbox_bottom-2) //Positive Slope Diagonal Wall
	}
	else
	{
		Quad(_vb, bbox_left+1, bbox_bottom+1, bbox_right, bbox_bottom+1)
		Quad(_vb, bbox_left+1, bbox_bottom+1-3, bbox_right, bbox_bottom+1) //Negative Slope Diagonal Wall
		Quad(_vb, bbox_left+1, bbox_bottom+1, bbox_right, bbox_bottom+1-3) //Positive Slope Diagonal Wall
	}
}
with obj_scanner {
	Quad(_vb, bbox_left, bbox_top, bbox_right, bbox_bottom+1) //Negative Slope Diagonal Wall
	Quad(_vb, bbox_left, bbox_bottom+1, bbox_right, bbox_top) //Positive Slope Diagonal Wall
}
//with obj_lightblock { 
//	Quad(_vb, bbox_left, bbox_top, bbox_right, bbox_bottom+1) //Negative Slope Diagonal Wall
//	Quad(_vb, bbox_left, bbox_bottom+1, bbox_right, bbox_top) //Positive Slope Diagonal Wall
//}
vertex_end(vb)


//view movement controls
vy = cam_y
vx = cam_x
global.vx = vx
global.vy = vy