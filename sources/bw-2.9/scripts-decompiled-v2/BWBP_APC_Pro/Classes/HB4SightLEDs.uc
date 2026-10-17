class HB4SightLEDs extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_APC_Pro.HB4SightLEDs.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.4000000,Max=0.4000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=-13.0000000,Y=-1.6000000,Z=13.8000000)
		StartSizeRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.6000000,Max=0.6000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter14
	// Reference: SpriteEmitter'BWBP_APC_Pro.HB4SightLEDs.SpriteEmitter15'
	begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=-135.0000000,Y=-2.8000000,Z=12.8000000)
		StartSizeRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter15
	bHidden=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_APC_Pro.HB4SightLEDs.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.4000000,Max=0.4000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=-13.0000000,Y=-1.6000000,Z=13.8000000)
	StartSizeRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.6000000,Max=0.6000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.HB4SightLEDs.SpriteEmitter15'
begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=-135.0000000,Y=-2.8000000,Z=12.8000000)
	StartSizeRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
