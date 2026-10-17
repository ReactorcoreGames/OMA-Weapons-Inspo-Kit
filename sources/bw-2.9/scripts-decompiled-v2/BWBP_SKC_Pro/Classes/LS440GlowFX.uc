class LS440GlowFX extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x29
	if(WeaponAttachment(Owner) != none)
	{
		Emitters[0].ZTest = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LS440GlowFX.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		ZTest=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.0600000
		FadeInEndTime=0.0420000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-3.0000000,Max=3.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		Texture=Texture'BWBP_SKC_Tex.BFG.PlasmaSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SubdivisionScale[0]=2.0000000
		SubdivisionScale[1]=8.0000000
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2010000,Max=0.2010000)
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=SpriteEmitter2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.LS440GlowFX.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	ZTest=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.0600000
	FadeInEndTime=0.0420000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-3.0000000,Max=3.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	Texture=Texture'BWBP_SKC_Tex.BFG.PlasmaSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SubdivisionScale[0]=2.0000000
	SubdivisionScale[1]=8.0000000
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2010000,Max=0.2010000)
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
