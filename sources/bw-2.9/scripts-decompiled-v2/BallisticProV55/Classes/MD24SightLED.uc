class MD24SightLED extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.MD24SightLED.SpriteEmitter'
	begin object name="SpriteEmitter" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.6000000,Max=0.6000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=34.3000000,Y=0.0000000,Z=6.8000000)
		StartSizeRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter
	// Reference: SpriteEmitter'BallisticProV55.MD24SightLED.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=4.2000000,Y=-0.7000000,Z=6.8000000)
		StartSizeRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.1500000,Max=0.1500000),Z=(Min=0.1500000,Max=0.1500000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.MD24SightLED.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=4.2000000,Y=0.7000000,Z=6.8000000)
		StartSizeRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.1500000,Max=0.1500000),Z=(Min=0.1500000,Max=0.1500000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[2]=SpriteEmitter2
	bHidden=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.MD24SightLED.SpriteEmitter'
begin object name="SpriteEmitter" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.6000000,Max=0.6000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=34.3000000,Y=0.0000000,Z=6.8000000)
	StartSizeRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.MD24SightLED.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=4.2000000,Y=-0.7000000,Z=6.8000000)
	StartSizeRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.1500000,Max=0.1500000),Z=(Min=0.1500000,Max=0.1500000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.MD24SightLED.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=4.2000000,Y=0.7000000,Z=6.8000000)
	StartSizeRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.1500000,Max=0.1500000),Z=(Min=0.1500000,Max=0.1500000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
