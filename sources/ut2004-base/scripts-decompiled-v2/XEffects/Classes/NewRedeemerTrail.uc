class NewRedeemerTrail extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'XEffects.NewRedeemerTrail.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=7
		EffectAxis=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=-500.0000000,Max=-500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=SpriteEmitter2
	// Reference: SpriteEmitter'XEffects.NewRedeemerTrail.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.0500000,Color=(R=255,G=255,B=255,A=128))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=128,G=128,B=128,A=128))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=500
		StartLocationOffset=(X=-16.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationShape=1
		SphereRadiusRange=(Min=1.0000000,Max=4.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.5500000,Max=0.4500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=200.0000000
		InitialParticlesPerSecond=200.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Fire.MuchSmoke1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.5000000)
	end object
	Emitters[1]=SpriteEmitter3
	AutoDestroy=true
	bNoDelete=false
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XEffects.NewRedeemerTrail.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=7
	EffectAxis=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=-500.0000000,Max=-500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'XEffects.NewRedeemerTrail.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.0500000,Color=(R=255,G=255,B=255,A=128))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=128,G=128,B=128,A=128))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=500
	StartLocationOffset=(X=-16.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationShape=1
	SphereRadiusRange=(Min=1.0000000,Max=4.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.5500000,Max=0.4500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=200.0000000
	InitialParticlesPerSecond=200.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Fire.MuchSmoke1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.5000000)
end object
