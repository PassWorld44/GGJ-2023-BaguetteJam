shader_type canvas_item;

uniform float blur_amount : hint_range(-2.0, 10.0);
uniform float mix_amount : hint_range(0.0, 1.0);
uniform vec4 color_over : hint_color;

void fragment() {
	vec4 blurred = textureLod(SCREEN_TEXTURE, SCREEN_UV, blur_amount);
	vec4 fin = mix(blurred, color_over, mix_amount);
	COLOR.rgb = fin.rgb;
	COLOR.a = texture(TEXTURE,UV).a * fin.a;
}