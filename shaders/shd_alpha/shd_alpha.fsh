//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = vec4(vec3(gl_FragColor.b), 1.0);
}