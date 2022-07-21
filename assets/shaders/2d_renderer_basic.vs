#version 430 core
layout (location = 0) in vec2 a_position;
layout (location = 1) in vec2 a_uv;
layout (location = 2) in vec4 a_color;
layout (location = 3) in int a_texture;

out vec2 uv;
out vec4 color;
out int texture_unit;

void main() {
    gl_Position = vec4(a_position, 0.0, 1.0);
    uv = a_uv;
    color = a_color;
    texture_unit = a_texture;
}