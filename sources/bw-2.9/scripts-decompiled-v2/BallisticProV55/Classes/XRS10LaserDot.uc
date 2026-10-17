class XRS10LaserDot extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.XRS10LaserDot.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.8000000,Max=1.0000000))
		FadeOutStartTime=0.0250000
		FadeInEndTime=0.0060000
		MaxParticles=8
		StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=2.0000000,Max=5.0000000),Z=(Min=2.0000000,Max=5.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.0500000,Max=0.1000000)
	end object
	Emitters[0]=SpriteEmitter7
	// Reference: SpriteEmitter'BallisticProV55.XRS10LaserDot.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		FadeOut=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.8000000,Max=1.0000000))
		FadeOutStartTime=0.0250000
		CoordinateSystem=1
		MaxParticles=2
		StartSizeRange=(X=(Min=1.0000000,Max=4.0000000),Y=(Min=1.0000000,Max=4.0000000),Z=(Min=1.0000000,Max=4.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.0500000,Max=0.1000000)
	end object
	Emitters[1]=SpriteEmitter8
	bHidden=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.XRS10LaserDot.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.8000000,Max=1.0000000))
	FadeOutStartTime=0.0250000
	FadeInEndTime=0.0060000
	MaxParticles=8
	StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=2.0000000,Max=5.0000000),Z=(Min=2.0000000,Max=5.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.0500000,Max=0.1000000)
end object
// Reference: SpriteEmitter'BallisticProV55.XRS10LaserDot.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	FadeOut=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.8000000,Max=1.0000000))
	FadeOutStartTime=0.0250000
	CoordinateSystem=1
	MaxParticles=2
	StartSizeRange=(X=(Min=1.0000000,Max=4.0000000),Y=(Min=1.0000000,Max=4.0000000),Z=(Min=1.0000000,Max=4.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.0500000,Max=0.1000000)
end object
