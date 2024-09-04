shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform sampler2D noise_texture: filter_nearest, repeat_enable;
uniform float gray;
uniform float alpha;
uniform float distortion;

void fragment() {
	vec2 noise = 2.0 * texture(noise_texture, UV).rg - vec2(1.0);
	vec4 pixel_color = texture(screen_texture, UV);
	pixel_color *= texture(screen_texture , SCREEN_UV + noise * distortion);
	float brightness = (pixel_color.r + pixel_color.g + pixel_color.b) / gray;
	vec4 gray_scale = vec4(brightness,brightness,brightness, alpha);
	COLOR = gray_scale;	
}

