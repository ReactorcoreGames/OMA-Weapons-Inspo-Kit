class RSDarkSlowMuzzleFlash extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x65
	if(WeaponAttachment(Owner) != none)
	{
		Emitters[1].ZTest = true;
		Emitters[2].ZTest = true;
		Emitters[3].ZTest = true;
		Emitters[4].ZTest = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'BallisticProV55.RSDarkSlowMuzzleFlash.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.M763.M763MuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.2000000,Max=0.2000000))
		Opacity=0.5000000
		FadeOutStartTime=0.1950000
		FadeInEndTime=0.0100000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationOffset=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2500000,Max=0.2500000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2500000,Max=0.2500000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=50000.0000000
		StartVelocityRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=MeshEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSDarkSlowMuzzleFlash.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		ZTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1500000,Color=(R=255,G=64,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		Opacity=0.5000000
		FadeOutStartTime=0.1350000
		CoordinateSystem=1
		MaxParticles=6
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.6000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=40.0000000,Max=50.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.DirtSpray'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		SpawnOnTriggerRange=(Min=2.0000000,Max=2.0000000)
		SpawnOnTriggerPPS=50000.0000000
		StartVelocityRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter9
	// Reference: SpriteEmitter'BallisticProV55.RSDarkSlowMuzzleFlash.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		RespawnDeadParticles=false
		ZTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5000000
		FadeOutStartTime=0.3550000
		CoordinateSystem=1
		MaxParticles=3
		DetailMode=2
		StartLocationOffset=(X=50.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.6000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=50000.0000000
		StartVelocityRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[2]=SpriteEmitter10
	// Reference: SpriteEmitter'BallisticProV55.RSDarkSlowMuzzleFlash.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		ZTest=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
		Opacity=0.5000000
		FadeOutStartTime=0.2900000
		FadeInEndTime=0.0150000
		CoordinateSystem=1
		MaxParticles=30
		DetailMode=2
		StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=1.5000000,Max=2.5000000),Y=(Min=12.0000000,Max=24.0000000),Z=(Min=12.0000000,Max=24.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		SpawnOnTriggerRange=(Min=10.0000000,Max=10.0000000)
		SpawnOnTriggerPPS=5000.0000000
		StartVelocityRange=(X=(Min=1.0000000,Max=300.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	end object
	Emitters[3]=SpriteEmitter11
	// Reference: SpriteEmitter'BallisticProV55.RSDarkSlowMuzzleFlash.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		ZTest=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=224,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=192,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.2142860,Color=(R=255,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=0.4285710,Color=(R=160,G=0,B=255,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=160,G=0,B=255,A=255))
		Opacity=0.5000000
		FadeOutStartTime=0.0570000
		CoordinateSystem=1
		MaxParticles=3
		StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=50000.0000000
	end object
	Emitters[4]=SpriteEmitter12
	// Reference: SpriteEmitter'BallisticProV55.RSDarkSlowMuzzleFlash.SpriteEmitter13'
	begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.2607140,Color=(R=255,G=64,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.4142860,Color=(R=255,G=192,B=128,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=192,G=0,B=255,A=255))
		Opacity=0.5000000
		FadeOutStartTime=0.5840000
		FadeInEndTime=0.0880000
		CoordinateSystem=1
		MaxParticles=100
		DetailMode=2
		StartLocationShape=1
		SphereRadiusRange=(Min=45.0000000,Max=45.0000000)
		StartSizeRange=(X=(Min=6.0000000,Max=8.0000000),Y=(Min=6.0000000,Max=8.0000000),Z=(Min=6.0000000,Max=8.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		SpawnOnTriggerRange=(Min=12.0000000,Max=10.0000000)
		SpawnOnTriggerPPS=5000.0000000
		StartVelocityRadialRange=(Min=-75.0000000,Max=-75.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[5]=SpriteEmitter13
	// Reference: SpriteEmitter'BallisticProV55.RSDarkSlowMuzzleFlash.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.3607140,Color=(R=255,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		Opacity=0.5000000
		FadeOutStartTime=0.6800000
		FadeInEndTime=0.0960000
		CoordinateSystem=1
		MaxParticles=45
		DetailMode=2
		StartLocationOffset=(X=-30.0000000,Y=0.0000000,Z=6.0000000)
		StartSpinRange=(X=(Min=-0.0300000,Max=0.0300000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=0.3700000,RelativeSize=1.5000000)
		SizeScale[3]=(RelativeTime=0.5000000,RelativeSize=0.7000000)
		SizeScale[4]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
		SizeScale[5]=(RelativeTime=0.7500000,RelativeSize=0.8000000)
		SizeScale[6]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.2000000,Max=1.2000000)
		SpawnOnTriggerRange=(Min=15.0000000,Max=15.0000000)
		SpawnOnTriggerPPS=30.0000000
		StartVelocityRange=(X=(Min=-100.0000000,Max=-100.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[6]=SpriteEmitter14
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.RSDarkSlowMuzzleFlash.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M763.M763MuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.2000000,Max=0.2000000))
	Opacity=0.5000000
	FadeOutStartTime=0.1950000
	FadeInEndTime=0.0100000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationOffset=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2500000,Max=0.2500000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2500000,Max=0.2500000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=50000.0000000
	StartVelocityRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkSlowMuzzleFlash.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	ZTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1500000,Color=(R=255,G=64,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	Opacity=0.5000000
	FadeOutStartTime=0.1350000
	CoordinateSystem=1
	MaxParticles=6
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.6000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=40.0000000,Max=50.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.DirtSpray'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	SpawnOnTriggerRange=(Min=2.0000000,Max=2.0000000)
	SpawnOnTriggerPPS=50000.0000000
	StartVelocityRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkSlowMuzzleFlash.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	RespawnDeadParticles=false
	ZTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5000000
	FadeOutStartTime=0.3550000
	CoordinateSystem=1
	MaxParticles=3
	DetailMode=2
	StartLocationOffset=(X=50.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.6000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=50000.0000000
	StartVelocityRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkSlowMuzzleFlash.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	ZTest=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
	Opacity=0.5000000
	FadeOutStartTime=0.2900000
	FadeInEndTime=0.0150000
	CoordinateSystem=1
	MaxParticles=30
	DetailMode=2
	StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=1.5000000,Max=2.5000000),Y=(Min=12.0000000,Max=24.0000000),Z=(Min=12.0000000,Max=24.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	SpawnOnTriggerRange=(Min=10.0000000,Max=10.0000000)
	SpawnOnTriggerPPS=5000.0000000
	StartVelocityRange=(X=(Min=1.0000000,Max=300.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkSlowMuzzleFlash.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	ZTest=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=224,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=192,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.2142860,Color=(R=255,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=0.4285710,Color=(R=160,G=0,B=255,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=160,G=0,B=255,A=255))
	Opacity=0.5000000
	FadeOutStartTime=0.0570000
	CoordinateSystem=1
	MaxParticles=3
	StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=50000.0000000
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkSlowMuzzleFlash.SpriteEmitter13'
begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.2607140,Color=(R=255,G=64,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.4142860,Color=(R=255,G=192,B=128,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=192,G=0,B=255,A=255))
	Opacity=0.5000000
	FadeOutStartTime=0.5840000
	FadeInEndTime=0.0880000
	CoordinateSystem=1
	MaxParticles=100
	DetailMode=2
	StartLocationShape=1
	SphereRadiusRange=(Min=45.0000000,Max=45.0000000)
	StartSizeRange=(X=(Min=6.0000000,Max=8.0000000),Y=(Min=6.0000000,Max=8.0000000),Z=(Min=6.0000000,Max=8.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	SpawnOnTriggerRange=(Min=12.0000000,Max=10.0000000)
	SpawnOnTriggerPPS=5000.0000000
	StartVelocityRadialRange=(Min=-75.0000000,Max=-75.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkSlowMuzzleFlash.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.3607140,Color=(R=255,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	Opacity=0.5000000
	FadeOutStartTime=0.6800000
	FadeInEndTime=0.0960000
	CoordinateSystem=1
	MaxParticles=45
	DetailMode=2
	StartLocationOffset=(X=-30.0000000,Y=0.0000000,Z=6.0000000)
	StartSpinRange=(X=(Min=-0.0300000,Max=0.0300000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=0.3700000,RelativeSize=1.5000000)
	SizeScale[3]=(RelativeTime=0.5000000,RelativeSize=0.7000000)
	SizeScale[4]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
	SizeScale[5]=(RelativeTime=0.7500000,RelativeSize=0.8000000)
	SizeScale[6]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.2000000,Max=1.2000000)
	SpawnOnTriggerRange=(Min=15.0000000,Max=15.0000000)
	SpawnOnTriggerPPS=30.0000000
	StartVelocityRange=(X=(Min=-100.0000000,Max=-100.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
