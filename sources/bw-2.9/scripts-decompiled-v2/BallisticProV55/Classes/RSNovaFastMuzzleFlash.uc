class RSNovaFastMuzzleFlash extends BallisticEmitter;

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
	// Reference: SpriteEmitter'BallisticProV55.RSNovaFastMuzzleFlash.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		ZTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.0857140,Color=(R=255,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.2000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[3]=(RelativeTime=0.3035710,Color=(R=255,G=255,B=255,A=255))
		ColorScale[4]=(RelativeTime=0.5785710,Color=(R=0,G=128,B=255,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		Opacity=0.6300000
		FadeOutStartTime=0.0520000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=60.0000000,Max=80.0000000),Y=(Min=60.0000000,Max=80.0000000),Z=(Min=60.0000000,Max=80.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=50000.0000000
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSNovaFastMuzzleFlash.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.0928570,Color=(R=255,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.1857140,Color=(R=255,G=255,B=0,A=255))
		ColorScale[3]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[4]=(RelativeTime=0.4000000,Color=(R=0,G=128,B=255,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		FadeOutStartTime=0.0280000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=40.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=50000.0000000
		StartVelocityRange=(X=(Min=340.0000000,Max=340.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RSNovaFastMuzzleFlash.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseDirectionAs=1
		ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=0.0000000)
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.0964290,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=0.2607140,Color=(R=192,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.5107140,Color=(R=128,G=192,B=255,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		FadeOutStartTime=0.0240000
		CoordinateSystem=1
		MaxParticles=16
		DetailMode=2
		StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=10.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=10.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.DirtSpray'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		SpawnOnTriggerRange=(Min=8.0000000,Max=8.0000000)
		SpawnOnTriggerPPS=5000.0000000
		StartVelocityRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=15.0000000,Max=15.0000000))
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: SpriteEmitter'BallisticProV55.RSNovaFastMuzzleFlash.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseDirectionAs=1
		ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=0.0000000)
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.0964290,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=0.2607140,Color=(R=192,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.5107140,Color=(R=128,G=192,B=255,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		FadeOutStartTime=0.0240000
		CoordinateSystem=1
		MaxParticles=16
		DetailMode=2
		StartLocationOffset=(X=-20.0000000,Y=-8.6000000,Z=-5.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=10.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.DirtSpray'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		SpawnOnTriggerRange=(Min=8.0000000,Max=8.0000000)
		SpawnOnTriggerPPS=5000.0000000
		StartVelocityRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=-13.0000000,Max=-13.0000000),Z=(Min=-7.5000000,Max=-7.5000000))
	end object
	Emitters[3]=SpriteEmitter3
	// Reference: SpriteEmitter'BallisticProV55.RSNovaFastMuzzleFlash.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseDirectionAs=1
		ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=0.0000000)
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.0964290,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=0.2607140,Color=(R=192,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.5107140,Color=(R=128,G=192,B=255,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		FadeOutStartTime=0.0240000
		CoordinateSystem=1
		MaxParticles=16
		DetailMode=2
		StartLocationOffset=(X=-20.0000000,Y=8.6000000,Z=-5.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=10.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.DirtSpray'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		SpawnOnTriggerRange=(Min=8.0000000,Max=8.0000000)
		SpawnOnTriggerPPS=5000.0000000
		StartVelocityRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=13.0000000,Max=13.0000000),Z=(Min=-7.5000000,Max=-7.5000000))
	end object
	Emitters[4]=SpriteEmitter4
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RSNovaFastMuzzleFlash.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	ZTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.0857140,Color=(R=255,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.2000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[3]=(RelativeTime=0.3035710,Color=(R=255,G=255,B=255,A=255))
	ColorScale[4]=(RelativeTime=0.5785710,Color=(R=0,G=128,B=255,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	Opacity=0.6300000
	FadeOutStartTime=0.0520000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=60.0000000,Max=80.0000000),Y=(Min=60.0000000,Max=80.0000000),Z=(Min=60.0000000,Max=80.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=50000.0000000
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaFastMuzzleFlash.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.0928570,Color=(R=255,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.1857140,Color=(R=255,G=255,B=0,A=255))
	ColorScale[3]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[4]=(RelativeTime=0.4000000,Color=(R=0,G=128,B=255,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	FadeOutStartTime=0.0280000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=40.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=50000.0000000
	StartVelocityRange=(X=(Min=340.0000000,Max=340.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaFastMuzzleFlash.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseDirectionAs=1
	ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=0.0000000)
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.0964290,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=0.2607140,Color=(R=192,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.5107140,Color=(R=128,G=192,B=255,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	FadeOutStartTime=0.0240000
	CoordinateSystem=1
	MaxParticles=16
	DetailMode=2
	StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=10.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=10.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.DirtSpray'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	SpawnOnTriggerRange=(Min=8.0000000,Max=8.0000000)
	SpawnOnTriggerPPS=5000.0000000
	StartVelocityRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=15.0000000,Max=15.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaFastMuzzleFlash.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseDirectionAs=1
	ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=0.0000000)
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.0964290,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=0.2607140,Color=(R=192,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.5107140,Color=(R=128,G=192,B=255,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	FadeOutStartTime=0.0240000
	CoordinateSystem=1
	MaxParticles=16
	DetailMode=2
	StartLocationOffset=(X=-20.0000000,Y=-8.6000000,Z=-5.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=10.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.DirtSpray'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	SpawnOnTriggerRange=(Min=8.0000000,Max=8.0000000)
	SpawnOnTriggerPPS=5000.0000000
	StartVelocityRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=-13.0000000,Max=-13.0000000),Z=(Min=-7.5000000,Max=-7.5000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaFastMuzzleFlash.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseDirectionAs=1
	ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=0.0000000)
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.0964290,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=0.2607140,Color=(R=192,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.5107140,Color=(R=128,G=192,B=255,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	FadeOutStartTime=0.0240000
	CoordinateSystem=1
	MaxParticles=16
	DetailMode=2
	StartLocationOffset=(X=-20.0000000,Y=8.6000000,Z=-5.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=10.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.DirtSpray'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	SpawnOnTriggerRange=(Min=8.0000000,Max=8.0000000)
	SpawnOnTriggerPPS=5000.0000000
	StartVelocityRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=13.0000000,Max=13.0000000),Z=(Min=-7.5000000,Max=-7.5000000))
end object
