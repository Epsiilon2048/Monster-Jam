//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float green = gl_FragColor.g / 5.0;
	float blue = gl_FragColor.b / 5.0;
	
	gl_FragColor = vec4(gl_FragColor.r+green+blue, 0.0, 0.0, 1.0);
}
