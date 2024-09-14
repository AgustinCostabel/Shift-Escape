shader_type canvas_item;

uniform float teleport_progress: hint_range(0.0, 1.0) = 0.0;
uniform sampler2D transparency_curve;
uniform sampler2D teleport_curve;

void fragment() {
	vec2 enlarged_uv = vec2(UV.x * 0.90 + 0.05, UV.y * 0.90 + 0.05);
	vec4 pixel_color = texture(TEXTURE, enlarged_uv);
	pixel_color.a *= float(mod(UV.x, 0.02) <= 0.002);

	vec4 base_tex = COLOR;
	base_tex.a *= texture(transparency_curve, vec2(teleport_progress)).r;
	float mix_curve = texture(teleport_curve, vec2(teleport_progress)).r;
	COLOR = mix(base_tex, pixel_color, mix_curve * pixel_color);
}