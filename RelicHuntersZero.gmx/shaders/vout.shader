float4 vec4(float3 x0, float x1)
{
    return float4(x0, x1);
}
// Attributes
static float3 _in_Position = {0, 0, 0};
static float2 _in_TextureCoord = {0, 0};

static float4 gl_Position = float4(0, 0, 0, 0);

// Varyings
static float2 _v_texcoord = {0, 0};

uniform float4 dx_ViewAdjust : register(c1);

uniform float4 _gm_AmbientColour : register(c2);
uniform float _gm_FogStart : register(c3);
uniform bool _gm_LightingEnabled : register(c4);
uniform float4 _gm_Lights_Colour[8] : register(c5);
uniform float4 _gm_Lights_Direction[8] : register(c13);
uniform float4 _gm_Lights_PosRange[8] : register(c21);
uniform float4x4 _gm_Matrices[5] : register(c29);
uniform float _gm_RcpFogRange : register(c49);
uniform bool _gm_VS_FogEnabled : register(c50);

;
;
;
;
;
;
;
;
;
float _CalcFogFactor(in float4 _pos)
{
{
if(_gm_VS_FogEnabled)
{
{
float4 _viewpos = mul((_gm_Matrices[3]), _pos);
float _fogfactor = ((_viewpos.z - _gm_FogStart) * _gm_RcpFogRange);
return _fogfactor;
;
}
;
}
else
{
{
return 0.0;
;
}
;
}
;
}
}
;
float4 _DoDirLight(in float3 _ws_normal, in float4 _dir, in float4 _diffusecol)
{
{
float _dotresult = dot(_ws_normal, _dir.xyz);
(_dotresult = max(0.0, _dotresult));
return (_dotresult * _diffusecol);
;
}
}
;
float4 _DoPointLight(in float3 _ws_pos, in float3 _ws_normal, in float4 _posrange, in float4 _diffusecol)
{
{
float3 _diffvec = (_ws_pos - _posrange.xyz);
float _veclen = length(_diffvec);
(_diffvec /= _veclen);
float _atten = (1.0 / (_veclen / _posrange.w));
if((_veclen > _posrange.w))
{
{
(_atten = 0.0);
}
;
}
;
float _dotresult = dot(_ws_normal, _diffvec);
(_dotresult = max(0.0, _dotresult));
return ((_dotresult * _atten) * _diffusecol);
;
}
}
;
float4 _DoLighting(in float4 _vertexcolour, in float4 _objectspacepos, in float3 _objectspacenormal)
{
{
if(_gm_LightingEnabled)
{
{
float4 _objectspacenormal4 = vec4(_objectspacenormal, 0.0);
float3 _ws_normal = {0, 0, 0};
(_ws_normal = mul((_gm_Matrices[3]), _objectspacenormal4).xyz);
(_ws_normal = (-normalize(_ws_normal)));
float3 _ws_pos = {0, 0, 0};
(_ws_pos = mul((_gm_Matrices[2]), _objectspacepos).xyz);
float4 _accumcol = float4(0.0, 0.0, 0.0, 0.0);
{for(int _i = 0; (_i < 8); (_i++))
{
{
(_accumcol += _DoDirLight(_ws_normal, _gm_Lights_Direction[_i], _gm_Lights_Colour[_i]));
}
;}
}
;
{for(int _i = 0; (_i < 8); (_i++))
{
{
(_accumcol += _DoPointLight(_ws_pos, _ws_normal, _gm_Lights_PosRange[_i], _gm_Lights_Colour[_i]));
}
;}
}
;
(_accumcol *= _vertexcolour);
(_accumcol += _gm_AmbientColour);
(_accumcol = min(float4(1.0, 1.0, 1.0, 1.0), _accumcol));
return _accumcol;
;
}
;
}
else
{
{
return _vertexcolour;
;
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
void gl_main()
{
{
(gl_Position = mul((_gm_Matrices[4]), vec4(_in_Position, 1.0)));
(_v_texcoord = _in_TextureCoord);
}
}
;
struct VS_INPUT
{
    float3 _in_Position : POSITION;
    float2 _in_TextureCoord : TEXCOORD0;
};

struct VS_OUTPUT
{
    float4 gl_Position : POSITION;
    float2 v0 : TEXCOORD0;
};

VS_OUTPUT main(VS_INPUT input)
{
    _in_Position = (input._in_Position);
    _in_TextureCoord = (input._in_TextureCoord);

    gl_main();

    VS_OUTPUT output;
    output.gl_Position.x = gl_Position.x;
    output.gl_Position.y = gl_Position.y;
    output.gl_Position.z = gl_Position.z;
    output.gl_Position.w = gl_Position.w;
    output.v0 = _v_texcoord;

    return output;
}
