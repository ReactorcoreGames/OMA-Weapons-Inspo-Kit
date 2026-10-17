class RSDarkAmmoGlowA extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.RSDarkAmmoGlowA.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		ZTest=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.7000000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-1.5000000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		InitialParticlesPerSecond=50.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter10
	// Reference: SpriteEmitter'BallisticProV55.RSDarkAmmoGlowA.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		ZTest=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.7800000
		FadeInEndTime=0.6900000
		MaxParticles=3
		StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=5.0000000,Max=6.0000000),Y=(Min=5.0000000,Max=6.0000000),Z=(Min=5.0000000,Max=6.0000000))
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=3.0000000))
	end object
	Emitters[1]=SpriteEmitter11
	CullDistance=192.0000000
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RSDarkAmmoGlowA.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	ZTest=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.7000000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-1.5000000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	InitialParticlesPerSecond=50.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkAmmoGlowA.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	ZTest=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.7800000
	FadeInEndTime=0.6900000
	MaxParticles=3
	StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=5.0000000,Max=6.0000000),Y=(Min=5.0000000,Max=6.0000000),Z=(Min=5.0000000,Max=6.0000000))
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=3.0000000))
end object
