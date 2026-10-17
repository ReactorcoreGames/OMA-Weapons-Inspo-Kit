class CoachGunPreconstructor extends BallisticEmitter;

var float Health;
var float MaxHealth;
var Vector GroundPoint;
var Class<Actor> myDeployable;
var Class<Vehicle> myVehicle;
var float WarpingTime;
var float WarpTime;
var CoachGun Master;
var bool bDie;
var Sound SpawnSound;
var Sound AssembleSound;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Health, WarpTime, 
		bDie;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	PlaySound(SpawnSound,, 1.0000000);
	//return;	
}

function Initialize(Class<Actor> inClass, float ConstructionTime)
{
	// End:0x39
	if(Class<Vehicle>(inClass) != none)
	{
		myVehicle = Class<Vehicle>(inClass);
		Health = float(myVehicle.default.Health);		
	}
	else
	{
		myDeployable = inClass;
		// End:0x72
		if(Class<Decoration>(myDeployable) != none)
		{
			Health = float(Class<Decoration>(myDeployable).default.Health);			
		}
		else
		{
			Health = 500.0000000;
		}
	}
	MaxHealth = Health;
	WarpTime = ConstructionTime;
	SetTimer(ConstructionTime, false);
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x4E
	if(((EventInstigator != none) && EventInstigator.Controller != none) && EventInstigator.Controller.SameTeamAs(Instigator.Controller))
	{
		return;
	}
	// End:0x5D
	if(Health < float(1))
	{
		return;
	}
	Health -= (float(Damage) * 0.2000000);
	// End:0xA3
	if(Health < float(1))
	{
		PlaySound(AssembleSound,, 1.0000000);
		bDie = true;
		bTearOff = true;
		Kill();
	}
	//return;	
}

simulated function TornOff()
{
	SetCollision(false, false, false);
	// End:0x19
	if(!bDie)
	{
		Spawn(Class'BWBP_SKC_Pro.WrenchWarpEndEmitter');
	}
	PlaySound(AssembleSound,, 1.0000000);
	Kill();
	//return;	
}

function Timer()
{
	bHidden = true;
	bAlwaysRelevant = true;
	bTearOff = true;
	// End:0x54
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && !bDie)
	{
		Spawn(Class'BWBP_SKC_Pro.WrenchWarpEndEmitter');
		PlaySound(AssembleSound,, 1.0000000);
	}
	GotoState('SpawnIn');
	//return;	
}

simulated function Tick(float dt)
{
	// End:0x20
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Disable('Tick');
	}
	// End:0x73
	if(WarpTime == float(0))
	{
		Emitters[0].Opacity = 0.0000000;
		Emitters[1].Opacity = 0.0000000;
		Emitters[2].Opacity = 0.0000000;		
	}
	else
	{
		WarpingTime += dt;
		Emitters[0].Opacity = 0.5800000 * (WarpingTime / WarpTime);
		Emitters[1].Opacity = 0.5000000 * (WarpingTime / WarpTime);
		Emitters[2].Opacity = 0.3300000 * (WarpingTime / WarpTime);
	}
	//return;	
}

state SpawnIn
{
	function SpawnVehicle()
	{
		local Vehicle newVehicle;

		newVehicle = Spawn(myVehicle,,, GroundPoint + vect(0.0000000, 0.0000000, 1.0000000), Rotation);
		newVehicle.Health = int(Health);
		newVehicle.bTeamLocked = false;
		//return;		
	}

	function SpawnDeployable()
	{
		local CoachDeployable W;

		W = CoachDeployable(Spawn(myDeployable, Instigator,, GroundPoint, Rotation));
		W.Health = int(Health);
		//return;		
	}
Begin:

	Sleep(0.3000000);
	SetCollision(false, false, false);
	// End:0x22
	if(myVehicle != none)
	{
		SpawnVehicle();		
	}
	else
	{
		SpawnDeployable();
	}
	Sleep(0.5000000);
	Destroy();
	stop;					
}

defaultproperties
{
	Health=100.0000000
	MaxHealth=100.0000000
	SpawnSound=Sound'BWBP_OP_Sounds.Wrench.electric_burst_6'
	AssembleSound=Sound'BWBP_OP_Sounds.Wrench.artifact_assembled_3'
	// Reference: SpriteEmitter'BWBP_SKC_Pro.CoachGunPreconstructor.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=164,G=221,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=36,B=179,A=255))
		Opacity=0.5800000
		FadeOutStartTime=0.5600000
		FadeInEndTime=0.0200000
		CoordinateSystem=1
		MaxParticles=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=4.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=9.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		WarmupTicksPerSecond=1.0000000
		RelativeWarmupTime=2.0000000
	end object
	Emitters[0]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_SKC_Pro.CoachGunPreconstructor.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=178,G=178,B=178,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=65,G=128,B=190,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=100,G=91,B=255,A=255))
		Opacity=0.5000000
		FadeOutStartTime=0.2000000
		CoordinateSystem=1
		MaxParticles=30
		StartLocationShape=1
		SphereRadiusRange=(Min=25.0000000,Max=50.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=8.0000000)
		StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=35.0000000,Max=35.0000000),Z=(Min=35.0000000,Max=35.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'AW-2004Particles.Energy.BurnFlare'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRadialRange=(Min=5.0000000,Max=5.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[1]=SpriteEmitter4
	// Reference: SpriteEmitter'BWBP_SKC_Pro.CoachGunPreconstructor.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.3300000
		FadeOutStartTime=0.0400800
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.SmoothRing'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[2]=SpriteEmitter5
	// Reference: SpriteEmitter'BWBP_SKC_Pro.CoachGunPreconstructor.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=36,G=30,B=108,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=152,G=197,B=252,A=255))
		Opacity=0.6300000
		FadeOutStartTime=0.0775000
		FadeInEndTime=0.0275000
		MaxParticles=15
		StartLocationShape=1
		SphereRadiusRange=(Min=1.0000000,Max=5.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=7.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		InitialParticlesPerSecond=12.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRadialRange=(Min=30.0000000,Max=370.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[3]=SpriteEmitter6
	// Reference: SpriteEmitter'BWBP_SKC_Pro.CoachGunPreconstructor.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1600000
		FadeInEndTime=0.0900000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStarRed'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		WarmupTicksPerSecond=1.0000000
		RelativeWarmupTime=2.0000000
	end object
	Emitters[4]=SpriteEmitter7
	RemoteRole=2
	AmbientSound=Sound'BWBP_OP_Sounds.Wrench.Hum10'
	bCanBeDamaged=true
	SoundVolume=255
	SoundRadius=128.0000000
	CollisionRadius=48.0000000
	CollisionHeight=30.0000000
	bCollideActors=true
	bBlockActors=true
	bBlockProjectiles=true
	bProjTarget=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.CoachGunPreconstructor.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=164,G=221,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=36,B=179,A=255))
	Opacity=0.5800000
	FadeOutStartTime=0.5600000
	FadeInEndTime=0.0200000
	CoordinateSystem=1
	MaxParticles=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=4.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=9.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	WarmupTicksPerSecond=1.0000000
	RelativeWarmupTime=2.0000000
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.CoachGunPreconstructor.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=178,G=178,B=178,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=65,G=128,B=190,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=100,G=91,B=255,A=255))
	Opacity=0.5000000
	FadeOutStartTime=0.2000000
	CoordinateSystem=1
	MaxParticles=30
	StartLocationShape=1
	SphereRadiusRange=(Min=25.0000000,Max=50.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=8.0000000)
	StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=35.0000000,Max=35.0000000),Z=(Min=35.0000000,Max=35.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'AW-2004Particles.Energy.BurnFlare'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRadialRange=(Min=5.0000000,Max=5.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.CoachGunPreconstructor.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.3300000
	FadeOutStartTime=0.0400800
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.SmoothRing'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.CoachGunPreconstructor.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=36,G=30,B=108,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=152,G=197,B=252,A=255))
	Opacity=0.6300000
	FadeOutStartTime=0.0775000
	FadeInEndTime=0.0275000
	MaxParticles=15
	StartLocationShape=1
	SphereRadiusRange=(Min=1.0000000,Max=5.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=7.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	InitialParticlesPerSecond=12.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRadialRange=(Min=30.0000000,Max=370.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.CoachGunPreconstructor.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1600000
	FadeInEndTime=0.0900000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStarRed'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	WarmupTicksPerSecond=1.0000000
	RelativeWarmupTime=2.0000000
end object
