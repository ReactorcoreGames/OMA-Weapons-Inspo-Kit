class A73TrailEmitterBal extends BallisticEmitter;

simulated function Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0x19
	if(Base == none)
	{
		Destroy();
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.A73TrailEmitterBal.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=120,G=32,B=120,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=240,G=64,B=240,A=0))
		Opacity=0.7000000
		FadeOutStartTime=0.2000000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=1
		StartSizeRange=(X=(Min=40.0000000,Max=70.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1500000,Max=0.3000000)
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: TrailEmitter'BallisticProV55.A73TrailEmitterBal.TrailEmitter0'
	begin object name="TrailEmitter0" class=Engine.TrailEmitter
		TrailShadeType=3
		TrailLocation=1
		MaxPointsPerTrail=150
		DistanceThreshold=50.0000000
		UseCrossedSheets=true
		PointLifeTime=0.4000000
		FadeOut=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3500000,Max=0.4500000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.4000000
		FadeOutStartTime=0.1000000
		MaxParticles=1
		StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=9999.0000000,Max=9999.0000000)
	end object
	Emitters[1]=TrailEmitter0
	// Reference: SpriteEmitter'BallisticProV55.A73TrailEmitterBal.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4678570,Color=(R=255,G=64,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		FadeOutStartTime=0.1000000
		MaxParticles=9
		DetailMode=2
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.2000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.4000000)
		StartSizeRange=(X=(Min=1.5000000,Max=2.0000000),Y=(Min=1.5000000,Max=2.0000000),Z=(Min=1.5000000,Max=2.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.A73PurpleLayout.A73MuzzleFlash'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SubdivisionStart=1
		SubdivisionEnd=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4500000,Max=0.4500000)
	end object
	Emitters[2]=SpriteEmitter2
	Physics=10
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.A73TrailEmitterBal.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=120,G=32,B=120,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=240,G=64,B=240,A=0))
	Opacity=0.7000000
	FadeOutStartTime=0.2000000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=1
	StartSizeRange=(X=(Min=40.0000000,Max=70.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1500000,Max=0.3000000)
end object
// Reference: TrailEmitter'BallisticProV55.A73TrailEmitterBal.TrailEmitter0'
begin object name="TrailEmitter0" class=Engine.TrailEmitter
	TrailShadeType=3
	TrailLocation=1
	MaxPointsPerTrail=150
	DistanceThreshold=50.0000000
	UseCrossedSheets=true
	PointLifeTime=0.4000000
	FadeOut=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3500000,Max=0.4500000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.4000000
	FadeOutStartTime=0.1000000
	MaxParticles=1
	StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=9999.0000000,Max=9999.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.A73TrailEmitterBal.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4678570,Color=(R=255,G=64,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	FadeOutStartTime=0.1000000
	MaxParticles=9
	DetailMode=2
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.2000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.4000000)
	StartSizeRange=(X=(Min=1.5000000,Max=2.0000000),Y=(Min=1.5000000,Max=2.0000000),Z=(Min=1.5000000,Max=2.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.A73PurpleLayout.A73MuzzleFlash'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SubdivisionStart=1
	SubdivisionEnd=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4500000,Max=0.4500000)
end object
