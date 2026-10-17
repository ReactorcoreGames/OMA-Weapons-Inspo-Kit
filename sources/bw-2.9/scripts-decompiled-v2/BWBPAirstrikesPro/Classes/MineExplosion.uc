class MineExplosion extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MineExplosion.SpriteEmitter33'
	begin object name="SpriteEmitter33" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		TriggerDisabled=false
		ResetOnTrigger=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-1895.2500000)
		DampingFactorRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=7.7000000
		MaxParticles=250
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=9.9750000,Max=19.9500000),Y=(Min=9.9750000,Max=19.9500000),Z=(Min=9.9750000,Max=19.9500000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=8.0000000,Max=10.0000000)
		StartVelocityRange=(X=(Min=-498.7500000,Max=498.7500000),Y=(Min=-498.7500000,Max=498.7500000),Z=(Min=300.0000000,Max=1995.0000000))
	end object
	Emitters[0]=SpriteEmitter33
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MineExplosion.SpriteEmitter34'
	begin object name="SpriteEmitter34" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		TriggerDisabled=false
		ResetOnTrigger=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-1496.2500000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=238,G=141,B=34,A=0))
		ColorScale[1]=(RelativeTime=0.2500000,Color=(R=77,G=68,B=43,A=0))
		ColorScale[2]=(RelativeTime=0.8964290,Color=(R=51,G=51,B=51,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.7500000,Max=0.7500000))
		FadeOutFactor=(W=0.2500000,X=0.1000000,Y=0.1000000,Z=0.1000000)
		FadeOutStartTime=0.7500000
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.5000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=29.9250000,Max=29.9250000),Y=(Min=29.9250000,Max=29.9250000),Z=(Min=29.9250000,Max=29.9250000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'EmitterTextures.MultiFrame.smokelight_a'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=3.0000000,Max=4.0000000)
		StartVelocityRange=(X=(Min=-99.7500000,Max=99.7500000),Y=(Min=-99.7500000,Max=99.7500000),Z=(Min=798.0000000,Max=1795.5000000))
		RelativeWarmupTime=1.0000000
	end object
	Emitters[1]=SpriteEmitter34
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MineExplosion.SpriteEmitter35'
	begin object name="SpriteEmitter35" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-1895.2500000)
		DampingFactorRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.3000000
		FadeInEndTime=0.3000000
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=199.5000000,Max=199.5000000),Y=(Min=199.5000000,Max=199.5000000),Z=(Min=199.5000000,Max=199.5000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'VMParticleTextures.TankFiringP.DirtPuffTEX'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-99.7500000,Max=99.7500000),Y=(Min=-99.7500000,Max=99.7500000),Z=(Min=299.2500000,Max=1995.0000000))
	end object
	Emitters[2]=SpriteEmitter35
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MineExplosion.SpriteEmitter36'
	begin object name="SpriteEmitter36" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-897.7500000)
		DampingFactorRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.3000000
		FadeInEndTime=0.3000000
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=199.5000000,Max=199.5000000),Y=(Min=199.5000000,Max=199.5000000),Z=(Min=199.5000000,Max=199.5000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'VMParticleTextures.TankFiringP.DirtPuffTEX'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-598.5000000,Max=598.5000000),Y=(Min=-598.5000000,Max=598.5000000),Z=(Min=59.8500000,Max=698.2500000))
	end object
	Emitters[3]=SpriteEmitter36
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MineExplosion.SpriteEmitter37'
	begin object name="SpriteEmitter37" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.5000000
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=299.2500000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.2500000,RelativeSize=10.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=15.0000000)
		StartSizeRange=(X=(Min=19.9500000,Max=19.9500000),Y=(Min=19.9500000,Max=19.9500000),Z=(Min=19.9500000,Max=19.9500000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Explosions.Fire.Part_explode2s'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.3500000,Max=0.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=199.5000000))
	end object
	Emitters[4]=SpriteEmitter37
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MineExplosion.SpriteEmitter39'
	begin object name="SpriteEmitter39" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=75,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=50,B=0,A=255))
		Opacity=0.5000000
		MaxParticles=25
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.3100000,RelativeSize=5.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=59.8500000,Max=139.6500000),Y=(Min=59.8500000,Max=139.6500000),Z=(Min=59.8500000,Max=139.6500000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Dirt.BlastSpray2a'
		LifetimeRange=(Min=1.0000000,Max=1.5000000)
	end object
	Emitters[5]=SpriteEmitter39
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MineExplosion.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.1500000
		MaxParticles=2
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Weapons.GrenExpl'
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
	end object
	Emitters[6]=SpriteEmitter0
	AutoDestroy=true
	bNoDelete=false
	bNetTemporary=true
	RemoteRole=1
	bUnlit=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBPAirstrikesPro.MineExplosion.SpriteEmitter33'
begin object name="SpriteEmitter33" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	TriggerDisabled=false
	ResetOnTrigger=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-1895.2500000)
	DampingFactorRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=7.7000000
	MaxParticles=250
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=9.9750000,Max=19.9500000),Y=(Min=9.9750000,Max=19.9500000),Z=(Min=9.9750000,Max=19.9500000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=8.0000000,Max=10.0000000)
	StartVelocityRange=(X=(Min=-498.7500000,Max=498.7500000),Y=(Min=-498.7500000,Max=498.7500000),Z=(Min=300.0000000,Max=1995.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MineExplosion.SpriteEmitter34'
begin object name="SpriteEmitter34" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	TriggerDisabled=false
	ResetOnTrigger=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-1496.2500000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=238,G=141,B=34,A=0))
	ColorScale[1]=(RelativeTime=0.2500000,Color=(R=77,G=68,B=43,A=0))
	ColorScale[2]=(RelativeTime=0.8964290,Color=(R=51,G=51,B=51,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.7500000,Max=0.7500000))
	FadeOutFactor=(W=0.2500000,X=0.1000000,Y=0.1000000,Z=0.1000000)
	FadeOutStartTime=0.7500000
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.5000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=29.9250000,Max=29.9250000),Y=(Min=29.9250000,Max=29.9250000),Z=(Min=29.9250000,Max=29.9250000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'EmitterTextures.MultiFrame.smokelight_a'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=3.0000000,Max=4.0000000)
	StartVelocityRange=(X=(Min=-99.7500000,Max=99.7500000),Y=(Min=-99.7500000,Max=99.7500000),Z=(Min=798.0000000,Max=1795.5000000))
	RelativeWarmupTime=1.0000000
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MineExplosion.SpriteEmitter35'
begin object name="SpriteEmitter35" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-1895.2500000)
	DampingFactorRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.3000000
	FadeInEndTime=0.3000000
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=199.5000000,Max=199.5000000),Y=(Min=199.5000000,Max=199.5000000),Z=(Min=199.5000000,Max=199.5000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'VMParticleTextures.TankFiringP.DirtPuffTEX'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-99.7500000,Max=99.7500000),Y=(Min=-99.7500000,Max=99.7500000),Z=(Min=299.2500000,Max=1995.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MineExplosion.SpriteEmitter36'
begin object name="SpriteEmitter36" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-897.7500000)
	DampingFactorRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.3000000
	FadeInEndTime=0.3000000
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=199.5000000,Max=199.5000000),Y=(Min=199.5000000,Max=199.5000000),Z=(Min=199.5000000,Max=199.5000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'VMParticleTextures.TankFiringP.DirtPuffTEX'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-598.5000000,Max=598.5000000),Y=(Min=-598.5000000,Max=598.5000000),Z=(Min=59.8500000,Max=698.2500000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MineExplosion.SpriteEmitter37'
begin object name="SpriteEmitter37" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.5000000
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=299.2500000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.2500000,RelativeSize=10.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=15.0000000)
	StartSizeRange=(X=(Min=19.9500000,Max=19.9500000),Y=(Min=19.9500000,Max=19.9500000),Z=(Min=19.9500000,Max=19.9500000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Explosions.Fire.Part_explode2s'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.3500000,Max=0.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=199.5000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MineExplosion.SpriteEmitter39'
begin object name="SpriteEmitter39" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=75,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=50,B=0,A=255))
	Opacity=0.5000000
	MaxParticles=25
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.3100000,RelativeSize=5.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=59.8500000,Max=139.6500000),Y=(Min=59.8500000,Max=139.6500000),Z=(Min=59.8500000,Max=139.6500000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Dirt.BlastSpray2a'
	LifetimeRange=(Min=1.0000000,Max=1.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MineExplosion.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.1500000
	MaxParticles=2
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Weapons.GrenExpl'
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
end object
