class RX22A_TankLeak extends DGVEmitter;

defaultproperties
{
	bAutoAlignVelocity=true
	// Reference: SpriteEmitter'BallisticProV55.RX22A_TankLeak.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.1920000
		FadeInEndTime=0.0480000
		MaxParticles=50
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=150.0000000,Max=300.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RX22A_TankLeak.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.1000000))
		Opacity=0.8400000
		FadeOutStartTime=0.0880000
		FadeInEndTime=0.0400000
		MaxParticles=8
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=25.0000000),Y=(Min=20.0000000,Max=25.0000000),Z=(Min=20.0000000,Max=25.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=20.0000000,Max=100.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
	end object
	Emitters[1]=SpriteEmitter2
	AutoDestroy=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RX22A_TankLeak.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.1920000
	FadeInEndTime=0.0480000
	MaxParticles=50
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=150.0000000,Max=300.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22A_TankLeak.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.1000000))
	Opacity=0.8400000
	FadeOutStartTime=0.0880000
	FadeInEndTime=0.0400000
	MaxParticles=8
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=25.0000000),Y=(Min=20.0000000,Max=25.0000000),Z=(Min=20.0000000,Max=25.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=20.0000000,Max=100.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
end object
