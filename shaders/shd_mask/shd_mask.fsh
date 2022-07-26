
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_y;
uniform vec4 u_emission_color;
uniform float u_emission_add;

void main()
{
    vec4 frag = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float emission = u_emission_add;
	if (frag.a > 0.0 && (frag.rgb == u_emission_color.rgb))
	{
		emission = u_emission_color.a;
	}
	
	gl_FragColor = vec4(emission, u_y, 0.0, frag.a); //forward facing normal color
}
