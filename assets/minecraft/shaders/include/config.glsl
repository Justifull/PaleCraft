#version 150
/*****************************************************************************************************************/
/*************************** ________   ________   ________    ________  ___   ________ **************************/
/************************** |\   ____\ |\   __  \ |\   ___  \ |\  _____\|\  \ |\   ____\ *************************/
/************************** \ \  \___| \ \  \|\  \\ \  \\ \  \\ \  \__/ \ \  \\ \  \___| *************************/
/*************************** \ \  \     \ \  \\\  \\ \  \\ \  \\ \   __\ \ \  \\ \  \  ___ ***********************/
/**************************** \ \  \____ \ \  \\\  \\ \  \\ \  \\ \  \_|  \ \  \\ \  \|\  \ **********************/
/***************************** \ \_______\\ \_______\\ \__\\ \__\\ \__\    \ \__\\ \_______\ *********************/
/****************************** \|_______| \|_______| \|__| \|__| \|__|     \|__| \|_______| *********************/
/*******************************                                                            *********************/
/*****************************************************************************************************************/
/***************************************** BLOCK & HITBOX OUTLINE CONFIG *****************************************/
/*****************************************************************************************************************/
// Block Outline Color Selection
vec4 BLOCK_COLOURS[] = vec4[](
    vec4(0.91, 0.898, 0.824, 0.2),
    vec4(0.91, 0.898, 0.824, 0.3),
    vec4(0.91, 0.898, 0.824, 0.4),
    vec4(0.91, 0.898, 0.824, 0.5)
);

// Hitbox Outline Color Selection
vec4 HITBOX_COLOURS[] = vec4[](
    vec4(0.91, 0.898, 0.824, 0.2),
    vec4(0.91, 0.898, 0.824, 0.3),
    vec4(0.91, 0.898, 0.824, 0.4),
    vec4(0.91, 0.898, 0.824, 0.5)
);

// Animation Speed (Negative values to animate away from the player)
int BLOCK_ANIM_SPEED = -2200;
int HITBOX_ANIM_SPEED = 1700;

// Time between Color Changes
int BLOCK_COLOUR_PERIOD = 4;
int HITBOX_COLOUR_PERIOD = 4;

// Should colours change smoothly
bool BLOCK_SMOOTH_MIX = true;
bool HITBOX_SMOOTH_MIX = true;

// Should the animation remain on distance
bool BLOCK_ANIMATE_WITH_DISTANCE = true;
bool HITBOX_ANIMATE_WITH_DISTANCE = true;

// Enable Hitbox Fade
bool CHANGE_HITBOXES = true;

/*****************************************************************************************************************/
/**************************************************** GENERAL ****************************************************/
/*****************************************************************************************************************/
// Line width
float LINE_WIDTH_MULTIPLIER = 2.0;

/*****************************************************************************************************************/
/************************************************ XP COLOR CONFIG ************************************************/
/*****************************************************************************************************************/
// XP-Number Color
vec3 XP_COLOR = vec3(0.91, 0.898, 0.824);

// XP-Number-Shadow Color
vec3 XP_SHADOW_COLOR = vec3(0.482, 0.494, 0.42);

// Not enough XP-Number Color
vec3 NE_XP_COLOR = vec3(1.0, 0.333, 0.333);

// Not enough XP-Shadow-Number Color
vec3 NE_XP_SHADOW_COLOR = vec3(0.667, 0.0, 0.0);