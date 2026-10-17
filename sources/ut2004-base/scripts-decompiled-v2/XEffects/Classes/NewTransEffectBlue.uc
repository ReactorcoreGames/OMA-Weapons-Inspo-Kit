class NewTransEffectBlue extends Emitter;

function PostBeginPlay()
{
	// End:0x20
	if(int(Role) == int(ROLE_Authority))
	{
		Instigator = Pawn(Owner);
	}
	// End:0x44
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		LifeSpan = 0.1500000;
	}
	super(Actor).PostBeginPlay();
	//return;	
}

simulated function PostNetBeginPlay()
{
	local PlayerController PC;
	local float Dist;

	// End:0x1AE
	if(Instigator != none)
	{
		SetLocation(Instigator.Location);
		SetBase(Instigator);
		// End:0xC6
		if((PlayerController(Instigator.Controller) != none) && !PlayerController(Instigator.Controller).bBehindView)
		{
			Emitters[0].InitialParticlesPerSecond *= 0.5000000;
			Emitters[0].SphereRadiusRange.Min *= 2.4000000;
			Emitters[0].SphereRadiusRange.Max *= 2.4000000;
			Emitters[1].Disabled = true;			
		}
		else
		{
			// End:0x1AE
			if((int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_Client))
			{
				PC = Level.GetLocalPlayerController();
				// End:0x1AE
				if((PC != none) && PC.ViewTarget != none)
				{
					Dist = VSize(PC.ViewTarget.Location - Location);
					// End:0x18A
					if(Dist > PC.Region.Zone.DistanceFogEnd)
					{
						LifeSpan = 0.0100000;						
					}
					else
					{
						// End:0x1AE
						if(Dist > float(8000))
						{
							Emitters[1].Disabled = true;
						}
					}
				}
			}
		}
	}
	PlaySound(ProceduralSound'WeaponSounds.PWeaponSpawn1.P1WeaponSpawn1', 0);
	super(Actor).PostNetBeginPlay();
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'XEffects.NewTransEffectBlue.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		UniformMeshScale=false
		UseRevolution=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=64,G=64,B=192,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=100
		SphereRadiusRange=(Min=24.0000000,Max=24.0000000)
		StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=48.0000000,Max=64.0000000))
		MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleCylinder'
		MeshSpawning=2
		MeshScaleRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=0.7500000,Max=0.7500000))
		RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ScaleSizeByVelocityMultiplier=(X=0.0200000,Y=0.0200000,Z=1.0000000)
		InitialParticlesPerSecond=150.0000000
		Texture=Texture'EpicParticles.Flares.FlickerFlare2'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRadialRange=(Min=-100.0000000,Max=-300.0000000)
		VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=50.0000000))
		GetVelocityDirectionFrom=3
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'XEffects.NewTransEffectBlue.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=64,G=64,B=255,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-48.0000000,Max=48.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Texture=Texture'EpicParticles.Flares.FlickerFlare2'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		InitialDelayRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[1]=SpriteEmitter1
	AutoDestroy=true
	bNoDelete=false
	bNetTemporary=true
	bReplicateInstigator=true
	RemoteRole=2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XEffects.NewTransEffectBlue.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	UniformMeshScale=false
	UseRevolution=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=64,G=64,B=192,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=100
	SphereRadiusRange=(Min=24.0000000,Max=24.0000000)
	StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=48.0000000,Max=64.0000000))
	MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleCylinder'
	MeshSpawning=2
	MeshScaleRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=0.7500000,Max=0.7500000))
	RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ScaleSizeByVelocityMultiplier=(X=0.0200000,Y=0.0200000,Z=1.0000000)
	InitialParticlesPerSecond=150.0000000
	Texture=Texture'EpicParticles.Flares.FlickerFlare2'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRadialRange=(Min=-100.0000000,Max=-300.0000000)
	VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=50.0000000))
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'XEffects.NewTransEffectBlue.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=64,G=64,B=255,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-48.0000000,Max=48.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Texture=Texture'EpicParticles.Flares.FlickerFlare2'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	InitialDelayRange=(Min=0.4000000,Max=0.4000000)
end object
