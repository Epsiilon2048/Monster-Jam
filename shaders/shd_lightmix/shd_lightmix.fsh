//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_ambient_intensity;
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
		pos.y = pixel_y + 1.0/180.0;
	}
	
	vec4 light = texture2D( u_light, pos );
	vec4 base = texture2D( gm_BaseTexture, v_vTexcoord );

	vec3 color = mix(base.rgb*light.rgb, base.rgb, emission+u_ambient_intensity);

	gl_FragColor = vec4(color, 1.0);
}
