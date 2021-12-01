//@@## vertex
#version 330 core
layout (location = 0) in vec2 aPosition;
layout (location = 0) in vec2 aUV;

out vec2 uv;

void main()
{
    gl_Position = vec4(aPosition, 0.0, 1.0);
}

//@@## fragment
#version 330 core
out vec4 color;

uniform vec4 baseColor;
uniform sampler2D myTexture;

in vec2 uv;

void main()
{
    color = texture(myTexture, uv) * baseColor;
}