
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_texel;
uniform float u_dist;
uniform float u_wave_time;
uniform float u_wave_intensity;
uniform float u_cam_y;

void main()
{
	float wave = sin(u_wave_time + (u_cam_y*u_texel.y+v_vTexcoord.y)*100.0)*2.0*u_texel.x*u_wave_intensity;
	
	vec2 width = vec2(u_texel.x*u_dist, 0.0);
	
	vec4 red = texture2D( gm_BaseTexture, v_vTexcoord-width-wave/2.0 );
	vec4 green = texture2D( gm_BaseTexture, v_vTexcoord+width+wave);
	vec4 blue = texture2D( gm_BaseTexture, v_vTexcoord+width*wave);
	
    gl_FragColor = vec4(red.r, green.g, blue.b, blue.a);
}
