class FM13FlashEmitter extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x2D
	if(!Class'BCoreProV55.BallisticMod'.default.bMuzzleSmoke)
	{
		Emitters[0].Disabled = true;
	}
	// End:0x65
	if(WeaponAttachment(Owner) != none)
	{
		Emitters[2].ZTest = true;
		Emitters[3].Disabled = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_OP_Pro.FM13FlashEmitter.SpriteEmitter33'
	begin object name="SpriteEmitter33" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5100000
		FadeOutStartTime=0.8200000
		FadeInEndTime=0.2600000
		MaxParticles=15
		StartLocationRange=(X=(Min=-20.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=4.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=8.0000000)
		StartSizeRange=(X=(Min=6.0000000,Max=8.0000000),Y=(Min=6.0000000,Max=8.0000000),Z=(Min=6.0000000,Max=8.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.SmokeWisp-Alpha'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		SpawnOnTriggerRange=(Min=5.0000000,Max=10.0000000)
		SpawnOnTriggerPPS=4.0000000
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=40.0000000,Max=65.0000000))
	end object
	Emitters[0]=SpriteEmitter33
	// Reference: MeshEmitter'BWBP_OP_Pro.FM13FlashEmitter.MeshEmitter9'
	begin object name="MeshEmitter9" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.M763.M763MuzzleFlash'
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
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=192,G=192,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.3000000,Color=(R=96,G=96,B=64,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=128,G=64,B=32,A=0))
		Opacity=0.3500000
		FadeOutStartTime=0.0550000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[1]=MeshEmitter9
	// Reference: SpriteEmitter'BWBP_OP_Pro.FM13FlashEmitter.SpriteEmitter16'
	begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=224,B=128,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=160,B=32,A=255))
		ColorScale[2]=(RelativeTime=0.3000000,Color=(R=96,G=64,B=64,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=96,G=64,B=0,A=0))
		Opacity=0.5000000
		FadeOutStartTime=0.0950000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationRange=(X=(Min=16.0000000,Max=16.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[2]=SpriteEmitter16
	// Reference: TrailEmitter'BWBP_OP_Pro.FM13FlashEmitter.TrailEmitter0'
	begin object name="TrailEmitter0" class=Engine.TrailEmitter
		TrailShadeType=4
		TrailLocation=1
		MaxPointsPerTrail=150
		MaxTrailTwistAngle=25
		PointLifeTime=2.0000000
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		Disabled=true
		Backup_Disabled=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=212,G=212,B=255,A=255))
		Opacity=0.6000000
		FadeOutStartTime=0.8000000
		MaxParticles=20
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=8.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		SpawnOnTriggerRange=(Min=2.0000000,Max=2.0000000)
		SpawnOnTriggerPPS=10.0000000
	end object
	Emitters[3]=TrailEmitter0
	// Reference: SpriteEmitter'BWBP_OP_Pro.FM13FlashEmitter.SpriteEmitter17'
	begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=224,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=192,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=64,A=255))
		FadeOutStartTime=0.0330000
		CoordinateSystem=1
		MaxParticles=20
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=30.0000000,Max=40.0000000),Y=(Min=30.0000000,Max=40.0000000),Z=(Min=30.0000000,Max=40.0000000))
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		SpawnOnTriggerRange=(Min=16.0000000,Max=20.0000000)
		SpawnOnTriggerPPS=50000.0000000
		StartVelocityRange=(X=(Min=100.0000000,Max=2000.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-200.0000000,Max=200.0000000))
	end object
	Emitters[4]=SpriteEmitter17
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.FM13FlashEmitter.SpriteEmitter33'
begin object name="SpriteEmitter33" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5100000
	FadeOutStartTime=0.8200000
	FadeInEndTime=0.2600000
	MaxParticles=15
	StartLocationRange=(X=(Min=-20.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=4.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=8.0000000)
	StartSizeRange=(X=(Min=6.0000000,Max=8.0000000),Y=(Min=6.0000000,Max=8.0000000),Z=(Min=6.0000000,Max=8.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.SmokeWisp-Alpha'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	SpawnOnTriggerRange=(Min=5.0000000,Max=10.0000000)
	SpawnOnTriggerPPS=4.0000000
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=40.0000000,Max=65.0000000))
end object
// Reference: MeshEmitter'BWBP_OP_Pro.FM13FlashEmitter.MeshEmitter9'
begin object name="MeshEmitter9" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M763.M763MuzzleFlash'
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
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=192,G=192,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.3000000,Color=(R=96,G=96,B=64,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=128,G=64,B=32,A=0))
	Opacity=0.3500000
	FadeOutStartTime=0.0550000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.FM13FlashEmitter.SpriteEmitter16'
begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=224,B=128,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=160,B=32,A=255))
	ColorScale[2]=(RelativeTime=0.3000000,Color=(R=96,G=64,B=64,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=96,G=64,B=0,A=0))
	Opacity=0.5000000
	FadeOutStartTime=0.0950000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationRange=(X=(Min=16.0000000,Max=16.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: TrailEmitter'BWBP_OP_Pro.FM13FlashEmitter.TrailEmitter0'
begin object name="TrailEmitter0" class=Engine.TrailEmitter
	TrailShadeType=4
	TrailLocation=1
	MaxPointsPerTrail=150
	MaxTrailTwistAngle=25
	PointLifeTime=2.0000000
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	Disabled=true
	Backup_Disabled=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=212,G=212,B=255,A=255))
	Opacity=0.6000000
	FadeOutStartTime=0.8000000
	MaxParticles=20
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=8.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	SpawnOnTriggerRange=(Min=2.0000000,Max=2.0000000)
	SpawnOnTriggerPPS=10.0000000
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.FM13FlashEmitter.SpriteEmitter17'
begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=224,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=192,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=64,A=255))
	FadeOutStartTime=0.0330000
	CoordinateSystem=1
	MaxParticles=20
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=30.0000000,Max=40.0000000),Y=(Min=30.0000000,Max=40.0000000),Z=(Min=30.0000000,Max=40.0000000))
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	SpawnOnTriggerRange=(Min=16.0000000,Max=20.0000000)
	SpawnOnTriggerPPS=50000.0000000
	StartVelocityRange=(X=(Min=100.0000000,Max=2000.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-200.0000000,Max=200.0000000))
end object
