//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~








//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 base_col = texture2D( gm_BaseTexture, v_vTexcoord );
    
    // gamma 1
    base_col.rgb = pow(base_col.rgb, vec3(0.45));
    
    // b & w conversion
    float grey = dot(base_col.rgb, vec3(0.333));
    
    // get threshold weight
    float weight = smoothstep(0.1, 0.25, base_col.r - grey);
    
    // increase contrast
    grey = pow(grey * 1.1, 2.0);
    
    // mix grey & red
    base_col.rgb = mix(vec3(grey), base_col.rgb * vec3(1.1, 0.5, 0.5), weight);
    
    // reverse gamma 1
    
    gl_FragColor = v_vColour * vec4(pow(base_col.rgb, vec3(2.2)), base_col.a);
    
}

/*sampler2D Texture0 : register(s0);
 
float4 main(float2 uv : TEXCOORD0) : COLOR
{
 
    float3 colorin, colorout;
    colorin = tex2D( Texture0 , uv.xy).rgb;
    //convert to linear space, probably not necessary since I totally destroy
    //the color space later anyway
    colorin = pow(colorin, .45f);
    
    //initialize the black&white color to the average color value,
    //not 100% correct but works decently
    float3 bwcolor = dot(colorin.rgb, 1.f.xxx) * 0.33333f;
    
    //calculate the weight of the red color. smoothstep is a function that
    //creates a quadratic interpolation between 0 and 1 using the first
    //arg as the min value, the second as the max value and third as interpolation
    //value, Result is is clamped to be [0, 1]
    //I just picked these constants because they looked decent in the image
    float weight = smoothstep(0.1f, o.25f, colorin.r - bwcolor);
    
    //Mess with the color space of the b&w. Again, arbitrary constants
    bwcolor = pow(bwcolor * 1.1f, 2.f);
    //interpolate between black&white and red based on the weight
    colorout = lerp(bwcolor, colorin * float3(1.1f, 0.5f, 0.5f), weight);
    
    //pow: convert back to gamma space
    return pow(float4(colorout, 1.f), 2.2f);
}*/
