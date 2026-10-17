class LeopardShellTrail extends Emitter;

defaultproperties
{
	// Reference: TrailEmitter'BWBP_VPC_Pro.LeopardShellTrail.TrailEmitter0'
	begin object name="TrailEmitter0" class=Engine.TrailEmitter
		TrailShadeType=4
		TrailLocation=1
		MaxPointsPerTrail=150
		DistanceThreshold=120.0000000
		UseCrossedSheets=true
		PointLifeTime=2.0000000
		UseColorScale=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.0100000,Color=(R=255,G=32,B=32,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=32,B=32,A=0))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.7000000,Max=0.7000000))
		Opacity=0.7500000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=2000.0000000
		Texture=Texture'AW-2004Particles.Weapons.TrailBlur'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=500.0000000,Max=500.0000000)
	end object
	Emitters[0]=TrailEmitter0
	// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardShellTrail.SpriteEmitter22'
	begin object name="SpriteEmitter22" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=32,B=32,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=32,B=32,A=0))
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.1000000,RelativeSize=1.5000000)
		SizeScale[2]=(RelativeTime=0.1500000,RelativeSize=1.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.7500000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
	end object
	Emitters[1]=SpriteEmitter22
	AutoDestroy=true
	bNoDelete=false
	Physics=10
	bHardAttach=true
	bDirectional=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: TrailEmitter'BWBP_VPC_Pro.LeopardShellTrail.TrailEmitter0'
begin object name="TrailEmitter0" class=Engine.TrailEmitter
	TrailShadeType=4
	TrailLocation=1
	MaxPointsPerTrail=150
	DistanceThreshold=120.0000000
	UseCrossedSheets=true
	PointLifeTime=2.0000000
	UseColorScale=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.0100000,Color=(R=255,G=32,B=32,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=32,B=32,A=0))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.7000000,Max=0.7000000))
	Opacity=0.7500000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=2000.0000000
	Texture=Texture'AW-2004Particles.Weapons.TrailBlur'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=500.0000000,Max=500.0000000)
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardShellTrail.SpriteEmitter22'
begin object name="SpriteEmitter22" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=32,B=32,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=32,B=32,A=0))
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.1000000,RelativeSize=1.5000000)
	SizeScale[2]=(RelativeTime=0.1500000,RelativeSize=1.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.7500000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
end object
