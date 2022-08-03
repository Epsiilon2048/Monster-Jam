//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;

uniform float u_ambient_intensity;
uniform vec2 u_texel;
uniform sampler2D u_light;
uniform sampler2D u_mask;

void main()
{
	vec2 pos = v_vTexcoord;
	vec4 mask = texture2D( u_mask, pos );
	
	float emission = 0.0;
	float pixel_y = mask.y;

	
	if (mask.a > 0.0)
	{
		emission = mask.r;
		pos.y = pixel_y + u_texel.y;
	}
	
	vec4 base = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 light = texture2D( u_light, pos );

	vec3 color = mix(base.rgb*light.rgb*2.5, base.rgb, clamp(emission+u_ambient_intensity, 0.0, 1.0));

	gl_FragColor = vec4(color, 1.0);
}
