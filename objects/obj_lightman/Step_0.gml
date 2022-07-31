
step ++

//Creates Quad with two triangles. Used to make the shadows. 
//Z coordinate is used as a flag to determine if the vertex will be repositioned in the shader
function Quad(_vb, _x1, _y1, _x2, _y2){
	//Upper triangle
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
with(obj_wall){
	Quad(_vb, bbox_left, bbox_top+32, bbox_right, bbox_bottom) //Negative Slope Diagonal Wall
	Quad(_vb, bbox_left, bbox_bottom, bbox_right, bbox_top+32) //Positive Slope Diagonal Wall
	//Quad(_vb, x, y, x+sprite_width, y+sprite_height) //Negative Slope Diagonal Wall
	//Quad(_vb, x+sprite_width, y, x, y+sprite_height) //Positive Slope Diagonal Wall
}
with(obj_tri){
	Quad(_vb, x, y, x+sprite_width, y+sprite_height) //large diagonal wall
	Quad(_vb, x, y+sprite_height, mid_x, mid_y) //small diagonal wall
}
with(obj_robo){
	Quad(_vb, bbox_left+1, bbox_bottom+1, bbox_right, bbox_bottom+1)
}
with(obj_cat){
	Quad(_vb, bbox_left+1, bbox_bottom+1, bbox_right, bbox_bottom+1)
	//Quad(_vb, x, bbox_bottom+1, x, bbox_bottom-5)
	//Quad(_vb, bbox_left+1, bbox_top, bbox_right, bbox_bottom+1) //Negative Slope Diagonal Wall
	//Quad(_vb, bbox_left+1, bbox_bottom+1, bbox_right, bbox_top) //Positive Slope Diagonal Wall
}
with(obj_scanner){  // Blocks own light! 
	Quad(_vb, bbox_left, bbox_top, bbox_right, bbox_bottom) //Negative Slope Diagonal Wall
	Quad(_vb, bbox_left, bbox_bottom, bbox_right, bbox_top) //Positive Slope Diagonal Wall
}
vertex_end(vb)


//view movement controls
vy = camera_get_view_y(view_camera[0])
vx = camera_get_view_x(view_camera[0])
global.vx = vx
global.vy = vy