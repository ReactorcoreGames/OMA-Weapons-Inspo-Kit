class MRS138TazerProjTrail extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.MRS138TazerProjTrail.MRS138TazerProjTrailEmitter0'
	begin object name="MRS138TazerProjTrailEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=48,B=128,A=0))
		ColorScale[1]=(RelativeTime=0.4285710,Color=(R=0,G=64,B=150,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=48,B=128,A=255))
		Opacity=0.4000000
		FadeOutStartTime=0.3000000
		FadeInEndTime=0.1000000
		CoordinateSystem=1
		MaxParticles=2
		StartSizeRange=(X=(Min=12.0000000,Max=8.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=1.0000000
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'AW-2k4XP.Weapons.ShockTankEffectCore2Ga'
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[0]=MRS138TazerProjTrailEmitter0
	// Reference: SparkEmitter'BallisticProV55.MRS138TazerProjTrail.MRS138TazerProjTrailEmitter1'
	begin object name="MRS138TazerProjTrailEmitter1" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=4.0000000,Max=4.0000000)
		TimeBeforeVisibleRange=(Min=1.0000000,Max=1.0000000)
		TimeBetweenSegmentsRange=(Min=0.0500000,Max=0.0500000)
		FadeOut=true
		ResetAfterChange=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-450.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.0400000
		CoordinateSystem=1
		ParticlesPerSecond=5.0000000
		InitialParticlesPerSecond=1000.0000000
		Texture=Texture'AW-2k4XP.Cicada.LongSpark'
		TextureUSubdivisions=1
		TextureVSubdivisions=1
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
	end object
	Emitters[1]=MRS138TazerProjTrailEmitter1
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.MRS138TazerProjTrail.MRS138TazerProjTrailEmitter0'
begin object name="MRS138TazerProjTrailEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=48,B=128,A=0))
	ColorScale[1]=(RelativeTime=0.4285710,Color=(R=0,G=64,B=150,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=48,B=128,A=255))
	Opacity=0.4000000
	FadeOutStartTime=0.3000000
	FadeInEndTime=0.1000000
	CoordinateSystem=1
	MaxParticles=2
	StartSizeRange=(X=(Min=12.0000000,Max=8.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=1.0000000
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'AW-2k4XP.Weapons.ShockTankEffectCore2Ga'
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: SparkEmitter'BallisticProV55.MRS138TazerProjTrail.MRS138TazerProjTrailEmitter1'
begin object name="MRS138TazerProjTrailEmitter1" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=4.0000000,Max=4.0000000)
	TimeBeforeVisibleRange=(Min=1.0000000,Max=1.0000000)
	TimeBetweenSegmentsRange=(Min=0.0500000,Max=0.0500000)
	FadeOut=true
	ResetAfterChange=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-450.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.0400000
	CoordinateSystem=1
	ParticlesPerSecond=5.0000000
	InitialParticlesPerSecond=1000.0000000
	Texture=Texture'AW-2k4XP.Cicada.LongSpark'
	TextureUSubdivisions=1
	TextureVSubdivisions=1
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
end object
