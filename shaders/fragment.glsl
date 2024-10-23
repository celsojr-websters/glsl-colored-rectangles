precision highp float;

#include "common.glsl"
#include "microsoftLogo.glsl"
#include "square.glsl"
#include "circle.glsl"

uniform vec2 u_resolution;

// Define the gap between the squares
#define gap 0.05

vec3 color = vec3(0.8);  // Default background color

void main() {
    // Normalize pixel coordinates to range (0-1)
    vec2 uv = gl_FragCoord.xy / u_resolution;

    // vec2 circleCenter = vec2(0.5);      // Center of the normalized screen
    // float circleRadius = 0.25;                 // Radius for the circle
    // vec3 circleColor = rgb(255.0);

    // color = drawCircle(uv, circleCenter, circleRadius, circleColor);

    // vec2 squareMinBound = vec2(0.25);
    // vec2 squareMaxBound = vec2(0.75);
    // vec3 squareColor = rgb(255.0);

    // color = drawSquare(uv, squareMinBound, squareMaxBound, squareColor);

    // Define rectangle boundaries for the logo area
    vec2 minBound = vec2(0.25);
    vec2 maxBound = vec2(0.75);

    // Draw the Microsoft logo
    color = drawMicrosoftLogo(uv, minBound, maxBound, gap);

    gl_FragColor = vec4(color, 1.0);
}
