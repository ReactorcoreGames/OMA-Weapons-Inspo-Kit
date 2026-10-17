class ONSAttackCraftStreamer extends Emitter;

defaultproperties
{
	// Reference: TrailEmitter'Onslaught.ONSAttackCraftStreamer.TrailEmitter0'
	begin object name="TrailEmitter0" class=Engine.TrailEmitter
		TrailShadeType=3
		TrailLocation=1
		MaxPointsPerTrail=100
		DistanceThreshold=50.0000000
		PointLifeTime=1.0000000
		AlphaTest=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=255))
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.TrailBlura'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=50.0000000,Max=50.0000000)
	end object
	Emitters[0]=TrailEmitter0
	CullDistance=8000.0000000
	bNoDelete=false
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: TrailEmitter'Onslaught.ONSAttackCraftStreamer.TrailEmitter0'
begin object name="TrailEmitter0" class=Engine.TrailEmitter
	TrailShadeType=3
	TrailLocation=1
	MaxPointsPerTrail=100
	DistanceThreshold=50.0000000
	PointLifeTime=1.0000000
	AlphaTest=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=255))
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.TrailBlura'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=50.0000000,Max=50.0000000)
end object
