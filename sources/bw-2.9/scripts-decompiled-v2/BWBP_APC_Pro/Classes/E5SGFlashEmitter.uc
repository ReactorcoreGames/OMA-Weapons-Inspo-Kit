class E5SGFlashEmitter extends BallisticEmitter;

defaultproperties
{
	// Reference: MeshEmitter'BWBP_APC_Pro.E5SGFlashEmitter.MeshEmitter3'
	begin object name="MeshEmitter3" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.VPR.VPRMuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2285710,Color=(R=96,G=96,B=96,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=0.0560000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=-2.0000000,Y=0.0000000,Z=0.0000000)
		SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.4000000)
		StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[0]=MeshEmitter3
	// Reference: SpriteEmitter'BWBP_APC_Pro.E5SGFlashEmitter.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2214290,Color=(R=96,G=96,B=96,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.5700000
		FadeOutStartTime=0.0250000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=125.0000000,Max=125.0000000),Y=(Min=125.0000000,Max=125.0000000),Z=(Min=125.0000000,Max=125.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[1]=SpriteEmitter11
	// Reference: SpriteEmitter'BWBP_APC_Pro.E5SGFlashEmitter.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=255,B=96,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.7500000,Max=0.7500000))
		FadeOutStartTime=0.2400000
		FadeInEndTime=0.0120000
		CoordinateSystem=1
		MaxParticles=5
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.6000000)
		StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
		Texture=Texture'BW_Core_WeaponTex.VPR.VPR-MuzzleEffect'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		SpawnOnTriggerRange=(Min=9.0000000,Max=11.0000000)
		SpawnOnTriggerPPS=75.0000000
		StartVelocityRange=(X=(Min=150.0000000,Max=350.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	end object
	Emitters[2]=SpriteEmitter12
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BWBP_APC_Pro.E5SGFlashEmitter.MeshEmitter3'
begin object name="MeshEmitter3" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.VPR.VPRMuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2285710,Color=(R=96,G=96,B=96,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=0.0560000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=-2.0000000,Y=0.0000000,Z=0.0000000)
	SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.4000000)
	StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.E5SGFlashEmitter.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2214290,Color=(R=96,G=96,B=96,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.5700000
	FadeOutStartTime=0.0250000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=125.0000000,Max=125.0000000),Y=(Min=125.0000000,Max=125.0000000),Z=(Min=125.0000000,Max=125.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.E5SGFlashEmitter.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=255,B=96,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.7500000,Max=0.7500000))
	FadeOutStartTime=0.2400000
	FadeInEndTime=0.0120000
	CoordinateSystem=1
	MaxParticles=5
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.6000000)
	StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
	Texture=Texture'BW_Core_WeaponTex.VPR.VPR-MuzzleEffect'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	SpawnOnTriggerRange=(Min=9.0000000,Max=11.0000000)
	SpawnOnTriggerPPS=75.0000000
	StartVelocityRange=(X=(Min=150.0000000,Max=350.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
end object
