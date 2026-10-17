class WrenchWarpEndEmitter extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.WrenchWarpEndEmitter.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=121,G=145,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		FadeOutStartTime=0.5600000
		FadeInEndTime=0.0200000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=4.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=9.0000000)
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.WrenchWarpEndEmitter.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.3300000
		FadeOutStartTime=0.0400800
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.SmoothRing'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter2
	// Reference: SpriteEmitter'BWBP_SKC_Pro.WrenchWarpEndEmitter.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		Opacity=0.6300000
		FadeOutStartTime=0.0775000
		FadeInEndTime=0.0275000
		StartLocationShape=1
		SphereRadiusRange=(Min=1.0000000,Max=5.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=7.0000000)
		StartSizeRange=(X=(Min=37.0000000,Max=37.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		InitialParticlesPerSecond=25.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRadialRange=(Min=520.0000000,Max=750.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[2]=SpriteEmitter8
	// Reference: SpriteEmitter'BWBP_SKC_Pro.WrenchWarpEndEmitter.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.0900000
		FadeInEndTime=0.0300000
		MaxParticles=20
		StartLocationShape=1
		SphereRadiusRange=(Min=25.0000000,Max=120.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[3]=SpriteEmitter9
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.WrenchWarpEndEmitter.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=121,G=145,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	FadeOutStartTime=0.5600000
	FadeInEndTime=0.0200000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=4.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=9.0000000)
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.WrenchWarpEndEmitter.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.3300000
	FadeOutStartTime=0.0400800
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.SmoothRing'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.WrenchWarpEndEmitter.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	Opacity=0.6300000
	FadeOutStartTime=0.0775000
	FadeInEndTime=0.0275000
	StartLocationShape=1
	SphereRadiusRange=(Min=1.0000000,Max=5.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=7.0000000)
	StartSizeRange=(X=(Min=37.0000000,Max=37.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	InitialParticlesPerSecond=25.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRadialRange=(Min=520.0000000,Max=750.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.WrenchWarpEndEmitter.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.0900000
	FadeInEndTime=0.0300000
	MaxParticles=20
	StartLocationShape=1
	SphereRadiusRange=(Min=25.0000000,Max=120.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
