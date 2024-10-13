precision mediump float;

uniform vec2 u_resolution;

// Utility function to convert RGB (0-255) to normalized float (0.0-1.0)
vec3 rgb(float r, float g, float b) {
    return vec3(r / 255.0, g / 255.0, b / 255.0);
}

void main() {
    // Normalize pixel coordinates to range [0, 1]
    vec2 uv = gl_FragCoord.xy / u_resolution;

    // Define rectangle boundaries for the logo area
    float minX = 0.25;
    float maxX = 0.75;
    float minY = 0.25;
    float maxY = 0.75;

    // Define the gap between the squares
    float gap = 0.05;

    // Check if the pixel is inside the logo area
    if (uv.x > minX && uv.x < maxX && uv.y > minY && uv.y < maxY) {
        // Normalize coordinates within the logo region
        vec2 logoUV = (uv - vec2(minX, minY)) / (maxX - minX);

        // Determine the quadrant (accounting for the gap)
        float midX = 0.5;
        float midY = 0.5;

        vec3 color = vec3(1.0); // Default is white (gap)

        // Use rgb() to set correct colors
        if (logoUV.x < midX - gap / 2.0 && logoUV.y < midY - gap / 2.0) {
            // Bottom-left: Blue
            color = rgb(0.0, 161.0, 241.0);  // Blue
        } else if (logoUV.x >= midX + gap / 2.0 && logoUV.y < midY - gap / 2.0) {
            // Top-right: Yellow
            color = rgb(255.0, 185.0, 0.0);  // Yellow
        } else if (logoUV.x < midX - gap / 2.0 && logoUV.y >= midY + gap / 2.0) {
            // Top-left: Red
            color = rgb(243.0, 82.0, 32.0);  // Red
        } else if (logoUV.x >= midX + gap / 2.0 && logoUV.y >= midY + gap / 2.0) {
            // Bottom-right: Green
            color = rgb(126.0, 187.0, 0.0);  // Green
        }

        // Set the fragment color based on which square the pixel is in
        gl_FragColor = vec4(color, 1.0);
    } else {
        // Outside the logo area, set to white
        gl_FragColor = vec4(1.0);
    }
}
