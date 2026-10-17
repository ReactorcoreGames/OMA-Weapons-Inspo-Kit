class LonghornClusterFlare extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornClusterFlare.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.8000000
		FadeOutStartTime=0.5000000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=12.0000000,Max=12.0000000))
		ParticlesPerSecond=2.0000000
		InitialParticlesPerSecond=200.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[0]=SpriteEmitter0
	AutoDestroy=true
	bHardAttach=true
	bDirectional=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornClusterFlare.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.8000000
	FadeOutStartTime=0.5000000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=12.0000000,Max=12.0000000))
	ParticlesPerSecond=2.0000000
	InitialParticlesPerSecond=200.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
