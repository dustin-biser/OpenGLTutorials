#version 330

out vec4 outputColor;

uniform float fragLoopDuration;
uniform float time;

const vec4 firstColor = vec4(1.0f, 1.0f, 1.0f, 1.0f);
const vec4 secondColor = vec4(0.0f, 1.0f, 0.0f, 1.0f);

void main()
{
	float t = mod(time, fragLoopDuration);
	float w = 3.14159 * 2 / fragLoopDuration; // angular frequency
	float cosSquared = cos(w*time);
	cosSquared *= cosSquared;
	
	outputColor = mix(firstColor, secondColor, cosSquared);
}
