class BallisticGib extends Effects
	config(BallisticProV55);

var() int Spin;
var() float DampenFactor;
var() globalconfig bool bUseBloodSplats;
var() array<Sound> HitSounds;
var() float HitSoundVolume;
var() float HitSoundRadius;
var() float HitSoundThreshold;
var float LastSoundTime;
var() Class<BallisticDecal> DecalClass;
var() Class<Emitter> TrailClass;
var() Class<Emitter> FireTrailClass;
var Emitter Trail;
var float LastDecalTime;
var() bool bFiery;
var() float HitDecalThreshold;
var() bool bNoTrailWhenStill;
var bool bInitialized;

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	SetTimer(0.0500000, false);
	//return;	
}

simulated function InitGib()
{
	RandSpin(32768.0000000);
	// End:0x30
	if(int(Level.DetailMode) < int(2))
	{
		LifeSpan *= 0.5000000;
	}
	SetTimer(FMax(0.2000000, LifeSpan - 2.0000000), false);
	// End:0x78
	if(bFiery)
	{
		// End:0x75
		if(FireTrailClass != none)
		{
			Trail = Spawn(FireTrailClass, self,, Location, Rotation);
		}		
	}
	else
	{
		// End:0x9D
		if(TrailClass != none)
		{
			Trail = Spawn(TrailClass, self,, Location, Rotation);
		}
	}
	// End:0xB5
	if(Trail != none)
	{
		Trail.SetBase(self);
	}
	bInitialized = true;
	//return;	
}

final simulated function RandSpin(float spinRate)
{
	DesiredRotation = RotRand();
	RotationRate.Yaw = int(float(int((FRand() * spinRate) * float(2))) - spinRate);
	RotationRate.Pitch = int(float(int((FRand() * spinRate) * float(2))) - spinRate);
	RotationRate.Roll = int(float(int((FRand() * spinRate) * float(2))) - spinRate);
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local float Speed;
	local Rotator R;

	Velocity = DampenFactor * ((((Velocity Dot HitNormal) * HitNormal) * -2.0000000) + Velocity);
	Speed = VSize(Velocity);
	RandSpin(float(Spin));
	// End:0xD3
	if((Speed < float(20)) || Mover(Wall) != none)
	{
		bBounce = false;
		SetPhysics(0);
		R = Normalize(Rotation);
		bCollideWorld = false;
		SetCollision(false, false);
		// End:0xAE
		if(Wall != none)
		{
			bHardAttach = true;
			SetBase(Wall);
		}
		// End:0xD3
		if(bNoTrailWhenStill && Trail != none)
		{
			Trail.Kill();
		}
	}
	// End:0x144
	if(((Speed > HitSoundThreshold) && HitSounds.Length > 0) && (Level.TimeSeconds - LastSoundTime) > 0.1500000)
	{
		LastSoundTime = Level.TimeSeconds;
		PlaySound(HitSounds[Rand(HitSounds.Length)],, HitSoundVolume,, HitSoundRadius,, true);
	}
	// End:0x1D9
	if(((((bUseBloodSplats && DecalClass != none) && Speed > HitDecalThreshold) && Wall != none) && Wall.bWorldGeometry) && (Level.TimeSeconds - LastDecalTime) > 0.2000000)
	{
		LastDecalTime = Level.TimeSeconds;
		Spawn(DecalClass,,, Location, Rotator(-HitNormal));
	}
	//return;	
}

simulated function Timer()
{
	// End:0x13
	if(bInitialized)
	{
		GotoState('FadeOut');		
	}
	else
	{
		InitGib();
	}
	//return;	
}

state FadeOut
{
	function Tick(float dt)
	{
		SetLocation(Location - ((vect(0.0000000, 0.0000000, 1.0000000) * float(9)) * dt));
		//return;		
	}

	function BeginState()
	{
		bCollideWorld = false;
		LifeSpan = 2.0000000;
		// End:0x2D
		if(Trail != none)
		{
			Trail.Kill();
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	Spin=70000
	DampenFactor=0.5000000
	bUseBloodSplats=true
	HitSoundVolume=0.4000000
	HitSoundRadius=64.0000000
	HitSoundThreshold=100.0000000
	HitDecalThreshold=50.0000000
	bNoTrailWhenStill=true
	DrawType=8
	Physics=2
	LifeSpan=16.0000000
	AmbientGlow=32
	bUnlit=false
	TransientSoundVolume=0.1700000
	CollisionRadius=2.0000000
	CollisionHeight=2.0000000
	bCollideWorld=true
	bBounce=true
	bFixedRotationDir=true
	Mass=15.0000000
}
