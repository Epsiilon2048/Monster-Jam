
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_texel;
uniform float u_dist;

void main()
{
	vec2 width = vec2(u_texel.x*u_dist, 0.0);
	vec2 height = vec2(0.0, u_texel.y*u_dist);
	
	vec4 red = texture2D( gm_BaseTexture, v_vTexcoord-width );
	vec4 green = texture2D( gm_BaseTexture, v_vTexcoord+width );
	vec4 blue = texture2D( gm_BaseTexture, v_vTexcoord );
	
    gl_FragColor = vec4(red.r, green.g, blue.b, blue.a);
}
