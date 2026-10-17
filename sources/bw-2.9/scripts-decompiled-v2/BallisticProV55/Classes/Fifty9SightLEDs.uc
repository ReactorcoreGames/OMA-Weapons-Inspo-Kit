class Fifty9SightLEDs extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.Fifty9SightLEDs.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.7000000,Max=0.7000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=-54.0000000,Y=-0.8500000,Z=11.6000000)
		StartSizeRange=(X=(Min=0.4500000,Max=0.4500000),Y=(Min=0.4500000,Max=0.4500000),Z=(Min=0.4500000,Max=0.4500000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter4
	// Reference: SpriteEmitter'BallisticProV55.Fifty9SightLEDs.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.7000000,Max=0.7000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=-54.0000000,Y=0.8500000,Z=11.6000000)
		StartSizeRange=(X=(Min=0.4500000,Max=0.4500000),Y=(Min=0.4500000,Max=0.4500000),Z=(Min=0.4500000,Max=0.4500000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter1
	bHidden=true
	RelativeRotation=(Pitch=0,Yaw=0,Roll=8192)
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.Fifty9SightLEDs.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.7000000,Max=0.7000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=-54.0000000,Y=-0.8500000,Z=11.6000000)
	StartSizeRange=(X=(Min=0.4500000,Max=0.4500000),Y=(Min=0.4500000,Max=0.4500000),Z=(Min=0.4500000,Max=0.4500000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.Fifty9SightLEDs.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.7000000,Max=0.7000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=-54.0000000,Y=0.8500000,Z=11.6000000)
	StartSizeRange=(X=(Min=0.4500000,Max=0.4500000),Y=(Min=0.4500000,Max=0.4500000),Z=(Min=0.4500000,Max=0.4500000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
