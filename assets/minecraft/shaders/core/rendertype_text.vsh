#version 150

#moj_import <fog.glsl>
#moj_import <config.glsl>
#moj_import <tools.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform int FogShape;

out float vertexDistance;
out vec4 lighting;
out vec2 texCoord0;
out vec3 pos;
out vec4 tintColor;

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    
    pos = Position;
    tintColor = Color;
    texCoord0 = UV0;

    vertexDistance = fog_distance(Position, FogShape);
    lighting = texelFetch(Sampler2, UV2 / 16, 0);
}