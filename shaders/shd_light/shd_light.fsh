varying vec2 pos; //current pixel position
varying vec4 col;
varying vec2 v_vTexcoord;

uniform vec2 u_pos; //light source positon

uniform float zz; //larger zz, larger light
uniform float u_str; //strength
uniform float u_dir; //direction
uniform float u_fov; //field of vision
uniform sampler2D u_nmap; //normal map sampled texture
uniform sampler2D u_mask;

uniform float reflection;
uniform float diffusion;
uniform float step_dist;
uniform float steps;

#define PI 3.1415926538

void main(){
	
	//vec4 frag = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 mask = texture2D( u_mask, v_vTexcoord );
	
	vec2 mask_pos = pos;
	mask_pos.y = mask.y; // lazy way of saying game_height

	if (mask.y > 0.0 && mask_pos.y > (u_pos.y/180.0))
	{
		gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);
	}
	else
	{
		vec2 dis = pos - u_pos;
		
		float str = 1.0/(sqrt(dis.x*dis.x + dis.y*dis.y + zz*zz)-zz+1.0-u_str); //strength of light is the inverse distance
		
		//float str = sqrt(dis.x*dis.x + dis.y*dis.y + zz*zz);
		//str = str - step_dist*steps;
	
		float dir = radians(u_dir);
		float hfov = radians(u_fov)*0.5;
	
		//setup FOV
		if (hfov < PI){
			float rad = atan(-dis.y,dis.x);	
			float adis = abs(mod(rad+2.0*PI,2.0*PI) - dir);
			adis = min(adis, 2.0*PI - adis);
			str *= clamp((1.0-adis/hfov)*diffusion,0.0,1.0);
		}
	
		//diffuse and specular lighting from normal map
		//vec3 norm = normalize(texture2D( u_nmap, v_vTexcoord ).rgb -0.5);
		//vec3 lnorm = normalize(vec3(-dis.x,dis.y,32.));
		//float norm_str = dot(norm,lnorm);
		//float ref = pow(max(reflect(-lnorm,norm).z,0.),reflection);
	
		//float final = str*norm_str;
	
		//gl_FragColor = col*vec4(vec3(final),1.0) + ref*col*str;
		
		gl_FragColor = col*vec4(vec3(str),1.0);
	}
}