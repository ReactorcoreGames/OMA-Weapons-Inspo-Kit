class ONSPlasmaHitRed extends Emitter;

simulated function PostNetBeginPlay()
{
	local PlayerController PC;
	local float MaxDist;

	super(Actor).PostNetBeginPlay();
	// End:0xC6
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PC = Level.GetLocalPlayerController();
		// End:0x67
		if((Instigator == none) || PC.Pawn != Instigator)
		{
			MaxDist = 2000.0000000;			
		}
		else
		{
			MaxDist = 3000.0000000;
		}
		// End:0xC6
		if((PC.ViewTarget == none) || VSize(PC.ViewTarget.Location - Location) > MaxDist)
		{
			Emitters[2].Disabled = true;
		}
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSPlasmaHitRed.SpriteEmitter22'
	begin object name="SpriteEmitter22" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=64,B=64,A=0))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=255,G=64,B=64,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=2
		StartLocationOffset=(X=-2.0000000,Y=0.0000000,Z=0.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=60.0000000,Max=120.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[0]=SpriteEmitter22
	// Reference: SpriteEmitter'Onslaught.ONSPlasmaHitRed.SpriteEmitter23'
	begin object name="SpriteEmitter23" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=64,B=64,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=255,G=64,B=64,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.8000000
		MaxParticles=1
		StartLocationOffset=(X=-2.0000000,Y=0.0000000,Z=0.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=200.0000000,Max=250.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[1]=SpriteEmitter23
	// Reference: SpriteEmitter'Onslaught.ONSPlasmaHitRed.SpriteEmitter32'
	begin object name="SpriteEmitter32" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=220,G=96,B=20,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=0,B=0,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScaleRepeats=6.0000000
		MaxParticles=20
		DetailMode=1
		StartLocationShape=2
		StartLocationPolarRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=65536.0000000),Z=(Min=8.0000000,Max=64.0000000))
		UseRotationFrom=1
		RotationOffset=(Pitch=0,Yaw=16384,Roll=0)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=5.0000000,Max=15.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar2'
		LifetimeRange=(Min=0.2500000,Max=0.7500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=20.0000000,Max=150.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartVelocityRadialRange=(Min=-30.0000000,Max=-150.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[2]=SpriteEmitter32
	// Reference: SpriteEmitter'Onslaught.ONSPlasmaHitRed.SpriteEmitter53'
	begin object name="SpriteEmitter53" class=Engine.SpriteEmitter
		UseDirectionAs=7
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.7000000,Color=(R=255,G=32,B=32,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=1
		StartLocationOffset=(X=-4.0000000,Y=0.0000000,Z=0.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Flares.FlashFlare1'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[3]=SpriteEmitter53
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSPlasmaHitRed.SpriteEmitter22'
begin object name="SpriteEmitter22" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=64,B=64,A=0))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=255,G=64,B=64,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=2
	StartLocationOffset=(X=-2.0000000,Y=0.0000000,Z=0.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=60.0000000,Max=120.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSPlasmaHitRed.SpriteEmitter23'
begin object name="SpriteEmitter23" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=64,B=64,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=255,G=64,B=64,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.8000000
	MaxParticles=1
	StartLocationOffset=(X=-2.0000000,Y=0.0000000,Z=0.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=200.0000000,Max=250.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSPlasmaHitRed.SpriteEmitter32'
begin object name="SpriteEmitter32" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=220,G=96,B=20,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=0,B=0,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScaleRepeats=6.0000000
	MaxParticles=20
	DetailMode=1
	StartLocationShape=2
	StartLocationPolarRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=65536.0000000),Z=(Min=8.0000000,Max=64.0000000))
	UseRotationFrom=1
	RotationOffset=(Pitch=0,Yaw=16384,Roll=0)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=5.0000000,Max=15.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar2'
	LifetimeRange=(Min=0.2500000,Max=0.7500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=20.0000000,Max=150.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartVelocityRadialRange=(Min=-30.0000000,Max=-150.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'Onslaught.ONSPlasmaHitRed.SpriteEmitter53'
begin object name="SpriteEmitter53" class=Engine.SpriteEmitter
	UseDirectionAs=7
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.7000000,Color=(R=255,G=32,B=32,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=1
	StartLocationOffset=(X=-4.0000000,Y=0.0000000,Z=0.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Flares.FlashFlare1'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
