class Shader extends RenderedMaterial
	native
	editinlinenew
	collapsecategories
	safereplace
	hidecategories(Object);

enum EOutputBlending
{
	OB_Normal,                      // 0
	OB_Masked,                      // 1
	OB_Modulate,                    // 2
	OB_Translucent,                 // 3
	OB_Invisible,                   // 4
	OB_Brighten,                    // 5
	OB_Darken                       // 6
};

var() editinlineuse Material Diffuse;
var() editinlineuse Material Opacity;
var() editinlineuse Material Specular;
var() editinlineuse Material SpecularityMask;
var() editinlineuse Material SelfIllumination;
var() editinlineuse Material SelfIlluminationMask;
var() editinlineuse Material Detail;
var() float DetailScale;
var() Shader.EOutputBlending OutputBlending;
var() bool TwoSided;
var() bool Wireframe;
var bool ModulateStaticLighting2X;
var() bool PerformLightingOnSpecularPass;
var() bool ModulateSpecular2X;

function Reset()
{
	// End:0x1A
	if(Diffuse != none)
	{
		Diffuse.Reset();
	}
	// End:0x34
	if(Opacity != none)
	{
		Opacity.Reset();
	}
	// End:0x4E
	if(Specular != none)
	{
		Specular.Reset();
	}
	// End:0x68
	if(SpecularityMask != none)
	{
		SpecularityMask.Reset();
	}
	// End:0x82
	if(SelfIllumination != none)
	{
		SelfIllumination.Reset();
	}
	// End:0x9C
	if(SelfIlluminationMask != none)
	{
		SelfIlluminationMask.Reset();
	}
	// End:0xB6
	if(FallbackMaterial != none)
	{
		FallbackMaterial.Reset();
	}
	//return;	
}

function Trigger(Actor Other, Actor EventInstigator)
{
	// End:0x24
	if(Diffuse != none)
	{
		Diffuse.Trigger(Other, EventInstigator);
	}
	// End:0x48
	if(Opacity != none)
	{
		Opacity.Trigger(Other, EventInstigator);
	}
	// End:0x6C
	if(Specular != none)
	{
		Specular.Trigger(Other, EventInstigator);
	}
	// End:0x90
	if(SpecularityMask != none)
	{
		SpecularityMask.Trigger(Other, EventInstigator);
	}
	// End:0xB4
	if(SelfIllumination != none)
	{
		SelfIllumination.Trigger(Other, EventInstigator);
	}
	// End:0xD8
	if(SelfIlluminationMask != none)
	{
		SelfIlluminationMask.Trigger(Other, EventInstigator);
	}
	// End:0xFC
	if(FallbackMaterial != none)
	{
		FallbackMaterial.Trigger(Other, EventInstigator);
	}
	//return;	
}

defaultproperties
{
	DetailScale=8.0000000
	ModulateStaticLighting2X=true
	MaterialType=4
}
