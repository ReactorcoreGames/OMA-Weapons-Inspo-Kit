class A500AltProjectileTrail extends DGVEmitter;

simulated function ScaleAcidTrail()
{
	//return;	
}

defaultproperties
{
	bAutoAlignVelocity=true
	// Reference: MeshEmitter'BallisticProV55.A500AltProjectileTrail.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Reptile.Reptile_MuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		UseRevolution=true
		SpinParticles=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=96,G=255,B=0,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		CoordinateSystem=1
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.1000000,Max=1.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[0]=MeshEmitter0
	// Reference: SpriteEmitter'BallisticProV55.A500AltProjectileTrail.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=96,G=255,B=0,A=0))
		FadeOutStartTime=0.4500000
		FadeInEndTime=0.1000000
		MaxParticles=55
		StartLocationRange=(X=(Min=0.0000000,Max=45.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-16384.0000000,Max=-16384.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=16.0000000),Z=(Min=5.0000000,Max=8.0000000))
		Texture=Texture'BW_Core_WeaponTex.Reptile.AcidDrops01'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.5500000,Max=0.6500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=-100.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=-50.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter2
	// Reference: SpriteEmitter'BallisticProV55.A500AltProjectileTrail.SpriteEmitter54'
	begin object name="SpriteEmitter54" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.3240000
		FadeInEndTime=0.0360000
		CoordinateSystem=1
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.2500000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=12.0000000,Max=12.0000000))
		Texture=Texture'BallisticBloodPro.Alien.Alien-BloodPool1'
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[2]=SpriteEmitter54
	// Reference: SpriteEmitter'BallisticProV55.A500AltProjectileTrail.SpriteEmitter55'
	begin object name="SpriteEmitter55" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=96,G=255,B=0,A=0))
		FadeOutStartTime=0.2990000
		FadeInEndTime=0.0975000
		MaxParticles=55
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
		StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=16.0000000),Z=(Min=5.0000000,Max=8.0000000))
		Texture=Texture'BallisticBloodPro.DeRez.Wisp2'
		LifetimeRange=(Min=0.5500000,Max=0.6500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-65.0000000,Max=65.0000000),Z=(Min=-50.0000000,Max=0.0000000))
	end object
	Emitters[3]=SpriteEmitter55
	AutoDestroy=true
	DrawScale=0.3000000
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.A500AltProjectileTrail.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Reptile.Reptile_MuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	UseRevolution=true
	SpinParticles=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=96,G=255,B=0,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	CoordinateSystem=1
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.1000000,Max=1.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: SpriteEmitter'BallisticProV55.A500AltProjectileTrail.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=96,G=255,B=0,A=0))
	FadeOutStartTime=0.4500000
	FadeInEndTime=0.1000000
	MaxParticles=55
	StartLocationRange=(X=(Min=0.0000000,Max=45.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-16384.0000000,Max=-16384.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=16.0000000),Z=(Min=5.0000000,Max=8.0000000))
	Texture=Texture'BW_Core_WeaponTex.Reptile.AcidDrops01'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.5500000,Max=0.6500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=-100.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=-50.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.A500AltProjectileTrail.SpriteEmitter54'
begin object name="SpriteEmitter54" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.3240000
	FadeInEndTime=0.0360000
	CoordinateSystem=1
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.2500000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=12.0000000,Max=12.0000000))
	Texture=Texture'BallisticBloodPro.Alien.Alien-BloodPool1'
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: SpriteEmitter'BallisticProV55.A500AltProjectileTrail.SpriteEmitter55'
begin object name="SpriteEmitter55" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=96,G=255,B=0,A=0))
	FadeOutStartTime=0.2990000
	FadeInEndTime=0.0975000
	MaxParticles=55
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
	StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=16.0000000),Z=(Min=5.0000000,Max=8.0000000))
	Texture=Texture'BallisticBloodPro.DeRez.Wisp2'
	LifetimeRange=(Min=0.5500000,Max=0.6500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-65.0000000,Max=65.0000000),Z=(Min=-50.0000000,Max=0.0000000))
end object
