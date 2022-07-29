
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_y;
uniform vec4 u_emission_color;
uniform float u_emission_add;
uniform vec2 u_texel;

void main()
{
    vec4 frag = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float emission = u_emission_add;
	if (frag.a > 0.0 && (frag.rgb == u_emission_color.rgb))
	{
		emission = u_emission_color.a;
	}
	
	float outline = 0.0;
	//vec2 texw = vec2(u_texel.x, 0.0);
	//vec2 texh = vec2(0.0, u_texel.y);
	//outline += texture2D( gm_BaseTexture, v_vTexcoord + texw ).a;
	//outline += texture2D( gm_BaseTexture, v_vTexcoord + texh ).a;
	//outline += texture2D( gm_BaseTexture, v_vTexcoord - texw ).a;
	//outline += texture2D( gm_BaseTexture, v_vTexcoord - texh ).a;
	//outline = max(0.0, min(1.0, ceil(outline)) - ceil(frag.a));
	
	gl_FragColor = vec4(emission, u_y, 0.0, frag.a+outline); //forward facing normal color
}
