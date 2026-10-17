class FM13GrenadeFlashEmitter extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x2A
	if(WeaponAttachment(Owner) != none)
	{
		Emitters[2].ZTest = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'BWBP_OP_Pro.FM13GrenadeFlashEmitter.MeshEmitter5'
	begin object name="MeshEmitter5" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.M900.M900MuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=64,B=0,A=0))
		FadeOutStartTime=0.1000000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.1000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		DrawStyle=6
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[0]=MeshEmitter5
	// Reference: SparkEmitter'BWBP_OP_Pro.FM13GrenadeFlashEmitter.SparkEmitter4'
	begin object name="SparkEmitter4" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
		TimeBeforeVisibleRange=(Min=5.0000000,Max=5.0000000)
		TimeBetweenSegmentsRange=(Min=0.0500000,Max=0.1000000)
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=0))
		FadeOutStartTime=0.3000000
		CoordinateSystem=1
		MaxParticles=20
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
		SpawnOnTriggerRange=(Min=20.0000000,Max=20.0000000)
		SpawnOnTriggerPPS=500000.0000000
		StartVelocityRange=(X=(Min=500.0000000,Max=1000.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-200.0000000,Max=200.0000000))
	end object
	Emitters[1]=SparkEmitter4
	// Reference: SpriteEmitter'BWBP_OP_Pro.FM13GrenadeFlashEmitter.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=128,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=64,B=0,A=0))
		FadeOutStartTime=0.2000000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[2]=SpriteEmitter7
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BWBP_OP_Pro.FM13GrenadeFlashEmitter.MeshEmitter5'
begin object name="MeshEmitter5" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M900.M900MuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=64,B=0,A=0))
	FadeOutStartTime=0.1000000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.1000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	DrawStyle=6
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: SparkEmitter'BWBP_OP_Pro.FM13GrenadeFlashEmitter.SparkEmitter4'
begin object name="SparkEmitter4" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
	TimeBeforeVisibleRange=(Min=5.0000000,Max=5.0000000)
	TimeBetweenSegmentsRange=(Min=0.0500000,Max=0.1000000)
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=0))
	FadeOutStartTime=0.3000000
	CoordinateSystem=1
	MaxParticles=20
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
	SpawnOnTriggerRange=(Min=20.0000000,Max=20.0000000)
	SpawnOnTriggerPPS=500000.0000000
	StartVelocityRange=(X=(Min=500.0000000,Max=1000.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-200.0000000,Max=200.0000000))
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.FM13GrenadeFlashEmitter.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=128,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=64,B=0,A=0))
	FadeOutStartTime=0.2000000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
