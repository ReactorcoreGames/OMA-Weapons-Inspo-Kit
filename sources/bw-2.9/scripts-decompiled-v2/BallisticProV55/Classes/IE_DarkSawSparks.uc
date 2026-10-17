class IE_DarkSawSparks extends DGVEmitter;

defaultproperties
{
	DisableDGV[0]=0
	DisableDGV[1]=0
	DisableDGV[2]=1
	// Reference: SpriteEmitter'BallisticProV55.IE_DarkSawSparks.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.0000000,Max=0.6000000))
		FadeOutStartTime=0.1975000
		FadeInEndTime=0.0075000
		MaxParticles=15
		StartLocationOffset=(X=57.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=1.0100000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-800.0000000,Max=-200.0000000))
	end object
	Emitters[0]=SpriteEmitter11
	// Reference: SpriteEmitter'BallisticProV55.IE_DarkSawSparks.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		FadeIn=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.5000000))
		Opacity=0.7300000
		FadeOutStartTime=0.0375000
		FadeInEndTime=0.0150000
		MaxParticles=20
		DetailMode=2
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-5.0000000)
		AddLocationFromOtherEmitter=0
		StartSizeRange=(X=(Min=0.7000000,Max=1.0000000),Y=(Min=10.0000000,Max=40.0000000),Z=(Min=10.0000000,Max=40.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1500000,Max=0.1500000)
		AddVelocityFromOtherEmitter=0
		AddVelocityMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	end object
	Emitters[1]=SpriteEmitter12
	// Reference: SpriteEmitter'BallisticProV55.IE_DarkSawSparks.SpriteEmitter13'
	begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
		FadeOut=true
		ZTest=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.7000000,Max=1.0000000),Z=(Min=0.4000000,Max=0.8000000))
		FadeOutStartTime=0.0300000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationOffset=(X=57.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-6.0000000,Max=6.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=5.0000000,Max=8.0000000),Z=(Min=5.0000000,Max=8.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1500000,Max=0.2500000)
	end object
	Emitters[2]=SpriteEmitter13
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_DarkSawSparks.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.0000000,Max=0.6000000))
	FadeOutStartTime=0.1975000
	FadeInEndTime=0.0075000
	MaxParticles=15
	StartLocationOffset=(X=57.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=1.0100000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-800.0000000,Max=-200.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_DarkSawSparks.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	FadeIn=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.5000000))
	Opacity=0.7300000
	FadeOutStartTime=0.0375000
	FadeInEndTime=0.0150000
	MaxParticles=20
	DetailMode=2
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-5.0000000)
	AddLocationFromOtherEmitter=0
	StartSizeRange=(X=(Min=0.7000000,Max=1.0000000),Y=(Min=10.0000000,Max=40.0000000),Z=(Min=10.0000000,Max=40.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1500000,Max=0.1500000)
	AddVelocityFromOtherEmitter=0
	AddVelocityMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_DarkSawSparks.SpriteEmitter13'
begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
	FadeOut=true
	ZTest=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.7000000,Max=1.0000000),Z=(Min=0.4000000,Max=0.8000000))
	FadeOutStartTime=0.0300000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationOffset=(X=57.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-6.0000000,Max=6.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=5.0000000,Max=8.0000000),Z=(Min=5.0000000,Max=8.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1500000,Max=0.2500000)
end object
