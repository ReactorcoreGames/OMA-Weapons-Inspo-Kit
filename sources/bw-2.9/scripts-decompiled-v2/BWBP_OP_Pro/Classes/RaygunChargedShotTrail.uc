class RaygunChargedShotTrail extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
		Opacity=0.3000000
		CoordinateSystem=1
		MaxParticles=15
		StartLocationShape=1
		SphereRadiusRange=(Min=3.0000000,Max=3.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=45.0000000,Max=45.0000000),Y=(Min=45.0000000,Max=45.0000000),Z=(Min=45.0000000,Max=45.0000000))
		InitialParticlesPerSecond=30.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=-75.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartVelocityRadialRange=(Min=15.0000000,Max=15.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.0700000
		FadeOutStartTime=0.1350000
		FadeInEndTime=0.0800000
		CoordinateSystem=1
		MaxParticles=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
		ParticlesPerSecond=2.0000000
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'AW-2004Particles.Energy.SmoothRing'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.0500000
		MaxParticles=45
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=20.0000000,Max=20.0000000))
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=35.0000000,Max=35.0000000),Z=(Min=35.0000000,Max=35.0000000))
		Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
		LifetimeRange=(Min=0.1500000,Max=0.1500000)
		StartVelocityRange=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartVelocityRadialRange=(Min=-250.0000000,Max=-250.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=350.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.3500000
		FadeOutStartTime=0.1000000
		FadeInEndTime=0.1000000
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=-1000.0000000,Max=-1000.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	end object
	Emitters[3]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.3500000
		FadeOutStartTime=4.0000000
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
		ParticlesPerSecond=2.0000000
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar2'
	end object
	Emitters[4]=SpriteEmitter4
	// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		CoordinateSystem=2
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=25.0000000,Max=25.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		Texture=Texture'AW-2004Particles.Energy.BurnFlare'
	end object
	Emitters[5]=SpriteEmitter5
	// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		FadeOut=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.0500000
		MaxParticles=45
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=-20.0000000))
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=35.0000000,Max=35.0000000),Z=(Min=35.0000000,Max=35.0000000))
		Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
		LifetimeRange=(Min=0.1500000,Max=0.1500000)
		StartVelocityRange=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartVelocityRadialRange=(Min=-250.0000000,Max=-250.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[6]=SpriteEmitter6
	// Reference: TrailEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.RayTrail'
	begin object name="RayTrail" class=Engine.TrailEmitter
		TrailShadeType=3
		TrailLocation=1
		MaxPointsPerTrail=150
		DistanceThreshold=50.0000000
		UseCrossedSheets=true
		PointLifeTime=0.1500000
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.0000000,Max=0.0000000))
		MaxParticles=1
		StartSizeRange=(X=(Min=65.0000000,Max=65.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=1.0000000
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'AW-2004Particles.Energy.BurnBeam'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
	end object
	Emitters[7]=RayTrail
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
	Opacity=0.3000000
	CoordinateSystem=1
	MaxParticles=15
	StartLocationShape=1
	SphereRadiusRange=(Min=3.0000000,Max=3.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=45.0000000,Max=45.0000000),Y=(Min=45.0000000,Max=45.0000000),Z=(Min=45.0000000,Max=45.0000000))
	InitialParticlesPerSecond=30.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=-75.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartVelocityRadialRange=(Min=15.0000000,Max=15.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.0700000
	FadeOutStartTime=0.1350000
	FadeInEndTime=0.0800000
	CoordinateSystem=1
	MaxParticles=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
	ParticlesPerSecond=2.0000000
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'AW-2004Particles.Energy.SmoothRing'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.0500000
	MaxParticles=45
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=20.0000000,Max=20.0000000))
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=35.0000000,Max=35.0000000),Z=(Min=35.0000000,Max=35.0000000))
	Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
	LifetimeRange=(Min=0.1500000,Max=0.1500000)
	StartVelocityRange=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartVelocityRadialRange=(Min=-250.0000000,Max=-250.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=350.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.3500000
	FadeOutStartTime=0.1000000
	FadeInEndTime=0.1000000
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=-1000.0000000,Max=-1000.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.3500000
	FadeOutStartTime=4.0000000
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
	ParticlesPerSecond=2.0000000
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar2'
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	CoordinateSystem=2
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=25.0000000,Max=25.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	Texture=Texture'AW-2004Particles.Energy.BurnFlare'
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	FadeOut=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.0500000
	MaxParticles=45
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=-20.0000000))
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=35.0000000,Max=35.0000000),Z=(Min=35.0000000,Max=35.0000000))
	Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
	LifetimeRange=(Min=0.1500000,Max=0.1500000)
	StartVelocityRange=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartVelocityRadialRange=(Min=-250.0000000,Max=-250.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: TrailEmitter'BWBP_OP_Pro.RaygunChargedShotTrail.RayTrail'
begin object name="RayTrail" class=Engine.TrailEmitter
	TrailShadeType=3
	TrailLocation=1
	MaxPointsPerTrail=150
	DistanceThreshold=50.0000000
	UseCrossedSheets=true
	PointLifeTime=0.1500000
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.0000000,Max=0.0000000))
	MaxParticles=1
	StartSizeRange=(X=(Min=65.0000000,Max=65.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=1.0000000
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'AW-2004Particles.Energy.BurnBeam'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
end object
