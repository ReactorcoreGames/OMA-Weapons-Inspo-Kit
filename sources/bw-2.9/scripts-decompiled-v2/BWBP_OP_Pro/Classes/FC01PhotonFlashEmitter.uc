class FC01PhotonFlashEmitter extends BallisticEmitter;

defaultproperties
{
	// Reference: MeshEmitter'BWBP_OP_Pro.FC01PhotonFlashEmitter.MeshEmitter5'
	begin object name="MeshEmitter5" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_OP_Static.ProtoLMG.ProtoLMGMuzzleFlash'
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
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=128,G=192,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=160,A=255))
		FadeOutStartTime=0.1300000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
		StartSizeRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.3000000,Max=1.3000000),Z=(Min=1.3000000,Max=1.3000000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[0]=MeshEmitter5
	// Reference: SpriteEmitter'BWBP_OP_Pro.FC01PhotonFlashEmitter.SpriteEmitter26'
	begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=192,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=192,B=64,A=255))
		ColorScale[2]=(RelativeTime=0.6071430,Color=(R=0,G=192,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=192,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=0.9000000,Max=1.0000000))
		Opacity=0.6700000
		FadeOutStartTime=0.0440000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationOffset=(X=50.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=120.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=60.0000000),Y=(Min=30.0000000,Max=60.0000000),Z=(Min=30.0000000,Max=60.0000000))
		Texture=Texture'BWBP_SKC_Tex.XM20.F2000-LensFlares2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		SpawnOnTriggerRange=(Min=3.0000000,Max=3.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[1]=SpriteEmitter26
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BWBP_OP_Pro.FC01PhotonFlashEmitter.MeshEmitter5'
begin object name="MeshEmitter5" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_OP_Static.ProtoLMG.ProtoLMGMuzzleFlash'
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
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=128,G=192,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=160,A=255))
	FadeOutStartTime=0.1300000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
	StartSizeRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.3000000,Max=1.3000000),Z=(Min=1.3000000,Max=1.3000000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.FC01PhotonFlashEmitter.SpriteEmitter26'
begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=192,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=192,B=64,A=255))
	ColorScale[2]=(RelativeTime=0.6071430,Color=(R=0,G=192,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=192,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=0.9000000,Max=1.0000000))
	Opacity=0.6700000
	FadeOutStartTime=0.0440000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationOffset=(X=50.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=120.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=60.0000000),Y=(Min=30.0000000,Max=60.0000000),Z=(Min=30.0000000,Max=60.0000000))
	Texture=Texture'BWBP_SKC_Tex.XM20.F2000-LensFlares2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	SpawnOnTriggerRange=(Min=3.0000000,Max=3.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
