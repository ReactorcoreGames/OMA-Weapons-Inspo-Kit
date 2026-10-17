class BRINKFlashEmitter extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x29
	if(WeaponAttachment(Owner) != none)
	{
		Emitters[1].ZTest = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'BWBP_SWC_Pro.BRINKFlashEmitter.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_SKC_Static.MARS.MARSMuzzleFlash'
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
		Acceleration=(X=-80.0000000,Y=0.0000000,Z=0.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.2000000,Color=(R=64,G=64,B=64,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		FadeOutStartTime=0.0150000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.7500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.7500000)
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
		StartVelocityRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=MeshEmitter0
	// Reference: SpriteEmitter'BWBP_SWC_Pro.BRINKFlashEmitter.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=212,B=192,A=0))
		ColorScale[1]=(RelativeTime=0.1285710,Color=(R=255,G=192,B=64,A=255))
		ColorScale[2]=(RelativeTime=0.2750000,Color=(R=192,G=96,B=32,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		FadeOutStartTime=0.0150000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=14.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=110.0000000,Max=110.0000000),Y=(Min=110.0000000,Max=110.0000000),Z=(Min=110.0000000,Max=110.0000000))
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: MeshEmitter'BWBP_SWC_Pro.BRINKFlashEmitter.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.FBlast'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		Opacity=0.3500000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
	end object
	Emitters[2]=MeshEmitter1
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BWBP_SWC_Pro.BRINKFlashEmitter.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_SKC_Static.MARS.MARSMuzzleFlash'
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
	Acceleration=(X=-80.0000000,Y=0.0000000,Z=0.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.2000000,Color=(R=64,G=64,B=64,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	FadeOutStartTime=0.0150000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.7500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.7500000)
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
	StartVelocityRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_SWC_Pro.BRINKFlashEmitter.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=212,B=192,A=0))
	ColorScale[1]=(RelativeTime=0.1285710,Color=(R=255,G=192,B=64,A=255))
	ColorScale[2]=(RelativeTime=0.2750000,Color=(R=192,G=96,B=32,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	FadeOutStartTime=0.0150000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=14.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=110.0000000,Max=110.0000000),Y=(Min=110.0000000,Max=110.0000000),Z=(Min=110.0000000,Max=110.0000000))
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: MeshEmitter'BWBP_SWC_Pro.BRINKFlashEmitter.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.FBlast'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	Opacity=0.3500000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
end object
