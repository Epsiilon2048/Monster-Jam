//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_vignette_color;

void main()
{
	vec2 coords = v_vTexcoord;
    vec4 frag = v_vColour * texture2D(gm_BaseTexture, coords);
	
    vec2 vigcoords = coords * (1.0 - coords.xy);
    float vignette = vigcoords.x*vigcoords.y * 16.0;
    
    vignette = clamp(pow(vignette, 0.25), 0.0, 1.0);
	
	frag.rgb = mix(u_vignette_color, frag.rgb, vignette);
	
	//frag.rgb *= vec3(1.30, 1.10, 1.00);
	//frag.rgb += vec3(0.004, 0.007, 0.010);
	
	gl_FragColor = frag;
}
