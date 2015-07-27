attribute vec3 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 v_texcoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    v_texcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_texcoord;

uniform float time;
uniform vec2 mouse_pos;
uniform vec2 resolution;
uniform float shock_amplitude;
uniform float shock_refraction;
uniform float shock_width;

void main()
{ 
    vec2 uv = v_texcoord;
    uv.x *= (resolution.x/resolution.y);
    
    vec2 texCoord = v_texcoord;  
    
    float centre_x = (mouse_pos.x / resolution.x) * (resolution.x/resolution.y);
    float centre_y = mouse_pos.y / resolution.y;
  
    float dist = distance(uv, vec2(centre_x,centre_y));
    
    if ( (dist <= (time + shock_width)) && (dist >= (time - shock_width)) ) 
    {
        float dif = (dist - time); 
        float powDiff = 1.0 - pow(abs(dif*shock_amplitude),shock_refraction); 
        float diffTime = dif  * powDiff;
        vec2 diffUV = normalize(uv - mouse_pos); 
        texCoord = uv + (diffUV * diffTime);
        texCoord.x *= (resolution.y/resolution.x);
    } 
 
    gl_FragColor = texture2D(gm_BaseTexture,texCoord);
}
