class E23LaserFlashEmitter extends BallisticEmitter;

defaultproperties
{
	// Reference: MeshEmitter'BallisticProV55.E23LaserFlashEmitter.MeshEmitter4'
	begin object name="MeshEmitter4" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.VPR.VPRMuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=0.2285710,Color=(R=96,G=96,B=96,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.1520000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=-2.0000000,Y=0.0000000,Z=0.0000000)
		SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.6000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.9000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
		StartSizeRange=(X=(Min=2.5000000,Max=3.0000000),Y=(Min=1.2500000,Max=1.5000000),Z=(Min=1.2500000,Max=1.5000000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		SpawnOnTriggerRange=(Min=2.0000000,Max=2.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[0]=MeshEmitter4
	// Reference: SpriteEmitter'BallisticProV55.E23LaserFlashEmitter.SpriteEmitter13'
	begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2500000,Color=(R=96,G=96,B=96,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.1020000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=55.0000000,Max=70.0000000),Y=(Min=55.0000000,Max=70.0000000),Z=(Min=55.0000000,Max=70.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[1]=SpriteEmitter13
	// Reference: SpriteEmitter'BallisticProV55.E23LaserFlashEmitter.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=255,B=96,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.7500000,Max=0.7500000))
		FadeOutStartTime=0.2850000
		FadeInEndTime=0.0150000
		CoordinateSystem=1
		MaxParticles=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.1000000)
		StartSizeRange=(X=(Min=30.0000000,Max=35.0000000),Y=(Min=30.0000000,Max=35.0000000),Z=(Min=30.0000000,Max=35.0000000))
		Texture=Texture'BW_Core_WeaponTex.VPR.VPR-MuzzleEffect'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		SpawnOnTriggerRange=(Min=2.0000000,Max=3.0000000)
		SpawnOnTriggerPPS=20.0000000
		StartVelocityRange=(X=(Min=150.0000000,Max=350.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[2]=SpriteEmitter14
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.E23LaserFlashEmitter.MeshEmitter4'
begin object name="MeshEmitter4" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.VPR.VPRMuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=0.2285710,Color=(R=96,G=96,B=96,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.1520000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=-2.0000000,Y=0.0000000,Z=0.0000000)
	SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.6000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.9000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
	StartSizeRange=(X=(Min=2.5000000,Max=3.0000000),Y=(Min=1.2500000,Max=1.5000000),Z=(Min=1.2500000,Max=1.5000000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	SpawnOnTriggerRange=(Min=2.0000000,Max=2.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: SpriteEmitter'BallisticProV55.E23LaserFlashEmitter.SpriteEmitter13'
begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2500000,Color=(R=96,G=96,B=96,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.1020000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=55.0000000,Max=70.0000000),Y=(Min=55.0000000,Max=70.0000000),Z=(Min=55.0000000,Max=70.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: SpriteEmitter'BallisticProV55.E23LaserFlashEmitter.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=255,B=96,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.7500000,Max=0.7500000))
	FadeOutStartTime=0.2850000
	FadeInEndTime=0.0150000
	CoordinateSystem=1
	MaxParticles=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.1000000)
	StartSizeRange=(X=(Min=30.0000000,Max=35.0000000),Y=(Min=30.0000000,Max=35.0000000),Z=(Min=30.0000000,Max=35.0000000))
	Texture=Texture'BW_Core_WeaponTex.VPR.VPR-MuzzleEffect'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	SpawnOnTriggerRange=(Min=2.0000000,Max=3.0000000)
	SpawnOnTriggerPPS=20.0000000
	StartVelocityRange=(X=(Min=150.0000000,Max=350.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
