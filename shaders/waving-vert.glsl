#version 330

in vec4 p3d_Vertex;
in vec2 p3d_MultiTexCoord0;

out vec2 texcoord;

uniform float time;

uniform mat4 p3d_ModelViewProjectionMatrix;

void main()
{
	vec4 pos = p3d_Vertex;

	pos.y += sin(time + pos.x + pos.z) * 0.5;
	pos.z += cos(time + pos.z + pos.x) * 0.5;

	gl_Position = p3d_ModelViewProjectionMatrix * pos;
	texcoord = p3d_MultiTexCoord0;
}