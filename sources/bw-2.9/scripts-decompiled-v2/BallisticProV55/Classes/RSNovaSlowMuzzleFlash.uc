class RSNovaSlowMuzzleFlash extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x29
	if(WeaponAttachment(Owner) != none)
	{
		Emitters[0].ZTest = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseDirectionAs=1
		ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=0.0000000)
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3035710,Color=(R=0,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.6000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=224,G=224,B=0,A=255))
		FadeOutStartTime=0.0400000
		CoordinateSystem=1
		DetailMode=2
		StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=10.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=22.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=12.0000000,Max=16.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=10.0000000,Max=10.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.DirtSpray'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		SpawnOnTriggerRange=(Min=10.0000000,Max=10.0000000)
		SpawnOnTriggerPPS=5000.0000000
		StartVelocityRange=(X=(Min=8.0000000,Max=40.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=40.0000000,Max=40.0000000))
	end object
	Emitters[0]=SpriteEmitter5
	// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		UseDirectionAs=1
		ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=0.0000000)
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3035710,Color=(R=0,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.6000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=224,G=224,B=0,A=255))
		FadeOutStartTime=0.0400000
		CoordinateSystem=1
		DetailMode=2
		StartLocationOffset=(X=-20.0000000,Y=-8.6000000,Z=-5.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=22.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=12.0000000,Max=16.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=10.0000000,Max=10.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.DirtSpray'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		SpawnOnTriggerRange=(Min=10.0000000,Max=10.0000000)
		SpawnOnTriggerPPS=5000.0000000
		StartVelocityRange=(X=(Min=8.0000000,Max=40.0000000),Y=(Min=-34.4000000,Max=-34.4000000),Z=(Min=-20.0000000,Max=-20.0000000))
	end object
	Emitters[1]=SpriteEmitter6
	// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		UseDirectionAs=1
		ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=0.0000000)
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3035710,Color=(R=0,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.6000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=224,G=224,B=0,A=255))
		FadeOutStartTime=0.0400000
		CoordinateSystem=1
		DetailMode=2
		StartLocationOffset=(X=-20.0000000,Y=8.6000000,Z=-5.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=22.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=12.0000000,Max=16.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=10.0000000,Max=10.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.DirtSpray'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		SpawnOnTriggerRange=(Min=10.0000000,Max=10.0000000)
		SpawnOnTriggerPPS=5000.0000000
		StartVelocityRange=(X=(Min=8.0000000,Max=40.0000000),Y=(Min=34.4000000,Max=34.4000000),Z=(Min=-20.0000000,Max=-20.0000000))
	end object
	Emitters[2]=SpriteEmitter7
	// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		FadeOutStartTime=0.5100000
		FadeInEndTime=0.0060000
		CoordinateSystem=1
		MaxParticles=20
		DetailMode=2
		StartLocationOffset=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
		SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.6000000)
		SizeScale[2]=(RelativeTime=0.1700000,RelativeSize=1.1000000)
		SizeScale[3]=(RelativeTime=0.3700000,RelativeSize=0.6000000)
		SizeScale[4]=(RelativeTime=0.5600000,RelativeSize=1.9000000)
		SizeScale[5]=(RelativeTime=0.6800000,RelativeSize=0.8000000)
		SizeScale[6]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=12.0000000,Max=12.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareC1'
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		SpawnOnTriggerRange=(Min=20.0000000,Max=20.0000000)
		SpawnOnTriggerPPS=80.0000000
		StartVelocityRange=(X=(Min=-650.0000000,Max=-650.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[3]=SpriteEmitter8
	// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		ZTest=false
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1214290,Color=(R=0,G=192,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2428570,Color=(R=0,G=128,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.3857140,Color=(R=255,G=255,B=255,A=255))
		ColorScale[4]=(RelativeTime=0.5714290,Color=(R=255,G=255,B=0,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=0,A=255))
		FadeOutStartTime=0.0450000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=50000.0000000
	end object
	Emitters[4]=SpriteEmitter9
	// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.0892860,Color=(R=255,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.1785710,Color=(R=255,G=255,B=0,A=255))
		ColorScale[3]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[4]=(RelativeTime=0.4000000,Color=(R=0,G=128,B=255,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		FadeOutStartTime=0.0280000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=40.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=160.0000000,Max=160.0000000),Z=(Min=160.0000000,Max=160.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=50000.0000000
		StartVelocityRange=(X=(Min=340.0000000,Max=340.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[5]=SpriteEmitter10
	// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		TriggerDisabled=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2892860,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
		FadeOutStartTime=0.0350000
		CoordinateSystem=1
		MaxParticles=20
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=20.0000000,Max=40.0000000))
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
		SpawnOnTriggerRange=(Min=20.0000000,Max=20.0000000)
		SpawnOnTriggerPPS=5000.0000000
		StartVelocityRange=(X=(Min=100.0000000,Max=1200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-200.0000000,Max=300.0000000))
	end object
	Emitters[6]=SpriteEmitter11
	// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		TriggerDisabled=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4857140,Color=(R=128,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		FadeOutStartTime=0.0350000
		CoordinateSystem=1
		MaxParticles=20
		StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=20.0000000,Max=40.0000000))
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
		SpawnOnTriggerRange=(Min=20.0000000,Max=20.0000000)
		SpawnOnTriggerPPS=5000.0000000
		StartVelocityRange=(X=(Min=400.0000000,Max=1200.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=100.0000000))
	end object
	Emitters[7]=SpriteEmitter12
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseDirectionAs=1
	ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=0.0000000)
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3035710,Color=(R=0,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.6000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=224,G=224,B=0,A=255))
	FadeOutStartTime=0.0400000
	CoordinateSystem=1
	DetailMode=2
	StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=10.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=22.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=12.0000000,Max=16.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=10.0000000,Max=10.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.DirtSpray'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	SpawnOnTriggerRange=(Min=10.0000000,Max=10.0000000)
	SpawnOnTriggerPPS=5000.0000000
	StartVelocityRange=(X=(Min=8.0000000,Max=40.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=40.0000000,Max=40.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	UseDirectionAs=1
	ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=0.0000000)
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3035710,Color=(R=0,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.6000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=224,G=224,B=0,A=255))
	FadeOutStartTime=0.0400000
	CoordinateSystem=1
	DetailMode=2
	StartLocationOffset=(X=-20.0000000,Y=-8.6000000,Z=-5.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=22.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=12.0000000,Max=16.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=10.0000000,Max=10.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.DirtSpray'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	SpawnOnTriggerRange=(Min=10.0000000,Max=10.0000000)
	SpawnOnTriggerPPS=5000.0000000
	StartVelocityRange=(X=(Min=8.0000000,Max=40.0000000),Y=(Min=-34.4000000,Max=-34.4000000),Z=(Min=-20.0000000,Max=-20.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	UseDirectionAs=1
	ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=0.0000000)
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3035710,Color=(R=0,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.6000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=224,G=224,B=0,A=255))
	FadeOutStartTime=0.0400000
	CoordinateSystem=1
	DetailMode=2
	StartLocationOffset=(X=-20.0000000,Y=8.6000000,Z=-5.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=22.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=12.0000000,Max=16.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=10.0000000,Max=10.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.DirtSpray'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	SpawnOnTriggerRange=(Min=10.0000000,Max=10.0000000)
	SpawnOnTriggerPPS=5000.0000000
	StartVelocityRange=(X=(Min=8.0000000,Max=40.0000000),Y=(Min=34.4000000,Max=34.4000000),Z=(Min=-20.0000000,Max=-20.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	FadeOutStartTime=0.5100000
	FadeInEndTime=0.0060000
	CoordinateSystem=1
	MaxParticles=20
	DetailMode=2
	StartLocationOffset=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.6000000)
	SizeScale[2]=(RelativeTime=0.1700000,RelativeSize=1.1000000)
	SizeScale[3]=(RelativeTime=0.3700000,RelativeSize=0.6000000)
	SizeScale[4]=(RelativeTime=0.5600000,RelativeSize=1.9000000)
	SizeScale[5]=(RelativeTime=0.6800000,RelativeSize=0.8000000)
	SizeScale[6]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=12.0000000,Max=12.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareC1'
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	SpawnOnTriggerRange=(Min=20.0000000,Max=20.0000000)
	SpawnOnTriggerPPS=80.0000000
	StartVelocityRange=(X=(Min=-650.0000000,Max=-650.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	ZTest=false
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1214290,Color=(R=0,G=192,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2428570,Color=(R=0,G=128,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.3857140,Color=(R=255,G=255,B=255,A=255))
	ColorScale[4]=(RelativeTime=0.5714290,Color=(R=255,G=255,B=0,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=0,A=255))
	FadeOutStartTime=0.0450000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=50000.0000000
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.0892860,Color=(R=255,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.1785710,Color=(R=255,G=255,B=0,A=255))
	ColorScale[3]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[4]=(RelativeTime=0.4000000,Color=(R=0,G=128,B=255,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	FadeOutStartTime=0.0280000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=40.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=160.0000000,Max=160.0000000),Z=(Min=160.0000000,Max=160.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=50000.0000000
	StartVelocityRange=(X=(Min=340.0000000,Max=340.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	TriggerDisabled=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2892860,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
	FadeOutStartTime=0.0350000
	CoordinateSystem=1
	MaxParticles=20
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=20.0000000,Max=40.0000000))
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
	SpawnOnTriggerRange=(Min=20.0000000,Max=20.0000000)
	SpawnOnTriggerPPS=5000.0000000
	StartVelocityRange=(X=(Min=100.0000000,Max=1200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-200.0000000,Max=300.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	TriggerDisabled=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4857140,Color=(R=128,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	FadeOutStartTime=0.0350000
	CoordinateSystem=1
	MaxParticles=20
	StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=20.0000000,Max=40.0000000))
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
	SpawnOnTriggerRange=(Min=20.0000000,Max=20.0000000)
	SpawnOnTriggerPPS=5000.0000000
	StartVelocityRange=(X=(Min=400.0000000,Max=1200.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=100.0000000))
end object
