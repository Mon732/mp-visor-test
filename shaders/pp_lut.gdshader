shader_type canvas_item;

uniform vec3 bias : source_color = vec3(0.5);
uniform sampler2D lut : repeat_disable, filter_nearest;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	vec4 col = texture(screen_texture, UV);
	float lum = bias.r*col.r + bias.g*col.g + bias.b*col.b;
	col.rgb = texture(lut, vec2(lum)).rgb * lum;
	COLOR = col;
}
