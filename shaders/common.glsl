#ifndef COMMON_GLSL
#define COMMON_GLSL

// Precomputed normalization constant for RGB values (1.0 / 255.0)
// Rounded up for performance optimization
const float rgbNorm = 0.004;

/**
 * Converts RGB values from the (0-255) color space to normalized float values in the (0.0-1.0) range.
 *
 * @param {float} r - The red channel value (0-255).
 * @param {float} g - The green channel value (0-255).
 * @param {float} b - The blue channel value (0-255).
 * 
 * @return {vec3} A vec3 representing the normalized RGB values where each component is between 0.0 and 1.0.
 */
vec3 rgb(float r, float g, float b) {
    return vec3(r, g, b) * rgbNorm;
}

/**
 * Converts a single grayscale value from the (0-255) color space to a normalized vec3 
 * representing RGB channels, all set to the same value in the (0.0-1.0) range.
 *
 * @param {float} color - The grayscale value (0-255) to be applied to all RGB channels.
 * 
 * @return {vec3} A vec3 where each RGB channel is set to the normalized value of the input color.
 */
vec3 rgb(float color) {
    return rgb(color, color, color);
}

#endif