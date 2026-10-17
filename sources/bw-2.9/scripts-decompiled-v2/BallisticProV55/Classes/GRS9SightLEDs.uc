class GRS9SightLEDs extends BallisticEmitter;

function InvertZ()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x43 [Loop If]
	if(i < Emitters.Length)
	{
		Emitters[i].StartLocationOffset.Z *= float(-1);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

function InvertY()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x43 [Loop If]
	if(i < Emitters.Length)
	{
		Emitters[i].StartLocationOffset.Y *= float(-1);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.GRS9SightLEDs.SpriteEmitter28'
	begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=83.7000000,Y=0.0000000,Z=11.3000000)
		StartSizeRange=(X=(Min=1.3000000,Max=1.3000000),Y=(Min=1.3000000,Max=1.3000000),Z=(Min=1.3000000,Max=1.3000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter28
	// Reference: SpriteEmitter'BallisticProV55.GRS9SightLEDs.SpriteEmitter29'
	begin object name="SpriteEmitter29" class=Engine.SpriteEmitter
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=-37.7000000,Y=-3.3000000,Z=11.3000000)
		StartSizeRange=(X=(Min=1.3000000,Max=1.3000000),Y=(Min=1.3000000,Max=1.3000000),Z=(Min=1.3000000,Max=1.3000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter29
	// Reference: SpriteEmitter'BallisticProV55.GRS9SightLEDs.SpriteEmitter30'
	begin object name="SpriteEmitter30" class=Engine.SpriteEmitter
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=-37.7000000,Y=3.3000000,Z=11.3000000)
		StartSizeRange=(X=(Min=1.3000000,Max=1.3000000),Y=(Min=1.3000000,Max=1.3000000),Z=(Min=1.3000000,Max=1.3000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[2]=SpriteEmitter30
	bHidden=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.GRS9SightLEDs.SpriteEmitter28'
begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=83.7000000,Y=0.0000000,Z=11.3000000)
	StartSizeRange=(X=(Min=1.3000000,Max=1.3000000),Y=(Min=1.3000000,Max=1.3000000),Z=(Min=1.3000000,Max=1.3000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.GRS9SightLEDs.SpriteEmitter29'
begin object name="SpriteEmitter29" class=Engine.SpriteEmitter
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=-37.7000000,Y=-3.3000000,Z=11.3000000)
	StartSizeRange=(X=(Min=1.3000000,Max=1.3000000),Y=(Min=1.3000000,Max=1.3000000),Z=(Min=1.3000000,Max=1.3000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.GRS9SightLEDs.SpriteEmitter30'
begin object name="SpriteEmitter30" class=Engine.SpriteEmitter
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=-37.7000000,Y=3.3000000,Z=11.3000000)
	StartSizeRange=(X=(Min=1.3000000,Max=1.3000000),Y=(Min=1.3000000,Max=1.3000000),Z=(Min=1.3000000,Max=1.3000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
