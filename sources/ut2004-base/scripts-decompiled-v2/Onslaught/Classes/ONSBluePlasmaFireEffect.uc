class ONSBluePlasmaFireEffect extends Emitter;

simulated function PostNetBeginPlay()
{
	local PlayerController PC;

	super(Actor).PostNetBeginPlay();
	// End:0x8A
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PC = Level.GetLocalPlayerController();
		// End:0x8A
		if((PC.ViewTarget == none) || VSize(PC.ViewTarget.Location - Location) > float(5000))
		{
			Emitters[2].Disabled = true;
		}
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSBluePlasmaFireEffect.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseDirectionAs=7
		UseColorScale=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=0,G=128,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=0))
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=150.0000000,Y=0.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=75.0000000,Max=100.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=8000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[0]=SpriteEmitter9
	// Reference: SpriteEmitter'Onslaught.ONSBluePlasmaFireEffect.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseDirectionAs=2
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=9,B=15,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=250,G=1,B=7,A=0))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=50.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=-150.0000000,Max=-150.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaHeadBlue'
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter10
	// Reference: SpriteEmitter'Onslaught.ONSBluePlasmaFireEffect.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=0,G=128,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=0,G=128,B=255,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=20
		DetailMode=1
		StartLocationOffset=(X=150.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=35.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=-1000.0000000,Max=-1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		WarmupTicksPerSecond=1.0000000
		RelativeWarmupTime=2.0000000
	end object
	Emitters[2]=SpriteEmitter11
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSBluePlasmaFireEffect.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseDirectionAs=7
	UseColorScale=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=0,G=128,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=0))
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=150.0000000,Y=0.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=75.0000000,Max=100.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=8000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSBluePlasmaFireEffect.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseDirectionAs=2
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=9,B=15,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=250,G=1,B=7,A=0))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=50.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=-150.0000000,Max=-150.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaHeadBlue'
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSBluePlasmaFireEffect.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=0,G=128,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=0,G=128,B=255,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=20
	DetailMode=1
	StartLocationOffset=(X=150.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=35.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=-1000.0000000,Max=-1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	WarmupTicksPerSecond=1.0000000
	RelativeWarmupTime=2.0000000
end object
