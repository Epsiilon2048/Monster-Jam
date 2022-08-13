//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec2 coords = v_vTexcoord;
    vec4 frag = v_vColour * texture2D(gm_BaseTexture, coords);
	
	//float bitdepth = 48.0;
	
	//frag.r = floor(frag.r*bitdepth)/bitdepth;
	//frag.g = floor(frag.g*bitdepth)/bitdepth;
	//frag.b = floor(frag.b*bitdepth)/bitdepth;
	
    vec2 vigcoords = coords * (1.0 - coords.xy);
    float vignette = vigcoords.x*vigcoords.y * 16.0;
    
    vignette = clamp(pow(vignette, 0.25), 0.0, 1.0);
	
	frag.rgb *= vignette;
	//frag.rgb = vec3(1.0-vignette);
	
	frag.rgb *= vec3(1.3, 1.1, 0.85);
	frag.rgb += vec3(0.01, 0.015, 0.025);
	
	gl_FragColor = frag;
}
