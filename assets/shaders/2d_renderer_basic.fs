#version 430 core
out vec4 out_color;

in vec2 uv;
in vec4 color;
in flat int texture_unit;

uniform sampler2D texture_samplers[32];

void main() {
    if (texture_unit < 0) {
        out_color = color;
    } else {
        out_color = texture(texture_samplers[texture_unit], uv) * color;
    }
}