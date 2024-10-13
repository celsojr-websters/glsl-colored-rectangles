precision mediump float;

uniform vec2 u_resolution;

// Define the gap between the squares
#define gap 0.05

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

void main() {
    // Normalize pixel coordinates to range [0, 1]
    vec2 uv = gl_FragCoord.xy / u_resolution;

    // Define rectangle boundaries for the logo area
    vec2 minBound = vec2(0.25);
    vec2 maxBound = vec2(0.75);

    vec3 red = rgb(243.0, 82.0, 32.0);
    vec3 green = rgb(126.0, 187.0, 0.0);
    vec3 blue = rgb(0.0, 161.0, 241.0);
    vec3 yellow = rgb(255.0, 185.0, 0.0);

    // Initialize color to white (background)
    vec3 color = vec3(1.0);

    // Check if the pixel is inside the logo area
    if (all(greaterThan(uv, minBound)) && all(lessThan(uv, maxBound))) {
        // Normalize coordinates within the logo region
        vec2 logoUv = (uv - minBound) / (maxBound - minBound);

        // Assign colors based on the quadrant (accounting for the gap)
        if (logoUv.x < 0.5 - gap / 2.0) {
            if (logoUv.y < 0.5 - gap / 2.0) {
                color = blue; // Bottom-left
            } else if (logoUv.y >= 0.5 + gap / 2.0) {
                color = red; // Top-left
            }
        } else if (logoUv.x >= 0.5 + gap / 2.0) {
            if (logoUv.y < 0.5 - gap / 2.0) {
                color = yellow; // Bottom-right
            } else if (logoUv.y >= 0.5 + gap / 2.0) {
                color = green; // Top-right
            }
        }
    }

    gl_FragColor = vec4(color, 1.0);
}
