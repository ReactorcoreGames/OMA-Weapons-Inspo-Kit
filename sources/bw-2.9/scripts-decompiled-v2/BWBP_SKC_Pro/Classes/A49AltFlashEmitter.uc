class A49AltFlashEmitter extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.A49AltFlashEmitter.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseDirectionAs=3
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
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.2500000,Max=0.2500000))
		FadeOutStartTime=0.0500000
		FadeInEndTime=0.0500000
		CoordinateSystem=1
		MaxParticles=4
		DetailMode=2
		SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
		DrawStyle=2
		Texture=Texture'BW_Core_WeaponTex.Particles.RippleA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7500000,Max=0.7500000)
		SpawnOnTriggerRange=(Min=4.0000000,Max=4.0000000)
		SpawnOnTriggerPPS=9.0000000
		StartVelocityRange=(X=(Min=800.0000000,Max=800.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=SpriteEmitter8
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.A49AltFlashEmitter.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseDirectionAs=3
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
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.2500000,Max=0.2500000))
	FadeOutStartTime=0.0500000
	FadeInEndTime=0.0500000
	CoordinateSystem=1
	MaxParticles=4
	DetailMode=2
	SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
	DrawStyle=2
	Texture=Texture'BW_Core_WeaponTex.Particles.RippleA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7500000,Max=0.7500000)
	SpawnOnTriggerRange=(Min=4.0000000,Max=4.0000000)
	SpawnOnTriggerPPS=9.0000000
	StartVelocityRange=(X=(Min=800.0000000,Max=800.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
