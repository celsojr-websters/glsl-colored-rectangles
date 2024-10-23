
#define antialiasingFactor 0.0012

/**
 * Draws a smooth, anti-aliased circle at a given position with a specified radius and color.
 * The function uses smoothstep to create a smooth transition along the circle's edge to achieve anti-aliasing.
 *
 * @param {vec2} uv - The normalized UV coordinates of the current pixel.
 * @param {vec2} center - The center of the circle in normalized UV coordinates.
 * @param {float} radius - The radius of the circle.
 * @param {vec3} circleColor - The RGB color of the circle.
 *
 * @return {vec3} A vec3 representing the final color of the pixel, either the circle color or 
 *                a mix between the circle color and the background color (0.8 gray).
 */
vec3 drawCircle(vec2 uv, vec2 center, float radius, vec3 circleColor) {
    float dist = distance(uv, center);

    // Create a smooth transition for the circle's edge using smoothstep
    float alpha = smoothstep(radius + antialiasingFactor, radius - antialiasingFactor, dist);

    // Mix the circle color and background color based on the alpha value
    return mix(vec3(0.8), circleColor, alpha);  // 0.8 is the background color
}
