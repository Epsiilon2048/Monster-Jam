//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;

uniform float u_ambient_intensity;
uniform float u_light_mult;
uniform float u_vertical_pow;
uniform float u_vertical_factor;
uniform vec2 u_texel;
uniform sampler2D u_light;
uniform sampler2D u_mask;

void main()
{
	vec2 pos = v_vTexcoord;
	vec4 mask = texture2D( u_mask, pos );
	
	float emission = 0.0;
	float vx = 0.0;

	float vertical_factor = 1.0;
	
	if (mask.a > 0.0)
	{
		vx = (mask.y-v_vTexcoord.y)*3.4;
		
		emission = mask.r;
		pos.y = mask.y + u_texel.y;
		vertical_factor = u_vertical_pow;
	}
	
	vec4 base = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 light = texture2D( u_light, pos );

	light *= max(0.0, 1.0-pow(vx, vertical_factor));

	vec3 color = mix(
		base.rgb*light.rgb*u_light_mult, 
		base.rgb, 
		clamp(emission+u_ambient_intensity, 0.0, 1.0)
	);

	gl_FragColor = vec4(color, 1.0);
}
