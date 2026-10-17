class IE_ShellMetal extends DGVEmitter;

defaultproperties
{
	DisableDGV[0]=1
	DisableDGV[1]=0
	DisableDGV[2]=0
	DisableDGV[3]=1
	// Reference: SpriteEmitter'BallisticProV55.IE_ShellMetal.SpriteEmitter39'
	begin object name="SpriteEmitter39" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=128,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.5000000
		CoordinateSystem=1
		MaxParticles=5
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-15.0000000,Max=15.0000000))
		StartSizeRange=(X=(Min=1.5000000,Max=3.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=100000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[0]=SpriteEmitter39
	// Reference: SpriteEmitter'BallisticProV55.IE_ShellMetal.SpriteEmitter40'
	begin object name="SpriteEmitter40" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=128,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=0))
		FadeOutStartTime=0.5000000
		MaxParticles=6
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		StartSizeRange=(X=(Min=0.5000000,Max=1.5000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=25.0000000,Max=100.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=70.0000000))
	end object
	Emitters[1]=SpriteEmitter40
	// Reference: SparkEmitter'BallisticProV55.IE_ShellMetal.SparkEmitter4'
	begin object name="SparkEmitter4" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
		TimeBetweenSegmentsRange=(Min=0.1000000,Max=0.2000000)
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=192,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=0))
		FadeOutStartTime=0.5000000
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=12.0000000))
		InitialParticlesPerSecond=100000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.2500000,Max=1.2500000)
		StartVelocityRange=(X=(Min=25.0000000,Max=100.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-20.0000000,Max=50.0000000))
	end object
	Emitters[2]=SparkEmitter4
	// Reference: SpriteEmitter'BallisticProV55.IE_ShellMetal.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.9000000),Z=(Min=0.5000000,Max=0.7000000))
		Opacity=0.6500000
		FadeOutStartTime=0.1320000
		CoordinateSystem=1
		MaxParticles=4
		DetailMode=2
		StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-18.0000000,Max=18.0000000),Z=(Min=-13.0000000,Max=13.0000000))
		StartSizeRange=(X=(Min=5.0000000,Max=15.0000000),Y=(Min=5.0000000,Max=15.0000000),Z=(Min=5.0000000,Max=15.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.2000000,Max=0.4000000)
	end object
	Emitters[3]=SpriteEmitter1
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_ShellMetal.SpriteEmitter39'
begin object name="SpriteEmitter39" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=128,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.5000000
	CoordinateSystem=1
	MaxParticles=5
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-15.0000000,Max=15.0000000))
	StartSizeRange=(X=(Min=1.5000000,Max=3.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=100000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_ShellMetal.SpriteEmitter40'
begin object name="SpriteEmitter40" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=128,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=0))
	FadeOutStartTime=0.5000000
	MaxParticles=6
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	StartSizeRange=(X=(Min=0.5000000,Max=1.5000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=25.0000000,Max=100.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=70.0000000))
end object
// Reference: SparkEmitter'BallisticProV55.IE_ShellMetal.SparkEmitter4'
begin object name="SparkEmitter4" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
	TimeBetweenSegmentsRange=(Min=0.1000000,Max=0.2000000)
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=192,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=0))
	FadeOutStartTime=0.5000000
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=12.0000000))
	InitialParticlesPerSecond=100000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.2500000,Max=1.2500000)
	StartVelocityRange=(X=(Min=25.0000000,Max=100.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-20.0000000,Max=50.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_ShellMetal.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.9000000),Z=(Min=0.5000000,Max=0.7000000))
	Opacity=0.6500000
	FadeOutStartTime=0.1320000
	CoordinateSystem=1
	MaxParticles=4
	DetailMode=2
	StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-18.0000000,Max=18.0000000),Z=(Min=-13.0000000,Max=13.0000000))
	StartSizeRange=(X=(Min=5.0000000,Max=15.0000000),Y=(Min=5.0000000,Max=15.0000000),Z=(Min=5.0000000,Max=15.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.2000000,Max=0.4000000)
end object
