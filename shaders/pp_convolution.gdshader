shader_type canvas_item;

const int KERNEL_SIZE = 9;

uniform vec3 bias : source_color = vec3(0.5);
uniform float kernel_1[KERNEL_SIZE];
uniform float kernel_2[KERNEL_SIZE];

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	vec2 offset[KERNEL_SIZE];
	vec2 screen_size = vec2(textureSize(screen_texture, 0));
	float step_w = 1.0/screen_size.x;
	float step_h = 1.0/screen_size.y;
	
	offset[0] = vec2(-step_w, -step_h);
	offset[1] = vec2(0.0, -step_h);
	offset[2] = vec2(step_w, -step_h);
	
	offset[3] = vec2(-step_w, 0.0);
	offset[4] = vec2(0.0, 0.0);
	offset[5] = vec2(step_w, 0.0);
	
	offset[6] = vec2(-step_w, step_h);
	offset[7] = vec2(0.0, step_h);
	offset[8] = vec2(step_w, step_h);
	
	vec4 sum = vec4(vec3(0.0), 1.0);
	for (int i = 0; i < KERNEL_SIZE; i++)
	{
		sum += texture(screen_texture, UV + offset[i]) * kernel_1[i];
	}
	for (int i = 0; i < KERNEL_SIZE; i++)
	{
		sum += texture(screen_texture, UV + offset[i]) * kernel_2[i];
	}
	sum.rgb = vec3(bias.r*sum.r + bias.g*sum.g + bias.b*sum.b);
	COLOR = sum;
}
