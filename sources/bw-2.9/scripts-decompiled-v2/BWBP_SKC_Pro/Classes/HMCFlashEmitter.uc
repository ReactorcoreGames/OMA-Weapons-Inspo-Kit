class HMCFlashEmitter extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.HMCFlashEmitter.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
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
	Emitters[0]=SpriteEmitter9
	// Reference: SpriteEmitter'BWBP_SKC_Pro.HMCFlashEmitter.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseDirectionAs=1
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
	Emitters[1]=SpriteEmitter10
	// Reference: SpriteEmitter'BWBP_SKC_Pro.HMCFlashEmitter.SpriteEmitter26'
	begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
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
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=160,G=180,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=91,G=91,B=91,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.8600000
		FadeOutStartTime=1.0200000
		FadeInEndTime=0.5600000
		MaxParticles=40
		StartLocationRange=(X=(Min=-30.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=3.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=6.0000000,Max=8.0000000),Y=(Min=6.0000000,Max=8.0000000),Z=(Min=6.0000000,Max=8.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.SmokeWisp-Alpha'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		SpawnOnTriggerRange=(Min=4.0000000,Max=6.0000000)
		SpawnOnTriggerPPS=20.0000000
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=50.0000000,Max=65.0000000))
	end object
	Emitters[2]=SpriteEmitter26
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.HMCFlashEmitter.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
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
// Reference: SpriteEmitter'BWBP_SKC_Pro.HMCFlashEmitter.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseDirectionAs=1
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
// Reference: SpriteEmitter'BWBP_SKC_Pro.HMCFlashEmitter.SpriteEmitter26'
begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
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
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=160,G=180,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=91,G=91,B=91,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.8600000
	FadeOutStartTime=1.0200000
	FadeInEndTime=0.5600000
	MaxParticles=40
	StartLocationRange=(X=(Min=-30.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=3.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=6.0000000,Max=8.0000000),Y=(Min=6.0000000,Max=8.0000000),Z=(Min=6.0000000,Max=8.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.SmokeWisp-Alpha'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	SpawnOnTriggerRange=(Min=4.0000000,Max=6.0000000)
	SpawnOnTriggerPPS=20.0000000
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=50.0000000,Max=65.0000000))
end object
