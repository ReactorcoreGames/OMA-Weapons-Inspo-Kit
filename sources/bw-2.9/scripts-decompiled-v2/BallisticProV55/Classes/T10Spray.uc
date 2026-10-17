class T10Spray extends DGVEmitter;

defaultproperties
{
	bAutoAlignVelocity=true
	DisableDGV[0]=0
	DisableDGV[1]=1
	// Reference: SpriteEmitter'BallisticProV55.T10Spray.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=40.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=64))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.4900000
		FadeOutStartTime=0.2600000
		FadeInEndTime=0.2600000
		MaxParticles=80
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=0.2000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=25.0000000),Y=(Min=15.0000000,Max=25.0000000),Z=(Min=15.0000000,Max=25.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=80.0000000,Max=120.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: MeshEmitter'BallisticProV55.T10Spray.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.VolumetricA4'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.4300000
		FadeOutStartTime=0.1840000
		FadeInEndTime=0.1840000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationRange=(X=(Min=-5.0000000,Max=-5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.7000000,Max=0.7000000))
		DrawStyle=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=MeshEmitter0
	// Reference: SpriteEmitter'BallisticProV55.T10Spray.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.6100000
		FadeOutStartTime=1.0600000
		FadeInEndTime=0.9600000
		MaxParticles=5
		StartLocationRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=10.0000000,Max=10.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=40.0000000,Max=50.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[2]=SpriteEmitter1
	AutoDestroy=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.T10Spray.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=40.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=64))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.4900000
	FadeOutStartTime=0.2600000
	FadeInEndTime=0.2600000
	MaxParticles=80
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=0.2000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=25.0000000),Y=(Min=15.0000000,Max=25.0000000),Z=(Min=15.0000000,Max=25.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=80.0000000,Max=120.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.T10Spray.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.VolumetricA4'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.4300000
	FadeOutStartTime=0.1840000
	FadeInEndTime=0.1840000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationRange=(X=(Min=-5.0000000,Max=-5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.7000000,Max=0.7000000))
	DrawStyle=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.T10Spray.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.6100000
	FadeOutStartTime=1.0600000
	FadeInEndTime=0.9600000
	MaxParticles=5
	StartLocationRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=10.0000000,Max=10.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=40.0000000,Max=50.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
