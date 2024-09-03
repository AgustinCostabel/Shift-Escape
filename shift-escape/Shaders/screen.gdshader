shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform float gray;
uniform float alpha;

void fragment() {
	vec4 pixel_color = texture(screen_texture , SCREEN_UV);
	float brightness = (pixel_color.r + pixel_color.g + pixel_color.b) / gray;
	vec4 gray_scale = vec4(brightness,brightness,brightness, alpha);
	COLOR = gray_scale;	
}

