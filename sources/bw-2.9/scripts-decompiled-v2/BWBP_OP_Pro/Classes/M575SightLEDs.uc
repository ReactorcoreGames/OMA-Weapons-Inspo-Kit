class M575SightLEDs extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_OP_Pro.M575SightLEDs.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=-7.5000000,Y=-2.9000000,Z=0.0175000)
		StartSizeRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.1500000,Max=0.1500000),Z=(Min=0.1500000,Max=0.1500000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter12
	bHidden=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.M575SightLEDs.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=-7.5000000,Y=-2.9000000,Z=0.0175000)
	StartSizeRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.1500000,Max=0.1500000),Z=(Min=0.1500000,Max=0.1500000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
