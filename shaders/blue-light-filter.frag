// Subtle blue light filter shader for Hyprland
// Reduces blue light to ease eye strain
precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec4 pixColor = texture2D(tex, v_texcoord);

    // Subtle warm tint: slightly reduce blue, slightly boost red
    // This is gentler than typical night mode filters
    pixColor.r *= 1.05;  // Slightly increase red
    pixColor.g *= 1.00;  // Keep green unchanged
    pixColor.b *= 0.90;  // Reduce blue by 10%

    gl_FragColor = pixColor;
}
