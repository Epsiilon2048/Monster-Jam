//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform vec3 u_color;

void main()
{
    vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	vec3 color = mix(vec3(1.0), u_color, u_time);
	col = vec4(min(color.r, col.r), min(color.g, col.g), min(color.b, col.b), 1.0);
	
	gl_FragColor = col;
}
