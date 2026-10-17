class IE_RaygunPlagueProjectile extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_RaygunPlagueProjectile.SpriteEmitter27'
	begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=200,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=64,A=255))
		FadeOutStartTime=0.2250000
		FadeInEndTime=0.0150000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=4.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=9.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=0.7500000,Max=0.7500000)
	end object
	Emitters[0]=SpriteEmitter27
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_RaygunPlagueProjectile.SpriteEmitter28'
	begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=225,B=128,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=0,A=255))
		FadeOutStartTime=0.1152300
		MaxParticles=5
		StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-2.0000000,Max=1.0000000))
		SphereRadiusRange=(Min=1.0000000,Max=5.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
		InitialParticlesPerSecond=75.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRadialRange=(Min=80.0000000,Max=250.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[1]=SpriteEmitter28
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_RaygunPlagueProjectile.SpriteEmitter31'
	begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.2100000
		FadeInEndTime=0.0900000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=22.5000000,Max=22.5000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=0.7500000,Max=0.7500000)
	end object
	Emitters[2]=SpriteEmitter31
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_RaygunPlagueProjectile.SpriteEmitter27'
begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=200,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=64,A=255))
	FadeOutStartTime=0.2250000
	FadeInEndTime=0.0150000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=4.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=9.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	LifetimeRange=(Min=0.7500000,Max=0.7500000)
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_RaygunPlagueProjectile.SpriteEmitter28'
begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=225,B=128,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=0,A=255))
	FadeOutStartTime=0.1152300
	MaxParticles=5
	StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-2.0000000,Max=1.0000000))
	SphereRadiusRange=(Min=1.0000000,Max=5.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
	InitialParticlesPerSecond=75.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRadialRange=(Min=80.0000000,Max=250.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_RaygunPlagueProjectile.SpriteEmitter31'
begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.2100000
	FadeInEndTime=0.0900000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=22.5000000,Max=22.5000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	LifetimeRange=(Min=0.7500000,Max=0.7500000)
end object
