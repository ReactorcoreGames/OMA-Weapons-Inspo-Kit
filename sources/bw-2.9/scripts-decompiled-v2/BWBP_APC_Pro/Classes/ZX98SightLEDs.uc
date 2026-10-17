class ZX98SightLEDs extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_APC_Pro.ZX98SightLEDs.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=64,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.0000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=-200.0000000,Y=-30.0000000,Z=-7.5000000)
		StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=4.0000000,Max=4.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter0
	bHidden=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_APC_Pro.ZX98SightLEDs.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=64,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.0000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=-200.0000000,Y=-30.0000000,Z=-7.5000000)
	StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=4.0000000,Max=4.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
