class CarpetBombExplosion extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter26'
	begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.7000000
		FadeOutStartTime=0.0595000
		MaxParticles=5
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.4987500,Max=0.4987500))
		AddLocationFromOtherEmitter=0
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0100000)
		SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[2]=(RelativeTime=0.2500000,RelativeSize=3.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=239.4000000,Max=239.4000000),Y=(Min=239.4000000,Max=239.4000000),Z=(Min=239.4000000,Max=239.4000000))
		InitialParticlesPerSecond=600.0000000
		Texture=Texture'ExplosionTex.Framed.we1_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.7500000)
	end object
	Emitters[0]=SpriteEmitter26
	// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter27'
	begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
		UseDirectionAs=4
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
		StartSizeRange=(X=(Min=18.7031300,Max=18.7031300),Y=(Min=18.7031300,Max=18.7031300),Z=(Min=18.7031300,Max=18.7031300))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.SmoothRing'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter27
	// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter28'
	begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.0500000,Color=(R=255,G=150,B=50,A=255))
		ColorScale[2]=(RelativeTime=0.1000000,Color=(R=75,G=75,B=75,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=50,G=50,B=50,A=255))
		FadeOutStartTime=7.3500000
		FadeInEndTime=1.9500000
		StartLocationRange=(X=(Min=-312.5000000,Max=312.5000000),Y=(Min=-312.5000000,Max=312.5000000),Z=(Min=0.0000000,Max=375.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=498.7500000,Max=498.7500000),Y=(Min=498.7500000,Max=498.7500000),Z=(Min=498.7500000,Max=498.7500000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=10.0000000,Max=10.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=31.2500000,Max=31.2500000))
	end object
	Emitters[2]=SpriteEmitter28
	// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter29'
	begin object name="SpriteEmitter29" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=5
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=10.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=11.0000000)
		SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=12.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=13.0000000)
		StartSizeRange=(X=(Min=124.6875000,Max=124.6875000),Y=(Min=124.6875000,Max=124.6875000),Z=(Min=124.6875000,Max=124.6875000))
		InitialParticlesPerSecond=10000.0000000
		Texture=Texture'AW-2004Particles.Fire.GrenadeTest'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[3]=SpriteEmitter29
	// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter30'
	begin object name="SpriteEmitter30" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
		StartSizeRange=(X=(Min=18.7031300,Max=18.7031300),Y=(Min=18.7031300,Max=18.7031300),Z=(Min=18.7031300,Max=18.7031300))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.SmoothRing'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[4]=SpriteEmitter30
	// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter31'
	begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5900000
		FadeOutStartTime=0.0466660
		FadeInEndTime=0.0466660
		MaxParticles=50
		StartLocationRange=(X=(Min=-187.5000000,Max=187.5000000),Y=(Min=-187.5000000,Max=187.5000000),Z=(Min=0.0000000,Max=311.7188000))
		SpinsPerSecondRange=(X=(Min=0.1500000,Max=0.3000000),Y=(Min=0.1500000,Max=0.3000000),Z=(Min=0.1500000,Max=0.3000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=311.7188000,Max=311.7188000),Y=(Min=311.7188000,Max=311.7188000),Z=(Min=311.7188000,Max=311.7188000))
		InitialParticlesPerSecond=15000.0000000
		Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.1665000,Max=1.1665000)
		StartVelocityRange=(X=(Min=-625.0000000,Max=625.0000000),Y=(Min=-625.0000000,Max=625.0000000),Z=(Min=-2493.7500000,Max=1875.0000000))
		VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=5.0000000,Max=5.0000000))
	end object
	Emitters[5]=SpriteEmitter31
	// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter32'
	begin object name="SpriteEmitter32" class=Engine.SpriteEmitter
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
		MaxParticles=2
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=10.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=11.0000000)
		SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=12.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=13.0000000)
		StartSizeRange=(X=(Min=125.0000000,Max=125.0000000),Y=(Min=125.0000000,Max=125.0000000),Z=(Min=125.0000000,Max=125.0000000))
		InitialParticlesPerSecond=10000.0000000
		Texture=Texture'AW-2004Explosions.Fire.Part_explode3'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[6]=SpriteEmitter32
	// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter71'
	begin object name="SpriteEmitter71" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1000000
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=3500.0000000,Max=3500.0000000),Y=(Min=3500.0000000,Max=3500.0000000),Z=(Min=3500.0000000,Max=3500.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Flares.SoftFlare'
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[7]=SpriteEmitter71
	AutoDestroy=true
	bNoDelete=false
	bNetTemporary=true
	RemoteRole=1
	bUnlit=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter26'
begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.7000000
	FadeOutStartTime=0.0595000
	MaxParticles=5
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.4987500,Max=0.4987500))
	AddLocationFromOtherEmitter=0
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0100000)
	SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[2]=(RelativeTime=0.2500000,RelativeSize=3.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=239.4000000,Max=239.4000000),Y=(Min=239.4000000,Max=239.4000000),Z=(Min=239.4000000,Max=239.4000000))
	InitialParticlesPerSecond=600.0000000
	Texture=Texture'ExplosionTex.Framed.we1_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.7500000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter27'
begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
	UseDirectionAs=4
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
	StartSizeRange=(X=(Min=18.7031300,Max=18.7031300),Y=(Min=18.7031300,Max=18.7031300),Z=(Min=18.7031300,Max=18.7031300))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.SmoothRing'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter28'
begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.0500000,Color=(R=255,G=150,B=50,A=255))
	ColorScale[2]=(RelativeTime=0.1000000,Color=(R=75,G=75,B=75,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=50,G=50,B=50,A=255))
	FadeOutStartTime=7.3500000
	FadeInEndTime=1.9500000
	StartLocationRange=(X=(Min=-312.5000000,Max=312.5000000),Y=(Min=-312.5000000,Max=312.5000000),Z=(Min=0.0000000,Max=375.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=498.7500000,Max=498.7500000),Y=(Min=498.7500000,Max=498.7500000),Z=(Min=498.7500000,Max=498.7500000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=10.0000000,Max=10.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=31.2500000,Max=31.2500000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter29'
begin object name="SpriteEmitter29" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=5
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=10.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=11.0000000)
	SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=12.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=13.0000000)
	StartSizeRange=(X=(Min=124.6875000,Max=124.6875000),Y=(Min=124.6875000,Max=124.6875000),Z=(Min=124.6875000,Max=124.6875000))
	InitialParticlesPerSecond=10000.0000000
	Texture=Texture'AW-2004Particles.Fire.GrenadeTest'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter30'
begin object name="SpriteEmitter30" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
	StartSizeRange=(X=(Min=18.7031300,Max=18.7031300),Y=(Min=18.7031300,Max=18.7031300),Z=(Min=18.7031300,Max=18.7031300))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.SmoothRing'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter31'
begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5900000
	FadeOutStartTime=0.0466660
	FadeInEndTime=0.0466660
	MaxParticles=50
	StartLocationRange=(X=(Min=-187.5000000,Max=187.5000000),Y=(Min=-187.5000000,Max=187.5000000),Z=(Min=0.0000000,Max=311.7188000))
	SpinsPerSecondRange=(X=(Min=0.1500000,Max=0.3000000),Y=(Min=0.1500000,Max=0.3000000),Z=(Min=0.1500000,Max=0.3000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=311.7188000,Max=311.7188000),Y=(Min=311.7188000,Max=311.7188000),Z=(Min=311.7188000,Max=311.7188000))
	InitialParticlesPerSecond=15000.0000000
	Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.1665000,Max=1.1665000)
	StartVelocityRange=(X=(Min=-625.0000000,Max=625.0000000),Y=(Min=-625.0000000,Max=625.0000000),Z=(Min=-2493.7500000,Max=1875.0000000))
	VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=5.0000000,Max=5.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter32'
begin object name="SpriteEmitter32" class=Engine.SpriteEmitter
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
	MaxParticles=2
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=10.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=11.0000000)
	SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=12.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=13.0000000)
	StartSizeRange=(X=(Min=125.0000000,Max=125.0000000),Y=(Min=125.0000000,Max=125.0000000),Z=(Min=125.0000000,Max=125.0000000))
	InitialParticlesPerSecond=10000.0000000
	Texture=Texture'AW-2004Explosions.Fire.Part_explode3'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.CarpetBombExplosion.SpriteEmitter71'
begin object name="SpriteEmitter71" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1000000
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=3500.0000000,Max=3500.0000000),Y=(Min=3500.0000000,Max=3500.0000000),Z=(Min=3500.0000000,Max=3500.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Flares.SoftFlare'
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
