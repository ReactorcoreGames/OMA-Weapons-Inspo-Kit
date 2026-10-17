class NewTransDeresBlue extends Emitter;

function PostBeginPlay()
{
	// End:0x27
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		LifeSpan = 0.1500000;		
	}
	else
	{
		// End:0x5A
		if(Level.GetLocalPlayerController().BeyondViewDistance(Location, 0.0000000))
		{
			LifeSpan = 0.0100000;
			return;
		}
	}
	super(Actor).PostBeginPlay();
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'XEffects.NewTransDeresBlue.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseDirectionAs=2
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ScaleSizeXByVelocity=true
		AutomaticInitialSpawning=false
		UseVelocityScale=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=0,G=128,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.7500000,Color=(R=0,G=128,B=255,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=27
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-64.0000000,Max=64.0000000))
		StartLocationShape=3
		SphereRadiusRange=(Min=32.0000000,Max=32.0000000)
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=20.0000000)
		SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=8.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ScaleSizeByVelocityMultiplier=(X=0.0050000,Y=1.0000000,Z=1.0000000)
		InitialParticlesPerSecond=1000.0000000
		Texture=Texture'AW-2004Particles.Energy.BandFlash'
		LifetimeRange=(Min=0.5000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
		VelocityScale[1]=(RelativeTime=0.2000000,RelativeVelocity=(X=5.0000000,Y=5.0000000,Z=5.0000000))
		VelocityScale[2]=(RelativeTime=0.4000000,RelativeVelocity=(X=20.0000000,Y=20.0000000,Z=20.0000000))
		VelocityScale[3]=(RelativeTime=1.0000000,RelativeVelocity=(X=200.0000000,Y=200.0000000,Z=200.0000000))
	end object
	Emitters[0]=SpriteEmitter4
	AutoDestroy=true
	bNoDelete=false
	bNetTemporary=true
	bNetInitialRotation=true
	RemoteRole=2
	Texture=Texture'AW-2004Particles.Energy.BandFlash'
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XEffects.NewTransDeresBlue.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseDirectionAs=2
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ScaleSizeXByVelocity=true
	AutomaticInitialSpawning=false
	UseVelocityScale=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=0,G=128,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.7500000,Color=(R=0,G=128,B=255,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=27
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-64.0000000,Max=64.0000000))
	StartLocationShape=3
	SphereRadiusRange=(Min=32.0000000,Max=32.0000000)
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=20.0000000)
	SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=8.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ScaleSizeByVelocityMultiplier=(X=0.0050000,Y=1.0000000,Z=1.0000000)
	InitialParticlesPerSecond=1000.0000000
	Texture=Texture'AW-2004Particles.Energy.BandFlash'
	LifetimeRange=(Min=0.5000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
	VelocityScale[1]=(RelativeTime=0.2000000,RelativeVelocity=(X=5.0000000,Y=5.0000000,Z=5.0000000))
	VelocityScale[2]=(RelativeTime=0.4000000,RelativeVelocity=(X=20.0000000,Y=20.0000000,Z=20.0000000))
	VelocityScale[3]=(RelativeTime=1.0000000,RelativeVelocity=(X=200.0000000,Y=200.0000000,Z=200.0000000))
end object
