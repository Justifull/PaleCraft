#version 150

#moj_import <fog.glsl>
#moj_import <config.glsl>
#moj_import <tools.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;
uniform float GameTime;
uniform mat4 ProjMat;

in float vertexDistance;
in vec2 texCoord0;
in vec3 pos;
in vec4 tintColor;
in vec4 lighting;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * lighting * ColorModulator;
    vec4 tint = tintColor;

    if (color.a < 0.1) {
        discard;
    }

    if (roughlyEquals(tint.rgb, vec3(0.5019607843137255, 1, 0.12549019607843137))) {
        tint.rgb = XP_COLOR;
    } else if (roughlyEquals(tint.rgb, vec3(0.12549019607843137, 0.24705882352941178, 0.03137254901960784)) && isShadow(pos, ProjMat)) {
        tint.rgb = XP_SHADOW_COLOR;
    } else if (roughlyEquals(tint.rgb, vec3(0.25098039215686274, 0.4980392156862745, 0.06274509803921569))) {
        tint.rgb = NE_XP_COLOR;
    } else if (roughlyEquals(tint.rgb, vec3(0.06274509803921569, 0.12156862745098039, 0.01568627450980392)) && isShadow(pos, ProjMat)) {
        tint.rgb = NE_XP_SHADOW_COLOR;
    }

    fragColor = color * tint;
}