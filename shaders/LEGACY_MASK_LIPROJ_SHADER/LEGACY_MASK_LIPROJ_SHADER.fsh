
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 pos;

uniform vec2 u_pos;
uniform vec4 u_emission_color;
uniform float u_emission_add;
uniform vec2 u_texel;
uniform float u_sprite_height;
uniform float u_liproj[64];

void main()
{    
	vec4 frag = texture2D( gm_BaseTexture, v_vTexcoord );
	
	float liproj = u_liproj[int(pos.x-u_pos.x)];

	float emission = u_emission_add;
	if (frag.a > 0.0 && (frag.rgb == u_emission_color.rgb))
	{
		emission = u_emission_color.a;
	}

	gl_FragColor = vec4(emission, u_pos.y - liproj/u_sprite_height*11.0, 0.0, frag.a); //forward facing normal color
}
