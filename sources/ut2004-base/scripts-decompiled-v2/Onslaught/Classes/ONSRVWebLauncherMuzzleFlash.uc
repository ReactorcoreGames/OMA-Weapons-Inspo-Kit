class ONSRVWebLauncherMuzzleFlash extends Emitter;

defaultproperties
{
	// Reference: MeshEmitter'Onslaught.ONSRVWebLauncherMuzzleFlash.MeshEmitter2'
	begin object name="MeshEmitter2" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'AW-2004Particles.Weapons.ONSMuzzleFlash'
		RenderTwoSided=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ResetOnTrigger=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.4000000,Color=(R=64,G=255,B=64,A=0))
		ColorScale[2]=(RelativeTime=0.6000000,Color=(R=64,G=255,B=64,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=1
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=-1.0000000,Max=-1.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=0
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
	end object
	Emitters[0]=MeshEmitter2
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'Onslaught.ONSRVWebLauncherMuzzleFlash.MeshEmitter2'
begin object name="MeshEmitter2" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'AW-2004Particles.Weapons.ONSMuzzleFlash'
	RenderTwoSided=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ResetOnTrigger=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.4000000,Color=(R=64,G=255,B=64,A=0))
	ColorScale[2]=(RelativeTime=0.6000000,Color=(R=64,G=255,B=64,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=1
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=-1.0000000,Max=-1.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=0
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
end object
