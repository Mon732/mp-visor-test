shader_type canvas_item;

uniform vec3 bias : source_color = vec3(0.5);
uniform sampler2D lut : repeat_disable, filter_nearest;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 col = texture(screen_texture, UV);
	float lum = bias.r*col.r + bias.g*col.g + bias.b*col.b;
	col.rgb = texture(lut, vec2(lum)).rgb * lum;
	//col.rgb = vec3(lum);
	COLOR = col;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
