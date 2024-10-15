#define antialiasingFactor 0.0012

/**
 * Draws a smooth, anti-aliased square within given bounds using the specified color.
 * The function uses smoothstep to create smooth transitions along the edges for anti-aliasing.
 *
 * @param {vec2} uv - The normalized UV coordinates of the current pixel.
 * @param {vec2} minBound - The lower-left corner of the square in normalized UV coordinates.
 * @param {vec2} maxBound - The upper-right corner of the square in normalized UV coordinates.
 * @param {vec3} squareColor - The RGB color of the square.
 *
 * @return {vec3} A vec3 representing the final color of the pixel, either the square color or 
 *                a mix between the square color and the background color (0.8 gray).
 */
vec3 drawSquare(vec2 uv, vec2 minBound, vec2 maxBound, vec3 squareColor) {

    // Smooth the left and right edges
    float alphaX = smoothstep(minBound.x - antialiasingFactor, minBound.x + antialiasingFactor, uv.x) *
                   smoothstep(maxBound.x + antialiasingFactor, maxBound.x - antialiasingFactor, uv.x);

    // Smooth the top and bottom edges
    float alphaY = smoothstep(minBound.y - antialiasingFactor, minBound.y + antialiasingFactor, uv.y) *
                   smoothstep(maxBound.y + antialiasingFactor, maxBound.y - antialiasingFactor, uv.y);

    // Combine the smoothing along the X and Y axes
    float alpha = alphaX * alphaY;

    // Mix the square color with the background color based on the alpha value
    return mix(vec3(0.8), squareColor, alpha);
}
