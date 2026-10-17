class LaserFlashEmitter extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x29
	if(Weapon(Owner) == none)
	{
		Emitters[1].ZTest = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'BWBP_OP_Pro.LaserFlashEmitter.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_SKC_Static.LaserCarbine.PlasmaMuzzleFlash'
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
		Acceleration=(X=-80.0000000,Y=0.0000000,Z=0.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.2000000,Color=(R=64,G=64,B=64,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		FadeOutStartTime=0.0480000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0650000,Max=0.0675000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.6000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.9000000,Max=0.9000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
		StartVelocityRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=MeshEmitter0
	// Reference: SpriteEmitter'BWBP_OP_Pro.LaserFlashEmitter.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=212,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.1285710,Color=(R=255,G=192,B=92,A=255))
		ColorScale[2]=(RelativeTime=0.2750000,Color=(R=192,G=96,B=64,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.7300000
		FadeOutStartTime=0.0390000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=14.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=140.0000000,Max=140.0000000),Y=(Min=140.0000000,Max=140.0000000),Z=(Min=140.0000000,Max=140.0000000))
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: MeshEmitter'BWBP_OP_Pro.LaserFlashEmitter.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.FBlast'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		Opacity=0.4400000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0650000,Max=0.0675000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.3000000,Max=0.3000000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[2]=MeshEmitter1
	// Reference: SpriteEmitter'BWBP_OP_Pro.LaserFlashEmitter.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2607140,Color=(R=0,G=0,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.0560000
		FadeInEndTime=0.0040000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=240.0000000,Max=240.0000000),Y=(Min=240.0000000,Max=240.0000000),Z=(Min=240.0000000,Max=240.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[3]=SpriteEmitter9
	// Reference: SpriteEmitter'BWBP_OP_Pro.LaserFlashEmitter.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.3321430,Color=(R=255,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.4600000
		FadeOutStartTime=0.1470000
		FadeInEndTime=0.0450000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationOffset=(X=140.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=90.0000000,Max=120.0000000),Y=(Min=360.0000000,Max=480.0000000),Z=(Min=360.0000000,Max=480.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.3000000)
		SpawnOnTriggerRange=(Min=3.0000000,Max=3.0000000)
		SpawnOnTriggerPPS=500000.0000000
		StartVelocityRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[4]=SpriteEmitter10
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BWBP_OP_Pro.LaserFlashEmitter.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_SKC_Static.LaserCarbine.PlasmaMuzzleFlash'
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
	Acceleration=(X=-80.0000000,Y=0.0000000,Z=0.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.2000000,Color=(R=64,G=64,B=64,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	FadeOutStartTime=0.0480000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0650000,Max=0.0675000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.6000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.9000000,Max=0.9000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
	StartVelocityRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.LaserFlashEmitter.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=212,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.1285710,Color=(R=255,G=192,B=92,A=255))
	ColorScale[2]=(RelativeTime=0.2750000,Color=(R=192,G=96,B=64,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.7300000
	FadeOutStartTime=0.0390000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=14.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=140.0000000,Max=140.0000000),Y=(Min=140.0000000,Max=140.0000000),Z=(Min=140.0000000,Max=140.0000000))
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: MeshEmitter'BWBP_OP_Pro.LaserFlashEmitter.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.FBlast'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	Opacity=0.4400000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0650000,Max=0.0675000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.3000000,Max=0.3000000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.LaserFlashEmitter.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2607140,Color=(R=0,G=0,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.0560000
	FadeInEndTime=0.0040000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=240.0000000,Max=240.0000000),Y=(Min=240.0000000,Max=240.0000000),Z=(Min=240.0000000,Max=240.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.LaserFlashEmitter.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.3321430,Color=(R=255,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.4600000
	FadeOutStartTime=0.1470000
	FadeInEndTime=0.0450000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationOffset=(X=140.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=90.0000000,Max=120.0000000),Y=(Min=360.0000000,Max=480.0000000),Z=(Min=360.0000000,Max=480.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.3000000)
	SpawnOnTriggerRange=(Min=3.0000000,Max=3.0000000)
	SpawnOnTriggerPPS=500000.0000000
	StartVelocityRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
