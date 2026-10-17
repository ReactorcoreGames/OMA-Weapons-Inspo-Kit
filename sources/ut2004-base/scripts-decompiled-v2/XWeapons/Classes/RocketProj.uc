class RocketProj extends Projectile;

var bool bRing;
var bool bHitWater;
var bool bWaterStart;
var int NumExtraRockets;
var xEmitter SmokeTrail;
var Effects Corona;
var byte FlockIndex;
var RocketProj Flock[2];
var() float FlockRadius;
var() float FlockStiffness;
var() float FlockMaxForce;
var() float FlockCurlForce;
var bool bCurl;
var Vector Dir;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		FlockIndex, bCurl;
}

simulated function Destroyed()
{
	// End:0x1C
	if(SmokeTrail != none)
	{
		SmokeTrail.mRegen = false;
	}
	// End:0x33
	if(Corona != none)
	{
		Corona.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function PostBeginPlay()
{
	// End:0x37
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SmokeTrail = Spawn(Class'XEffects.RocketTrailSmoke', self);
		Corona = Spawn(Class'XEffects.RocketCorona', self);
	}
	Dir = Vector(Rotation);
	Velocity = Speed * Dir;
	// End:0x82
	if(PhysicsVolume.bWaterVolume)
	{
		bHitWater = true;
		Velocity = 0.6000000 * Velocity;
	}
	super.PostBeginPlay();
	//return;	
}

simulated function PostNetBeginPlay()
{
	local RocketProj R;
	local int i;
	local PlayerController PC;

	super(Actor).PostNetBeginPlay();
	// End:0xD1
	if(int(FlockIndex) != 0)
	{
		SetTimer(0.1000000, true);
		// End:0xD1
		if(Flock[1] == none)
		{
			// End:0xD0
			foreach DynamicActors(Class'XWeapons.RocketProj', R)
			{
				// End:0xCF
				if(int(R.FlockIndex) == int(FlockIndex))
				{
					Flock[i] = R;
					// End:0x91
					if(R.Flock[0] == none)
					{
						R.Flock[0] = self;						
					}
					else
					{
						// End:0xB9
						if(R.Flock[0] != self)
						{
							R.Flock[1] = self;
						}
					}
					i++;
					// End:0xCF
					if(i == 2)
					{
						// End:0xD0
						break;
					}
				}				
			}			
		}
	}
	// End:0xEC
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x12C
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		bDynamicLight = false;
		LightType = 0;		
	}
	else
	{
		PC = Level.GetLocalPlayerController();
		// End:0x168
		if((Instigator != none) && PC == Instigator.Controller)
		{
			return;
		}
		// End:0x1C7
		if(((PC == none) || PC.ViewTarget == none) || VSize(PC.ViewTarget.Location - Location) > float(3000))
		{
			bDynamicLight = false;
			LightType = 0;
		}
	}
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	Explode(Location, HitNormal);
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x56
	if((Other != Instigator) && !Other.IsA('Projectile') || Other.bProjTarget)
	{
		Explode(HitLocation, Vector(Rotation) * float(-1));
	}
	//return;	
}

function BlowUp(Vector HitLocation)
{
	HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
	MakeNoise(1.0000000);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local PlayerController PC;

	PlaySound(Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion3',, 2.5000000 * TransientSoundVolume);
	// End:0xC1
	if(EffectIsRelevant(Location, false))
	{
		Spawn(Class'XEffects.NewExplosionA',,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
		PC = Level.GetLocalPlayerController();
		// End:0xC1
		if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(5000))
		{
			Spawn(Class'XEffects.ExplosionCrap',,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
		}
	}
	BlowUp(HitLocation);
	Destroy();
	//return;	
}

simulated function Timer()
{
	local Vector ForceDir, CurlDir;
	local float forceMag;
	local int i;

	Velocity = default.Speed * Normal(((Dir * 0.5000000) * default.Speed) + Velocity);
	i = 0;
	J0x30:

	// End:0x12B [Loop If]
	if(i < 2)
	{
		// End:0x50
		if(Flock[i] == none)
		{
			// [Explicit Continue]
			goto J0x121;
		}
		ForceDir = Flock[i].Location - Location;
		forceMag = FlockStiffness * ((float(2) * FlockRadius) - VSize(ForceDir));
		Acceleration = Normal(ForceDir) * float(Min(int(forceMag), int(FlockMaxForce)));
		CurlDir = Flock[i].Velocity Cross ForceDir;
		// End:0x10C
		if(bCurl == Flock[i].bCurl)
		{
			Acceleration += (Normal(CurlDir) * FlockCurlForce);
			// [Explicit Continue]
			goto J0x121;
		}
		Acceleration -= (Normal(CurlDir) * FlockCurlForce);
		J0x121:

		i++;
		// [Loop Continue]
		goto J0x30;
	}
	//return;	
}

defaultproperties
{
	FlockRadius=12.0000000
	FlockStiffness=-40.0000000
	FlockMaxForce=600.0000000
	FlockCurlForce=450.0000000
	Speed=1350.0000000
	MaxSpeed=1350.0000000
	Damage=90.0000000
	MomentumTransfer=50000.0000000
	MyDamageType=Class'XWeapons.DamTypeRocket'
	ExplosionDecal=Class'XEffects.RocketMark'
	LightType=1
	LightEffect=21
	LightHue=28
	LightBrightness=255.0000000
	LightRadius=5.0000000
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.RocketProj'
	CullDistance=7500.0000000
	bDynamicLight=true
	AmbientSound=Sound'WeaponSounds.RocketLauncher.RocketLauncherProjectile'
	LifeSpan=8.0000000
	AmbientGlow=96
	FluidSurfaceShootStrengthMod=10.0000000
	SoundVolume=255
	SoundRadius=100.0000000
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=50000)
	DesiredRotation=(Pitch=0,Yaw=0,Roll=30000)
	ForceType=2
	ForceRadius=100.0000000
	ForceScale=5.0000000
}
