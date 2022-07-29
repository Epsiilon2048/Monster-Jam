//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

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
	
	float rim = 0.0;
	vec2 texw = vec2(u_texel.x, 0.0);
	vec2 texh = vec2(0.0, u_texel.y);
	
	//rim += texture2D( u_mask, pos+texw ).a;
	//rim += texture2D( u_mask, pos+texh ).a;
	//rim += texture2D( u_mask, pos-texw ).a;
	//rim += texture2D( u_mask, pos-texh ).a;
	//rim = min(1.0, ceil(rim));
	
	if (mask.a > 0.0)
	{
		emission = mask.r;
		pos.y = mix(pixel_y + 1.0/180.0, pos.y, mask.b);
	}
	
	vec4 base = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 light = texture2D( u_light, pos );

	vec3 color = mix(base.rgb*light.rgb*4.0, base.rgb, clamp(emission+u_ambient_intensity, 0.0, 1.0));
	
	//if (mask.b > 0.0 && light.a > 0.01)
	//{
	//	color = mix(color, light.rgb, light.a);
	//}

	gl_FragColor = vec4(color, 1.0);
}
