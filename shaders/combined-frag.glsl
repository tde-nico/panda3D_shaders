#version 330

uniform vec2 resolution;

out vec4 outColor;

const float outerRadius = 0.65;
const float innerRadius = 0.3;
const float vignette_intensity = 0.6;

const float mix_intensity = 0.55;


void main() {
	vec2 pos = gl_FragCoord.xy / resolution;

	vec4 color = vec4(1.0);
	vec2 relativePosition = gl_FragCoord.xy / resolution - 0.5;
	float len = length(relativePosition);
	float vignette = smoothstep(outerRadius, innerRadius, len);
	color.rgb = mix(color.rgb, color.rgb * vignette, vignette_intensity);

	color.rgb = mix(vec3(0.3, 0.5, pos.y), color.rgb, mix_intensity);
	outColor = color;
}