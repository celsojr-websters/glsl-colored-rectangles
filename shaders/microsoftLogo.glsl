#include "common.glsl"

/**
 * Determines the color of the pixel based on the Microsoft logo design. 
 * The logo consists of four quadrants, each with a distinct color (blue, red, yellow, green),
 * with a specified gap between the quadrants.
 *
 * @param {vec2} uv - The normalized UV coordinates of the pixel in the [0.0, 1.0] range.
 * @param {vec2} minBound - The minimum UV bounds for the logo area.
 * @param {vec2} maxBound - The maximum UV bounds for the logo area.
 * @param {float} gap - The gap size between the squares, expressed as a normalized value (0.0-1.0).
 *
 * @return {vec3} A vec3 representing the color of the pixel within the logo, 
 *                either blue, red, yellow, green, or white (background).
 */
vec3 drawMicrosoftLogo(vec2 uv, vec2 minBound, vec2 maxBound, float gap) {
    vec3 red = rgb(243.0, 82.0, 32.0);
    vec3 green = rgb(126.0, 187.0, 0.0);
    vec3 blue = rgb(0.0, 161.0, 241.0);
    vec3 yellow = rgb(255.0, 185.0, 0.0);
    
    // Default color (white background)
    vec3 color = vec3(1.0);

    // Check if the UV coordinates are inside the logo bounds
    if (all(greaterThan(uv, minBound)) && all(lessThan(uv, maxBound))) {
        // Normalize UV within the logo region
        vec2 logoUv = (uv - minBound) / (maxBound - minBound);

        // Assign colors based on quadrant (with gap)
        if (logoUv.x < 0.5 - gap / 2.0) {
            if (logoUv.y < 0.5 - gap / 2.0) {
                color = blue;  // Bottom-left
            } else if (logoUv.y >= 0.5 + gap / 2.0) {
                color = red;   // Top-left
            }
        } else if (logoUv.x >= 0.5 + gap / 2.0) {
            if (logoUv.y < 0.5 - gap / 2.0) {
                color = yellow; // Bottom-right
            } else if (logoUv.y >= 0.5 + gap / 2.0) {
                color = green;  // Top-right
            }
        }
    }

    return color;
}
