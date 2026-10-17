class MRS138FlashEmitter_C extends BallisticEmitter;

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
	// Reference: SpriteEmitter'BallisticProV55.MRS138FlashEmitter_C.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.7000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=0.4800000
		FadeInEndTime=0.3600000
		MaxParticles=600
		DetailMode=2
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=3.0000000,Max=4.0000000),Z=(Min=3.0000000,Max=4.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.3000000)
		SpawnOnTriggerRange=(Min=300.0000000,Max=600.0000000)
		SpawnOnTriggerPPS=300.0000000
		StartVelocityRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: MeshEmitter'BallisticProV55.MRS138FlashEmitter_C.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.M806.PistolMuzzleFlash'
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
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=192,G=192,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=64,B=32,A=0))
		FadeOutStartTime=0.0800000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[1]=MeshEmitter0
	// Reference: SpriteEmitter'BallisticProV55.MRS138FlashEmitter_C.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.1428570,Color=(R=255,G=192,B=64,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=192,G=128,B=64,A=0))
		Opacity=0.7200000
		FadeOutStartTime=0.2000000
		FadeInEndTime=0.0320000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=12.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=16.0000000,Max=16.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: SpriteEmitter'BallisticProV55.MRS138FlashEmitter_C.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2071430,Color=(R=255,G=192,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=96,B=32,A=255))
		FadeOutStartTime=0.1505000
		FadeInEndTime=0.0210000
		CoordinateSystem=1
		MaxParticles=20
		StartLocationOffset=(X=30.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=2.5000000,Max=5.0000000),Y=(Min=2.5000000,Max=5.0000000),Z=(Min=2.5000000,Max=5.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		SpawnOnTriggerRange=(Min=20.0000000,Max=14.0000000)
		SpawnOnTriggerPPS=50000.0000000
		StartVelocityRange=(X=(Min=800.0000000,Max=4000.0000000),Y=(Min=-400.0000000,Max=400.0000000),Z=(Min=-400.0000000,Max=400.0000000))
	end object
	Emitters[3]=SpriteEmitter0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.MRS138FlashEmitter_C.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.7000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=0.4800000
	FadeInEndTime=0.3600000
	MaxParticles=600
	DetailMode=2
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=3.0000000,Max=4.0000000),Z=(Min=3.0000000,Max=4.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.3000000)
	SpawnOnTriggerRange=(Min=300.0000000,Max=600.0000000)
	SpawnOnTriggerPPS=300.0000000
	StartVelocityRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.MRS138FlashEmitter_C.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M806.PistolMuzzleFlash'
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
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=192,G=192,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=64,B=32,A=0))
	FadeOutStartTime=0.0800000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: SpriteEmitter'BallisticProV55.MRS138FlashEmitter_C.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.1428570,Color=(R=255,G=192,B=64,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=192,G=128,B=64,A=0))
	Opacity=0.7200000
	FadeOutStartTime=0.2000000
	FadeInEndTime=0.0320000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=12.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=16.0000000,Max=16.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: SpriteEmitter'BallisticProV55.MRS138FlashEmitter_C.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2071430,Color=(R=255,G=192,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=96,B=32,A=255))
	FadeOutStartTime=0.1505000
	FadeInEndTime=0.0210000
	CoordinateSystem=1
	MaxParticles=20
	StartLocationOffset=(X=30.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=2.5000000,Max=5.0000000),Y=(Min=2.5000000,Max=5.0000000),Z=(Min=2.5000000,Max=5.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	SpawnOnTriggerRange=(Min=20.0000000,Max=14.0000000)
	SpawnOnTriggerPPS=50000.0000000
	StartVelocityRange=(X=(Min=800.0000000,Max=4000.0000000),Y=(Min=-400.0000000,Max=400.0000000),Z=(Min=-400.0000000,Max=400.0000000))
end object
