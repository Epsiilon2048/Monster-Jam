varying vec2 pos; //current pixel position
varying vec4 col;
varying vec2 v_vTexcoord;

uniform vec2 u_pos; //light source positon

uniform vec3 u_color;
uniform float zz; //larger zz, larger light
uniform float u_str; //strength
uniform float u_dir; //direction
uniform float u_fov; //field of vision
uniform float u_game_height;
uniform sampler2D u_nmap; //normal map sampled texture
uniform sampler2D u_mask;

uniform float reflection;
uniform float diffusion;
uniform float step_dist;
uniform float steps;

#define PI 3.1415926538

void main(){
	
	vec4 mask = texture2D( u_mask, v_vTexcoord );
	
	vec2 dis = pos - u_pos;
		
	float str = 1.0/(sqrt(dis.x*dis.x + dis.y*dis.y + zz*zz)-zz+1.0-u_str) - 0.04; //strength of light is the inverse distance
		
	float dir = radians(u_dir);
	float hfov = radians(u_fov)*0.5;
	
	if (hfov < PI){
		float rad = atan(-dis.y,dis.x);	
		float adis = abs(mod(rad+2.0*PI,2.0*PI) - dir);
		adis = min(adis, 2.0*PI - adis);
		str *= clamp((1.0-adis/hfov)*diffusion,0.0,1.0);
	}
		
	if (mask.a > 0.0 && mask.y > u_pos.y/u_game_height)
	{
		gl_FragColor = vec4(vec3(u_color*mask.b), str + (str*mask.b*50.0));
	}
	else
	{
		gl_FragColor = vec4(u_color, str);
	}
}