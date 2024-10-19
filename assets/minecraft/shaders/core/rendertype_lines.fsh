#version 150

#moj_import <fog.glsl>
#moj_import <colour_fade_config.glsl>
#moj_import <colour_fade_tools.glsl>

in vec4 vertexColor;
in float vertexDistance;
uniform vec4 ColorModulator;
uniform float GameTime;
uniform vec2 ScreenSize;
out vec4 fragColor;

vec4 gradient = vec4(0.0);

void main() {
    vec4 color = vertexColor;

    if (roughlyEquals(color.rgb, vec3(0.0)) && color.a > 0.39 && color.a < 0.41) {
        bool smoothMix = BLOCK_SMOOTH_MIX;
        float gradientAnim = fract(((vertexDistance * float(BLOCK_ANIMATE_WITH_DISTANCE)) + GameTime * BLOCK_ANIM_SPEED) / BLOCK_COLOUR_PERIOD);
        int colourCount = BLOCK_COLOURS.length();
        
        for (int i = 0; i < colourCount; i++) {
            float stepStart = float(i) / float(colourCount);
            float stepEnd = float(i + 1) / float(colourCount);

            if (i == 0) {
                gradient = smoothMix 
                    ? mix(BLOCK_COLOURS[colourCount - 1], BLOCK_COLOURS[i], smoothstep(stepStart, stepEnd, gradientAnim)) 
                    : mix(BLOCK_COLOURS[colourCount - 1], BLOCK_COLOURS[i], step(stepStart, gradientAnim));
            } else {
                gradient = smoothMix 
                    ? mix(gradient, BLOCK_COLOURS[i], smoothstep(stepStart, stepEnd, gradientAnim)) 
                    : mix(gradient, BLOCK_COLOURS[i], step(stepStart, gradientAnim));
            }
        }
        color = gradient;
    }
    fragColor = color * ColorModulator;
}
