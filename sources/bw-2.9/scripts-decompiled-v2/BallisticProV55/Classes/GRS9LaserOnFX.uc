class GRS9LaserOnFX extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.GRS9LaserOnFX.SpriteEmitter26'
	begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.0250000
		FadeInEndTime=0.0060000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=60.0000000),Z=(Min=40.0000000,Max=60.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.0500000,Max=0.1000000)
	end object
	Emitters[0]=SpriteEmitter26
	// Reference: SpriteEmitter'BallisticProV55.GRS9LaserOnFX.SpriteEmitter27'
	begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		FadeIn=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.4600000
		FadeOutStartTime=0.1470000
		FadeInEndTime=0.0450000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationOffset=(X=120.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=110.0000000,Max=130.0000000),Z=(Min=110.0000000,Max=130.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter27
	bHidden=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.GRS9LaserOnFX.SpriteEmitter26'
begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.0250000
	FadeInEndTime=0.0060000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=60.0000000),Z=(Min=40.0000000,Max=60.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.0500000,Max=0.1000000)
end object
// Reference: SpriteEmitter'BallisticProV55.GRS9LaserOnFX.SpriteEmitter27'
begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	FadeIn=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.4600000
	FadeOutStartTime=0.1470000
	FadeInEndTime=0.0450000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationOffset=(X=120.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=110.0000000,Max=130.0000000),Z=(Min=110.0000000,Max=130.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
