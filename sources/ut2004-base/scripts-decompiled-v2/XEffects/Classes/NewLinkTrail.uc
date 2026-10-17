class NewLinkTrail extends Emitter;

function MakeYellow()
{
	// End:0x50
	if(Emitters[1] != none)
	{
		Emitters[1].ColorScale[1].Color.R = byte(255);
		Emitters[1].ColorScale[2].Color.R = byte(255);
	}
	//return;	
}

function Delay(float DelayTime)
{
	// End:0x43
	if(Emitters[0] != none)
	{
		Emitters[0].InitialDelayRange.Min = DelayTime;
		Emitters[0].InitialDelayRange.Max = DelayTime;
	}
	// End:0x86
	if(Emitters[1] != none)
	{
		Emitters[1].InitialDelayRange.Min = DelayTime;
		Emitters[1].InitialDelayRange.Max = DelayTime;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'XEffects.NewLinkTrail.SpriteEmitter21'
	begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
		UseDirectionAs=2
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=30.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=-80.0000000,Max=-80.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaShaft'
		LifetimeRange=(Min=0.0100000,Max=0.0100000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=-10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		WarmupTicksPerSecond=1.0000000
		RelativeWarmupTime=1.0000000
	end object
	Emitters[0]=SpriteEmitter21
	// Reference: SpriteEmitter'XEffects.NewLinkTrail.SpriteEmitter18'
	begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=96,G=255,B=0,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=0,G=255,B=0,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=6
		DetailMode=2
		StartLocationOffset=(X=-35.0000000,Y=0.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=0.9000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.2500000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		StartVelocityRange=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		WarmupTicksPerSecond=1.0000000
		RelativeWarmupTime=3.0000000
	end object
	Emitters[1]=SpriteEmitter18
	bNoDelete=false
	Physics=10
	DrawScale=0.5000000
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XEffects.NewLinkTrail.SpriteEmitter21'
begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
	UseDirectionAs=2
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=30.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=-80.0000000,Max=-80.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaShaft'
	LifetimeRange=(Min=0.0100000,Max=0.0100000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=-10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	WarmupTicksPerSecond=1.0000000
	RelativeWarmupTime=1.0000000
end object
// Reference: SpriteEmitter'XEffects.NewLinkTrail.SpriteEmitter18'
begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=96,G=255,B=0,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=0,G=255,B=0,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=6
	DetailMode=2
	StartLocationOffset=(X=-35.0000000,Y=0.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=0.9000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.2500000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	StartVelocityRange=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	WarmupTicksPerSecond=1.0000000
	RelativeWarmupTime=3.0000000
end object
