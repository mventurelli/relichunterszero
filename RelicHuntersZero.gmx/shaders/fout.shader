float2 vec2(float x0, float x1)
{
    return float2(x0, x1);
}
// Varyings
static float2 _v_texcoord = {0, 0};

static float4 gl_Color[1] =
{
    float4(0, 0, 0, 0)
};


uniform float _gm_AlphaRefValue : register(c3);
uniform bool _gm_AlphaTestEnabled : register(c4);
uniform sampler2D _gm_BaseTexture : register(s0);
uniform float4 _gm_FogColour : register(c5);
uniform bool _gm_PS_FogEnabled : register(c6);
uniform float2 _mouse_pos : register(c7);
uniform float2 _resolution : register(c8);
uniform float _shock_amplitude : register(c9);
uniform float _shock_refraction : register(c10);
uniform float _shock_width : register(c11);
uniform float _time : register(c12);

float4 gl_texture2D(sampler2D s, float2 t)
{
    return tex2D(s, t);
}

#define GL_USES_FRAG_COLOR
;
;
;
;
;
void _DoAlphaTest(in float4 _SrcColour)
{
{
if(_gm_AlphaTestEnabled)
{
{
if((_SrcColour.w <= _gm_AlphaRefValue))
{
{
discard;
;
}
;
}
;
}
;
}
;
}
}
;
void _DoFog(inout float4 _SrcColour, in float _fogval)
{
{
if(_gm_PS_FogEnabled)
{
{
(_SrcColour = lerp(_SrcColour, _gm_FogColour, clamp(_fogval, 0.0, 1.0)));
}
;
}
;
}
}
;
;
;
;
;
;
;
;
void gl_main()
{
{
float2 _uv = _v_texcoord;
(_uv.x *= (_resolution.x / _resolution.y));
float2 _texCoord = _v_texcoord;
float _centre_x = ((_mouse_pos.x / _resolution.x) * (_resolution.x / _resolution.y));
float _centre_y = (_mouse_pos.y / _resolution.y);
float _dist = distance(_uv, vec2(_centre_x, _centre_y));
bool s0;
{
s0 = (_dist <= (_time + _shock_width));
if(s0)
{
    s0 = (_dist >= (_time - _shock_width));
}
}
if(s0)
{
{
float _dif = (_dist - _time);
float _powDiff = (1.0 - pow(abs((_dif * _shock_amplitude)), _shock_refraction));
float _diffTime = (_dif * _powDiff);
float2 _diffUV = normalize((_uv - _mouse_pos));
(_texCoord = (_uv + (_diffUV * _diffTime)));
(_texCoord.x *= (_resolution.y / _resolution.x));
}
;
}
;
(gl_Color[0] = gl_texture2D(_gm_BaseTexture, _texCoord));
}
}
;
struct PS_INPUT
{
    float2 v0 : TEXCOORD0;
};

struct PS_OUTPUT
{
    float4 gl_Color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT input)
{
    _v_texcoord = input.v0.xy;

    gl_main();

    PS_OUTPUT output;
    output.gl_Color0 = gl_Color[0];

    return output;
}
