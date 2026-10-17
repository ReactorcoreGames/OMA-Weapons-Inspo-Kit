class XM20LaserFlashEmitter extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.XM20LaserFlashEmitter.SpriteEmitter9'
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
		StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[0]=SpriteEmitter9
	// Reference: SpriteEmitter'BWBP_SKC_Pro.XM20LaserFlashEmitter.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3321430,Color=(R=0,G=0,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.4600000
		FadeOutStartTime=0.1470000
		FadeInEndTime=0.0450000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationOffset=(X=140.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=40.0000000),Y=(Min=120.0000000,Max=160.0000000),Z=(Min=120.0000000,Max=160.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.3000000)
		SpawnOnTriggerRange=(Min=3.0000000,Max=3.0000000)
		SpawnOnTriggerPPS=500000.0000000
		StartVelocityRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter10
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.XM20LaserFlashEmitter.SpriteEmitter9'
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
	StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.XM20LaserFlashEmitter.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3321430,Color=(R=0,G=0,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.4600000
	FadeOutStartTime=0.1470000
	FadeInEndTime=0.0450000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationOffset=(X=140.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=40.0000000),Y=(Min=120.0000000,Max=160.0000000),Z=(Min=120.0000000,Max=160.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.3000000)
	SpawnOnTriggerRange=(Min=3.0000000,Max=3.0000000)
	SpawnOnTriggerPPS=500000.0000000
	StartVelocityRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
