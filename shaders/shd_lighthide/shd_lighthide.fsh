//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_base_boost;
uniform sampler2D u_light;
uniform sampler2D u_mask;
uniform float u_texh;

void main()
{
	vec2 pos = v_vTexcoord;
	vec4 mask = texture2D( u_mask, v_vTexcoord );
	
	float emission = 0.0;
	float pixel_y = mask.y;
	
	if (mask.a > 0.0)
	{
		emission = ceil(mask.r);
		pos.y = pixel_y + u_texh;
	}
	
	vec4 light = texture2D( u_light, v_vTexcoord);
	vec4 light_mask = texture2D( u_light, pos);
	
	vec4 base = texture2D( gm_BaseTexture, v_vTexcoord );
	
	float light_intensity = ceil(light_mask.a+light.a+light.r+light.g+light.b);

	gl_FragColor = vec4(base.rgb, base.a*min(1.0, light_intensity+u_base_boost*light_intensity+emission));
}
