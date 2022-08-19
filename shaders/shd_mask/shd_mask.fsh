
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_y;
uniform vec4 u_emission_color;
uniform float u_emission_add;
uniform vec2 u_texel;
uniform float u_liproj_u;
uniform float u_base_u;
uniform float u_sprite_height;
uniform sampler2D u_liproj;

void main()
{    
	vec4 frag = texture2D( gm_BaseTexture, v_vTexcoord );
	
	float liproj = texture2D( u_liproj, vec2(v_vTexcoord.x-u_base_u+u_liproj_u, 0.0) ).g;

	float emission = u_emission_add;
	if (frag.a > 0.0 && (frag.rgb == u_emission_color.rgb))
	{
		emission = u_emission_color.a;
	}

	gl_FragColor = vec4(emission, liproj, 0.0, frag.a); //forward facing normal color
}
