class A500ProjectileTrail extends DGVEmitter;

defaultproperties
{
	bAutoAlignVelocity=true
	// Reference: MeshEmitter'BallisticProV55.A500ProjectileTrail.MeshEmitter5'
	begin object name="MeshEmitter5" class=Engine.MeshEmitter
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
		StartSizeRange=(X=(Min=0.1500000,Max=0.2500000),Y=(Min=0.0750000,Max=0.1500000),Z=(Min=0.0750000,Max=0.1500000))
		LifetimeRange=(Min=0.1300000,Max=0.1300000)
	end object
	Emitters[0]=MeshEmitter5
	// Reference: SpriteEmitter'BallisticProV55.A500ProjectileTrail.SpriteEmitter53'
	begin object name="SpriteEmitter53" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=96,G=255,B=0,A=0))
		FadeOutStartTime=0.1300000
		FadeInEndTime=0.0500000
		MaxParticles=55
		StartLocationRange=(X=(Min=0.0000000,Max=45.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-16384.0000000,Max=-16384.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=16.0000000),Z=(Min=5.0000000,Max=8.0000000))
		Texture=Texture'BW_Core_WeaponTex.Reptile.AcidDrops01'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.1800000,Max=0.2200000)
		StartVelocityRange=(X=(Min=0.0000000,Max=-100.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=-50.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter53
	// Reference: SpriteEmitter'BallisticProV55.A500ProjectileTrail.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=96,G=255,B=0,A=0))
		FadeOutStartTime=0.1000000
		FadeInEndTime=0.0200000
		MaxParticles=35
		StartLocationRange=(X=(Min=0.0000000,Max=45.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-16384.0000000,Max=-16384.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=4.0000000,Max=6.0000000),Y=(Min=12.0000000,Max=25.0000000),Z=(Min=4.0000000,Max=6.0000000))
		InitialParticlesPerSecond=10.0000000
		Texture=Texture'BW_Core_WeaponTex.Reptile.AcidDrops01'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.1000000,Max=0.1200000)
		StartVelocityRange=(X=(Min=-250.0000000,Max=-50.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[2]=SpriteEmitter11
	AutoDestroy=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.A500ProjectileTrail.MeshEmitter5'
begin object name="MeshEmitter5" class=Engine.MeshEmitter
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
	StartSizeRange=(X=(Min=0.1500000,Max=0.2500000),Y=(Min=0.0750000,Max=0.1500000),Z=(Min=0.0750000,Max=0.1500000))
	LifetimeRange=(Min=0.1300000,Max=0.1300000)
end object
// Reference: SpriteEmitter'BallisticProV55.A500ProjectileTrail.SpriteEmitter53'
begin object name="SpriteEmitter53" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=96,G=255,B=0,A=0))
	FadeOutStartTime=0.1300000
	FadeInEndTime=0.0500000
	MaxParticles=55
	StartLocationRange=(X=(Min=0.0000000,Max=45.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-16384.0000000,Max=-16384.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=16.0000000),Z=(Min=5.0000000,Max=8.0000000))
	Texture=Texture'BW_Core_WeaponTex.Reptile.AcidDrops01'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.1800000,Max=0.2200000)
	StartVelocityRange=(X=(Min=0.0000000,Max=-100.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=-50.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.A500ProjectileTrail.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=96,G=255,B=0,A=0))
	FadeOutStartTime=0.1000000
	FadeInEndTime=0.0200000
	MaxParticles=35
	StartLocationRange=(X=(Min=0.0000000,Max=45.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-16384.0000000,Max=-16384.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=4.0000000,Max=6.0000000),Y=(Min=12.0000000,Max=25.0000000),Z=(Min=4.0000000,Max=6.0000000))
	InitialParticlesPerSecond=10.0000000
	Texture=Texture'BW_Core_WeaponTex.Reptile.AcidDrops01'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.1000000,Max=0.1200000)
	StartVelocityRange=(X=(Min=-250.0000000,Max=-50.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
