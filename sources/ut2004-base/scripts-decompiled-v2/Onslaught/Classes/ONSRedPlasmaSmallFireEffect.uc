class ONSRedPlasmaSmallFireEffect extends Emitter;

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
	// Reference: SpriteEmitter'Onslaught.ONSRedPlasmaSmallFireEffect.SpriteEmitter37'
	begin object name="SpriteEmitter37" class=Engine.SpriteEmitter
		UseDirectionAs=7
		UseColorScale=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=96,B=96,A=128))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=128,G=96,B=96,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=96,B=96,A=128))
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=92.5000000,Y=0.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=35.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=8000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStarRed'
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		WarmupTicksPerSecond=2.0000000
		RelativeWarmupTime=2.0000000
	end object
	Emitters[0]=SpriteEmitter37
	// Reference: SpriteEmitter'Onslaught.ONSRedPlasmaSmallFireEffect.SpriteEmitter38'
	begin object name="SpriteEmitter38" class=Engine.SpriteEmitter
		UseDirectionAs=2
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=9,B=15,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=250,G=1,B=7,A=0))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=50.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=-75.0000000,Max=-75.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaHeadRed'
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		WarmupTicksPerSecond=2.0000000
		RelativeWarmupTime=2.0000000
	end object
	Emitters[1]=SpriteEmitter38
	// Reference: SpriteEmitter'Onslaught.ONSRedPlasmaSmallFireEffect.SpriteEmitter39'
	begin object name="SpriteEmitter39" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=0,B=0,A=0))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=251,G=0,B=0,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=20
		DetailMode=1
		StartLocationOffset=(X=75.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=12.5000000,Max=17.5000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=-500.0000000,Max=-500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		WarmupTicksPerSecond=1.0000000
		RelativeWarmupTime=1.0000000
	end object
	Emitters[2]=SpriteEmitter39
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSRedPlasmaSmallFireEffect.SpriteEmitter37'
begin object name="SpriteEmitter37" class=Engine.SpriteEmitter
	UseDirectionAs=7
	UseColorScale=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=96,B=96,A=128))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=128,G=96,B=96,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=96,B=96,A=128))
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=92.5000000,Y=0.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=35.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=8000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStarRed'
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	WarmupTicksPerSecond=2.0000000
	RelativeWarmupTime=2.0000000
end object
// Reference: SpriteEmitter'Onslaught.ONSRedPlasmaSmallFireEffect.SpriteEmitter38'
begin object name="SpriteEmitter38" class=Engine.SpriteEmitter
	UseDirectionAs=2
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=9,B=15,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=250,G=1,B=7,A=0))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=50.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=-75.0000000,Max=-75.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaHeadRed'
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	WarmupTicksPerSecond=2.0000000
	RelativeWarmupTime=2.0000000
end object
// Reference: SpriteEmitter'Onslaught.ONSRedPlasmaSmallFireEffect.SpriteEmitter39'
begin object name="SpriteEmitter39" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=0,B=0,A=0))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=251,G=0,B=0,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=20
	DetailMode=1
	StartLocationOffset=(X=75.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=12.5000000,Max=17.5000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=-500.0000000,Max=-500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	WarmupTicksPerSecond=1.0000000
	RelativeWarmupTime=1.0000000
end object
