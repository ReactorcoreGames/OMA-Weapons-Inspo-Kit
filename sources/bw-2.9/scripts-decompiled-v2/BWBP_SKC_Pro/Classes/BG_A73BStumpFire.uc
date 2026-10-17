class BG_A73BStumpFire extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	SetTimer(0.2000000, true);
	//return;	
}

simulated function Timer()
{
	// End:0x1A
	if(Owner == none)
	{
		SetTimer(0.0000000, false);
		Kill();
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.BG_A73BStumpFire.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=30.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1642860,Color=(R=128,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.3500000,Color=(R=64,G=64,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		ColorMultiplierRange=(X=(Min=3.5000000,Max=0.6000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.3000000,Max=0.4000000))
		FadeOutStartTime=0.4700000
		FadeInEndTime=0.1600000
		MaxParticles=6
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.4500000,Max=0.5500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=12.0000000,Max=16.0000000),Y=(Min=12.0000000,Max=16.0000000),Z=(Min=12.0000000,Max=16.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[0]=SpriteEmitter4
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.BG_A73BStumpFire.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=30.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1642860,Color=(R=128,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.3500000,Color=(R=64,G=64,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	ColorMultiplierRange=(X=(Min=3.5000000,Max=0.6000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.3000000,Max=0.4000000))
	FadeOutStartTime=0.4700000
	FadeInEndTime=0.1600000
	MaxParticles=6
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.4500000,Max=0.5500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=12.0000000,Max=16.0000000),Y=(Min=12.0000000,Max=16.0000000),Z=(Min=12.0000000,Max=16.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
