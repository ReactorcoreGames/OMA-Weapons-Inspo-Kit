class BallisticBrass extends Effects
	abstract
	config(BallisticProV55);

var() int Spin;
var() float DampenFactor;
var() Rotator RandomDir;
var() Vector StartVelocity;
var() globalconfig float LifeTimeScale;
var() bool bAddOwnerVelocity;
var() bool bHitSounds;
var() array<Sound> HitSounds;
var() float HitSoundVolume;
var() float HitSoundRadius;

simulated function ApplyHandedness()
{
	// End:0x4D
	if(((Owner != none) && Weapon(Owner) != none) && Weapon(Owner).hand < float(0))
	{
		StartVelocity.Y *= float(-1);
	}
	//return;	
}

simulated function PostBeginPlay()
{
	local Vector X, Y, Z;
	local Rotator R;

	super(Actor).PostBeginPlay();
	ApplyHandedness();
	R.Pitch = int(float(RandomDir.Pitch) * (float(-1) + (FRand() * float(2))));
	R.Yaw = int(float(RandomDir.Yaw) * (float(-1) + (FRand() * float(2))));
	R.Roll = int(float(RandomDir.Roll) * (float(-1) + (FRand() * float(2))));
	GetAxes(Rotation + R, X, Y, Z);
	Velocity = ((X * StartVelocity.X) + (Y * StartVelocity.Y)) + (Z * StartVelocity.Z);
	// End:0x162
	if(bAddOwnerVelocity)
	{
		// End:0x14D
		if(((Inventory(Owner) != none) || InventoryAttachment(Owner) != none) && Owner.Instigator != none)
		{
			Velocity += Owner.Instigator.Velocity;			
		}
		else
		{
			Velocity += Owner.Velocity;
		}
	}
	RandSpin(32768.0000000);
	// End:0x1AE
	if((int(Level.DetailMode) < int(2)) || int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) < 2)
	{
		LifeSpan *= 0.5000000;		
	}
	else
	{
		LifeSpan *= LifeTimeScale;
	}
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
	local Vector HitLoc, HitNorm, V, v2;
	local Material HitMat;
	local int Surf;

	Velocity = DampenFactor * ((((Velocity Dot HitNormal) * HitNormal) * -2.0000000) + Velocity);
	Speed = VSize(Velocity);
	RandSpin(float(Spin));
	// End:0x1D7
	if((Speed < float(20)) || (Wall != none) && Mover(Wall) != none)
	{
		bBounce = false;
		SetPhysics(0);
		R = Normalize(Rotation);
		// End:0xF1
		if(HitNormal.Z == float(1))
		{
			// End:0xE2
			if((R.Pitch > 16384) || R.Pitch < -16384)
			{
				R.Pitch = 32768;				
			}
			else
			{
				R.Pitch = 0;
			}			
		}
		else
		{
			V = Vector(Rotator(HitNormal) - rot(16384, 0, 0));
			V.Z = 0.0000000;
			v2 = Vector(R);
			v2.Z = 0.0000000;
			R.Pitch += int(float((Rotator(HitNormal).Pitch - 16384) - R.Pitch) * Abs(Normal(V) Dot Normal(v2)));
		}
		SetRotation(R);
		bCollideWorld = false;
		SetCollision(false, false);
		// End:0x1B0
		if(Wall != none)
		{
			bHardAttach = true;
			SetBase(Wall);
		}
		// End:0x1D4
		if(LifeTimeScale != float(0))
		{
			SetTimer(FMax(0.2000000, LifeSpan - 2.0000000), false);
		}		
	}
	else
	{
		// End:0x2AF
		if(Speed > float(100))
		{
			// End:0x21F
			if((Wall != none) && !Wall.bWorldGeometry)
			{
				Surf = int(Wall.SurfaceType);				
			}
			else
			{
				Trace(HitLoc, HitNorm, Location - (HitNormal * float(10)), Location + (HitNormal * float(10)), false,, HitMat);
				// End:0x278
				if(HitMat != none)
				{
					Surf = int(HitMat.SurfaceType);
				}
			}
			// End:0x2AF
			if(bHitSounds && HitSounds.Length > Surf)
			{
				PlaySound(HitSounds[Surf],, HitSoundVolume,, HitSoundRadius,, true);
			}
		}
	}
	//return;	
}

simulated function Timer()
{
	GotoState('FadeOut');
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
		//return;		
	}
	stop;	
}

defaultproperties
{
	Spin=70000
	DampenFactor=0.5000000
	RandomDir=(Pitch=2048,Yaw=2048,Roll=0)
	StartVelocity=(X=0.0000000,Y=20.0000000,Z=100.0000000)
	LifeTimeScale=1.0000000
	bAddOwnerVelocity=true
	bHitSounds=true
	HitSoundVolume=0.4000000
	HitSoundRadius=64.0000000
	DrawType=8
	Physics=2
	LifeSpan=16.0000000
	AmbientGlow=16
	bUnlit=false
	TransientSoundVolume=0.1700000
	CollisionRadius=2.0000000
	CollisionHeight=2.0000000
	bCollideWorld=true
	bBounce=true
	bFixedRotationDir=true
	Mass=30.0000000
	RotationRate=(Pitch=32768,Yaw=60000,Roll=0)
}
