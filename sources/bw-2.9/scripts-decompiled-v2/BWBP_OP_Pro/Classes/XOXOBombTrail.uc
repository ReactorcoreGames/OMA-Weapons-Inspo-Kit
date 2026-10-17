class XOXOBombTrail extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOBombTrail.XOXOBombFlare1'
	begin object name="XOXOBombFlare1" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=192,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=160,G=192,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=255,B=192,A=0))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
		Opacity=0.5500000
		FadeOutStartTime=0.3000000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=1
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1500000,Max=0.3000000)
	end object
	Emitters[0]=XOXOBombFlare1
	// Reference: TrailEmitter'BWBP_OP_Pro.XOXOBombTrail.XOXOBombFlare2'
	begin object name="XOXOBombFlare2" class=Engine.TrailEmitter
		TrailShadeType=3
		TrailLocation=1
		MaxPointsPerTrail=150
		DistanceThreshold=100.0000000
		UseCrossedSheets=true
		PointLifeTime=0.7500000
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7000000,Max=0.7000000))
		Opacity=0.6000000
		MaxParticles=1
		StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
	end object
	Emitters[1]=XOXOBombFlare2
	// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOBombTrail.XOXOBombHeart'
	begin object name="XOXOBombHeart" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.5000000
		MaxParticles=8
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
		Texture=Texture'BWBP_OP_Tex.XOXO.hearteffect'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	end object
	Emitters[2]=XOXOBombHeart
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOBombTrail.XOXOBombFlare1'
begin object name="XOXOBombFlare1" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=192,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=160,G=192,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=255,B=192,A=0))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
	Opacity=0.5500000
	FadeOutStartTime=0.3000000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=1
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1500000,Max=0.3000000)
end object
// Reference: TrailEmitter'BWBP_OP_Pro.XOXOBombTrail.XOXOBombFlare2'
begin object name="XOXOBombFlare2" class=Engine.TrailEmitter
	TrailShadeType=3
	TrailLocation=1
	MaxPointsPerTrail=150
	DistanceThreshold=100.0000000
	UseCrossedSheets=true
	PointLifeTime=0.7500000
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7000000,Max=0.7000000))
	Opacity=0.6000000
	MaxParticles=1
	StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOBombTrail.XOXOBombHeart'
begin object name="XOXOBombHeart" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.5000000
	MaxParticles=8
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	Texture=Texture'BWBP_OP_Tex.XOXO.hearteffect'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
end object
