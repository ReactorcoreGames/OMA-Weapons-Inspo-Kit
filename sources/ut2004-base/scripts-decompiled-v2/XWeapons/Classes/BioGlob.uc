class BioGlob extends Projectile;

var xEmitter Trail;
var() int BaseDamage;
var() float GloblingSpeed;
var() float RestTime;
var() float TouchDetonationDelay;
var() float DripTime;
var() int MaxGoopLevel;
var int GoopLevel;
var float GoopVolume;
var Vector SurfaceNormal;
var int Rand3;
var bool bCheckedSurface;
var() bool bMergeGlobs;
var bool bDrip;
var bool bOnMover;
var() Sound ExplodeSound;
var AvoidMarker Fear;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		Rand3;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	SetOwner(none);
	LoopAnim('Flying', 1.0000000);
	// End:0x4C
	if(int(Role) == int(ROLE_Authority))
	{
		Velocity = Vector(Rotation) * Speed;
		Velocity.Z += TossZ;
	}
	// End:0x66
	if(int(Role) == int(ROLE_Authority))
	{
		Rand3 = Rand(3);
	}
	// End:0xBE
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && (int(Level.DetailMode) == int(0)) || Level.bDropDetail)
	{
		bDynamicLight = false;
		LightType = 0;
	}
	//return;	
}

function AdjustSpeed()
{
	// End:0x22
	if(GoopLevel < 1)
	{
		Velocity = Vector(Rotation) * Speed;		
	}
	else
	{
		Velocity = ((Vector(Rotation) * Speed) * (0.4000000 + float(GoopLevel))) / (1.4000000 * float(GoopLevel));
	}
	Velocity.Z += TossZ;
	//return;	
}

simulated function PostNetBeginPlay()
{
	// End:0x2F
	if((int(Role) < int(ROLE_Authority)) && int(Physics) == int(0))
	{
		Landed(Vector(Rotation));
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x2C
	if(!bNoFX && EffectIsRelevant(Location, false))
	{
		Spawn(Class'XEffects.GoopSmoke');
		Spawn(Class'XEffects.GoopSparks');
	}
	// End:0x43
	if(Fear != none)
	{
		Fear.Destroy();
	}
	// End:0x5A
	if(Trail != none)
	{
		Trail.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function MergeWithGlob(int AdditionalGoopLevel)
{
	//return;	
}

function BlowUp(Vector HitLocation)
{
	// End:0x8C
	if(int(Role) == int(ROLE_Authority))
	{
		Damage = float(BaseDamage) + (Damage * float(GoopLevel));
		DamageRadius = DamageRadius * GoopVolume;
		MomentumTransfer = MomentumTransfer * GoopVolume;
		// End:0x6D
		if(int(Physics) == int(4))
		{
			MomentumTransfer *= 0.5000000;
		}
		DelayedHurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
	}
	PlaySound(ExplodeSound, 1);
	Destroy();
	//return;	
}

singular function SplashGlobs(int NumGloblings)
{
	local int G;
	local BioGlob NewGlob;
	local Vector VNorm;

	G = 0;
	J0x07:

	// End:0xF6 [Loop If]
	if(G < NumGloblings)
	{
		NewGlob = Spawn(Class, self,, Location + ((GoopVolume * (CollisionHeight + 4.0000000)) * SurfaceNormal));
		// End:0xEC
		if(NewGlob != none)
		{
			NewGlob.Velocity = (GloblingSpeed + (FRand() * 150.0000000)) * (SurfaceNormal + (VRand() * 0.8000000));
			// End:0xD8
			if(int(Physics) == int(2))
			{
				VNorm = (Velocity Dot SurfaceNormal) * SurfaceNormal;
				NewGlob.Velocity += ((-VNorm + (Velocity - VNorm)) * 0.1000000);
			}
			NewGlob.InstigatorController = InstigatorController;
		}
		G++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function SetGoopLevel(int NewGoopLevel)
{
	GoopLevel = NewGoopLevel;
	GoopVolume = Sqrt(float(GoopLevel));
	SetDrawScale(GoopVolume * default.DrawScale);
	LightBrightness = float(Min(100 + (15 * GoopLevel), 255));
	LightRadius = 1.7000000 + (0.2000000 * float(GoopLevel));
	FluidSurfaceShootStrengthMod = 5.0000000 + (0.3000000 * float(NewGoopLevel));
	//return;	
}

auto state Flying
{
	simulated function Landed(Vector HitNormal)
	{
		local Rotator newRot;
		local int CoreGoopLevel;

		// End:0x23
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			PlaySound(ImpactSound, 1);
		}
		SurfaceNormal = HitNormal;
		CoreGoopLevel = (Rand3 + MaxGoopLevel) - 3;
		// End:0x80
		if(GoopLevel > CoreGoopLevel)
		{
			// End:0x75
			if(int(Role) == int(ROLE_Authority))
			{
				SplashGlobs(GoopLevel - CoreGoopLevel);
			}
			SetGoopLevel(CoreGoopLevel);
		}
		Spawn(Class'XEffects.BioDecal',,,, Rotator(-HitNormal));
		bCollideWorld = false;
		SetCollisionSize(GoopVolume * 10.0000000, GoopVolume * 10.0000000);
		bProjTarget = true;
		newRot = Rotator(HitNormal);
		newRot.Roll += 32768;
		SetRotation(newRot);
		SetPhysics(0);
		bCheckedSurface = false;
		// End:0x133
		if((Level.Game != none) && Level.Game.NumBots > 0)
		{
			Fear = Spawn(Class'Engine.AvoidMarker');
		}
		GotoState('OnGround');
		//return;		
	}

	simulated function HitWall(Vector HitNormal, Actor Wall)
	{
		Landed(HitNormal);
		// End:0x5B
		if(!Wall.bStatic && !Wall.bWorldGeometry)
		{
			bOnMover = true;
			SetBase(Wall);
			// End:0x5B
			if(Base == none)
			{
				BlowUp(Location);
			}
		}
		//return;		
	}

	simulated function ProcessTouch(Actor Other, Vector HitLocation)
	{
		local BioGlob Glob;

		Glob = BioGlob(Other);
		// End:0x98
		if(Glob != none)
		{
			// End:0x95
			if((Glob.Owner == none) || (Glob.Owner != Owner) && Glob.Owner != self)
			{
				// End:0x8A
				if(bMergeGlobs)
				{
					Glob.MergeWithGlob(GoopLevel);
					bNoFX = true;
					Destroy();					
				}
				else
				{
					BlowUp(HitLocation);
				}
			}			
		}
		else
		{
			// End:0xF5
			if((Other != Instigator) && (Other.IsA('Pawn') || Other.IsA('DestroyableObjective')) || Other.bProjTarget)
			{
				BlowUp(HitLocation);				
			}
			else
			{
				// End:0x131
				if((Other != Instigator) && Other.bBlockActors)
				{
					HitWall(Normal(HitLocation - Location), Other);
				}
			}
		}
		//return;		
	}
	stop;	
}

state OnGround
{
	simulated function BeginState()
	{
		PlayAnim('Hit');
		SetTimer(RestTime, false);
		//return;		
	}

	simulated function Timer()
	{
		// End:0x6D
		if(bDrip)
		{
			bDrip = false;
			SetCollisionSize(default.CollisionHeight, default.CollisionRadius);
			Velocity = PhysicsVolume.Gravity * 0.2000000;
			SetPhysics(2);
			bCollideWorld = true;
			bCheckedSurface = false;
			bProjTarget = false;
			LoopAnim('Flying', 1.0000000);
			GotoState('Flying');			
		}
		else
		{
			BlowUp(Location);
		}
		//return;		
	}

	simulated function ProcessTouch(Actor Other, Vector HitLocation)
	{
		// End:0x36
		if(Other.IsA('Pawn') && Other != Base)
		{
			bDrip = false;
			SetTimer(TouchDetonationDelay, false);
		}
		//return;		
	}

	function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
	{
		// End:0x30
		if((DamageType != none) && DamageType.default.bDetonatesGoop)
		{
			bDrip = false;
			SetTimer(0.1000000, false);
		}
		//return;		
	}

	simulated function AnimEnd(int Channel)
	{
		local float DotProduct;

		// End:0xA1
		if(!bCheckedSurface)
		{
			DotProduct = SurfaceNormal Dot vect(0.0000000, 0.0000000, -1.0000000);
			// End:0x69
			if(DotProduct > 0.7000000)
			{
				PlayAnim('Drip', 0.6600000);
				bDrip = true;
				SetTimer(DripTime, false);
				// End:0x66
				if(bOnMover)
				{
					BlowUp(Location);
				}				
			}
			else
			{
				// End:0x99
				if(DotProduct > -0.5000000)
				{
					PlayAnim('Slide', 1.0000000);
					// End:0x99
					if(bOnMover)
					{
						BlowUp(Location);
					}
				}
			}
			bCheckedSurface = true;
		}
		//return;		
	}

	simulated function MergeWithGlob(int AdditionalGoopLevel)
	{
		local int NewGoopLevel, ExtraSplash;

		NewGoopLevel = AdditionalGoopLevel + GoopLevel;
		// End:0x7F
		if(NewGoopLevel > MaxGoopLevel)
		{
			Rand3 = int(float(Rand3 + 1) % float(3));
			ExtraSplash = Rand3;
			// End:0x6D
			if(int(Role) == int(ROLE_Authority))
			{
				SplashGlobs((NewGoopLevel - MaxGoopLevel) + ExtraSplash);
			}
			NewGoopLevel = MaxGoopLevel - ExtraSplash;
		}
		SetGoopLevel(NewGoopLevel);
		SetCollisionSize(GoopVolume * 10.0000000, GoopVolume * 10.0000000);
		PlaySound(ImpactSound, 1);
		PlayAnim('Hit');
		bCheckedSurface = false;
		SetTimer(RestTime, false);
		//return;		
	}
	stop;	
}

state Shriveling
{
	simulated function BeginState()
	{
		bProjTarget = false;
		PlayAnim('Shrivel', 1.0000000);
		//return;		
	}

	simulated function AnimEnd(int Channel)
	{
		Destroy();
		//return;		
	}

	simulated function ProcessTouch(Actor Other, Vector HitLocation)
	{
		//return;		
	}
	stop;	
}

defaultproperties
{
	BaseDamage=20
	GloblingSpeed=200.0000000
	RestTime=2.2500000
	TouchDetonationDelay=0.1500000
	DripTime=1.8000000
	MaxGoopLevel=5
	GoopLevel=1
	GoopVolume=1.0000000
	bMergeGlobs=true
	ExplodeSound=SoundGroup'WeaponSounds.BioRifle.BioRifleGoo1'
	Speed=2000.0000000
	TossZ=0.0000000
	bSwitchToZeroCollision=true
	Damage=19.0000000
	DamageRadius=120.0000000
	MomentumTransfer=40000.0000000
	MyDamageType=Class'XWeapons.DamTypeBioGlob'
	ImpactSound=SoundGroup'WeaponSounds.BioRifle.BioRifleGoo2'
	MaxEffectDistance=7000.0000000
	LightType=1
	LightEffect=21
	LightHue=82
	LightSaturation=10
	LightBrightness=190.0000000
	LightRadius=0.6000000
	bDynamicLight=true
	bNetTemporary=false
	bOnlyDirtyReplication=true
	Physics=2
	LifeSpan=20.0000000
	Mesh=VertMesh'XWeapons_rc.GoopMesh'
	DrawScale=1.2000000
	Skins[0]=FinalBlend'XEffectMat.goop.GoopFB'
	AmbientGlow=80
	SoundVolume=255
	SoundRadius=100.0000000
	CollisionRadius=2.0000000
	CollisionHeight=2.0000000
	bUseCollisionStaticMesh=true
}
