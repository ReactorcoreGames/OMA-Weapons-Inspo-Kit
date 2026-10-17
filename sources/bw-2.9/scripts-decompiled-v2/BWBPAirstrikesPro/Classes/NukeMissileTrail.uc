class NukeMissileTrail extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBPAirstrikesPro.NukeMissileTrail.SpriteEmitter40'
	begin object name="SpriteEmitter40" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.4800000
		FadeInEndTime=0.4800000
		MaxParticles=375
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.3100000,RelativeSize=2.5000000)
		SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=5.0000000)
		SizeScale[2]=(RelativeTime=0.8100000,RelativeSize=5.5000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		InitialParticlesPerSecond=25.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Fire.MuchSmoke1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=8.0000000,Max=9.0000000)
	end object
	Emitters[0]=SpriteEmitter40
	// Reference: SpriteEmitter'BWBPAirstrikesPro.NukeMissileTrail.SpriteEmitter42'
	begin object name="SpriteEmitter42" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=150,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=150,B=0,A=255))
		Opacity=0.3000000
		FadeOutStartTime=0.0010000
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=750.0000000,Max=750.0000000),Y=(Min=750.0000000,Max=750.0000000),Z=(Min=750.0000000,Max=750.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar2'
		LifetimeRange=(Min=0.0500000,Max=0.0500000)
	end object
	Emitters[1]=SpriteEmitter42
	// Reference: SpriteEmitter'BWBPAirstrikesPro.NukeMissileTrail.SpriteEmitter43'
	begin object name="SpriteEmitter43" class=Engine.SpriteEmitter
		FadeOut=true
		SpinParticles=true
		UniformSize=true
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=50
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		Texture=Texture'ExplosionTex.Framed.exp2_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[2]=SpriteEmitter43
	// Reference: SpriteEmitter'BWBPAirstrikesPro.NukeMissileTrail.SpriteEmitter44'
	begin object name="SpriteEmitter44" class=Engine.SpriteEmitter
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.0010000
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=500.0000000,Max=500.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Flares.SoftFlare'
		LifetimeRange=(Min=0.0500000,Max=0.0500000)
	end object
	Emitters[3]=SpriteEmitter44
	AutoDestroy=true
	bNoDelete=false
	bNetTemporary=true
	Physics=10
	RemoteRole=1
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBPAirstrikesPro.NukeMissileTrail.SpriteEmitter40'
begin object name="SpriteEmitter40" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.4800000
	FadeInEndTime=0.4800000
	MaxParticles=375
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.3100000,RelativeSize=2.5000000)
	SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=5.0000000)
	SizeScale[2]=(RelativeTime=0.8100000,RelativeSize=5.5000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	InitialParticlesPerSecond=25.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Fire.MuchSmoke1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=8.0000000,Max=9.0000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.NukeMissileTrail.SpriteEmitter42'
begin object name="SpriteEmitter42" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=150,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=150,B=0,A=255))
	Opacity=0.3000000
	FadeOutStartTime=0.0010000
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=750.0000000,Max=750.0000000),Y=(Min=750.0000000,Max=750.0000000),Z=(Min=750.0000000,Max=750.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar2'
	LifetimeRange=(Min=0.0500000,Max=0.0500000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.NukeMissileTrail.SpriteEmitter43'
begin object name="SpriteEmitter43" class=Engine.SpriteEmitter
	FadeOut=true
	SpinParticles=true
	UniformSize=true
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=50
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	Texture=Texture'ExplosionTex.Framed.exp2_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.NukeMissileTrail.SpriteEmitter44'
begin object name="SpriteEmitter44" class=Engine.SpriteEmitter
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.0010000
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=500.0000000,Max=500.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Flares.SoftFlare'
	LifetimeRange=(Min=0.0500000,Max=0.0500000)
end object
