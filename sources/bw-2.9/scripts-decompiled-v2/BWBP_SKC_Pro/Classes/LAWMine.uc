class LAWMine extends BallisticProjectile;

var() Sound ArmingSound;
var int ShockRadius;
var float WallDecayFactor;
var() Class<DamageType> MyShotDamageType;
var() Class<BCImpactManager> ImpactManager2;
var int Health;
var Emitter TeamLight;
var int PulseNum;
var bool bPulse;
var bool bOldPulse;
var bool bShot;
var byte TeamLightColor;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		TeamLightColor, bPulse;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0xDB
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x93
		if((Level.Game.bTeamGame && Instigator != none) && Instigator.GetTeamNum() == 0)
		{
			TeamLightColor = 1;
			// End:0x90
			if(int(Level.NetMode) != int(NM_DedicatedServer))
			{
				TeamLight = Spawn(Class'BWBP_SKC_Pro.LAWSparkEmitterRed', self,, Location, Rotation);
			}			
		}
		else
		{
			TeamLightColor = 0;
			// End:0xCE
			if(int(Level.NetMode) != int(NM_DedicatedServer))
			{
				TeamLight = Spawn(Class'BWBP_SKC_Pro.LAWSparkEmitter', self,, Location, Rotation);
			}
		}
		TeamLight.SetBase(self);
	}
	//return;	
}

simulated event PostNetReceive()
{
	super(Actor).PostNetReceive();
	// End:0x77
	if((TeamLight == none) && int(TeamLightColor) != int(default.TeamLightColor))
	{
		// End:0x50
		if(int(TeamLightColor) == 1)
		{
			TeamLight = Spawn(Class'BWBP_SKC_Pro.LAWSparkEmitterRed', self,, Location, Rotation);			
		}
		else
		{
			TeamLight = Spawn(Class'BWBP_SKC_Pro.LAWSparkEmitter', self,, Location, Rotation);
		}
		TeamLight.SetBase(self);
	}
	// End:0xA7
	if(bPulse != bOldPulse)
	{
		bOldPulse = bPulse;
		ShockwaveExplode(Location, Vector(Rotation));
	}
	//return;	
}

simulated function InitProjectile()
{
	super.InitProjectile();
	// End:0x1F
	if(int(Role) == int(ROLE_Authority))
	{
		SetTimer(1.2500000, false);
	}
	PlaySound(ArmingSound,, 2.0000000,, 256.0000000);
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(TeamLight != none)
	{
		TeamLight.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function Timer()
{
	// End:0x15
	if(StartDelay > float(0))
	{
		super.Timer();
		return;
	}
	// End:0x27
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x57
	if(PulseNum < 5)
	{
		ShockwaveExplode(Location, Vector(Rotation));
		bPulse = !bPulse;		
	}
	else
	{
		Explode(Location, Vector(Rotation));
	}
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	//return;	
}

singular simulated function HitWall(Vector HitNormal, Actor Wall)
{
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x2D
	if((Class<BallisticDamageType>(DamageType) != none) && !Class<BallisticDamageType>(DamageType).default.bDetonatesBombs)
	{
		return;
	}
	// End:0x3C
	if(StartDelay > float(0))
	{
		return;
	}
	Health -= Damage;
	// End:0x6D
	if(Health <= 0)
	{
		bShot = true;
		Explode(Location, Vector(Rotation));
	}
	//return;	
}

function BlowUp(Vector HitLocation)
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x99
	if(DamageRadius > float(0))
	{
		// End:0x62
		if(bShot)
		{
			HurtRadius(Damage / float(1 + PulseNum), DamageRadius / float(1 + PulseNum), MyShotDamageType, MomentumTransfer, HitLocation);			
		}
		else
		{
			HurtRadius(Damage / float(1 + PulseNum), DamageRadius / float(1 + PulseNum), MyRadiusDamageType, MomentumTransfer, HitLocation);
		}
	}
	MakeNoise(1.0000000);
	//return;	
}

simulated function ShockwaveExplode(Vector HitLocation, Vector HitNormal)
{
	local int Surf;

	// End:0x0B
	if(bExploded)
	{
		return;
	}
	// End:0x32
	if((ShakeRadius > float(0)) || MotionBlurRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	// End:0xD9
	if((ImpactManager2 != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x76
		if(bCheckHitSurface)
		{
			CheckSurface(HitLocation, HitNormal, Surf);
		}
		// End:0xB1
		if(Instigator == none)
		{
			ImpactManager2.static.StartSpawn(HitLocation, HitNormal, Surf, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager2.static.StartSpawn(HitLocation, HitNormal, Surf, Instigator, TeamLightColor);
		}
	}
	Shockwave(HitLocation);
	//return;	
}

function Shockwave(Vector HitLocation)
{
	local Actor A;

	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x16F
	foreach CollidingActors(Class'Engine.Actor', A, float(ShockRadius), Location)
	{
		// End:0x16E
		if((A != self) && A.bCanBeDamaged)
		{
			// End:0x82
			if((Instigator == none) || Instigator.Controller == none)
			{
				A.SetDelayedDamageInstigatorController(InstigatorController);
			}
			// End:0xEF
			if(FastTrace(A.Location, Location))
			{
				Class'BCoreProV55.BallisticDamageType'.static.Hurt(A, Damage, Instigator, A.Location, Normal(A.Location - Location) * float(500), Class'BWBP_SKC_Pro.DTLAWPulse');
				// End:0x16E
				continue;
			}
			// End:0x16E
			if(VSize(A.Location - Location) < float(ShockRadius / 2))
			{
				Class'BCoreProV55.BallisticDamageType'.static.Hurt(A, Damage * WallDecayFactor, Instigator, A.Location, Normal(A.Location - Location) * float(500), Class'BWBP_SKC_Pro.DTLAWPulse');
			}
		}		
	}	
	PulseNum++;
	SetTimer(2.0000000, false);
	//return;	
}

function bool IsStationary()
{
	return true;
	//return;	
}

defaultproperties
{
	ArmingSound=Sound'BWBP_SKC_Sounds.LAW.LAW-MineAlarm'
	ShockRadius=1536
	WallDecayFactor=0.3500000
	MyShotDamageType=Class'BWBP_SKC_Pro.DTLAWShot'
	ImpactManager2=Class'BWBP_SKC_Pro.IM_LAWWave'
	Health=300
	WeaponClass=Class'BWBP_SKC_Pro.LAWLauncher'
	ImpactManager=Class'BallisticProV55.IM_RPG'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	ModeIndex=1
	StartDelay=0.3000000
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTLAWMineDet'
	ShakeRadius=2000.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Damage=75.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTLAWMineDet'
	StaticMesh=StaticMesh'BWBP_SKC_Static.LAW.LAWRocket'
	bNetTemporary=false
	Physics=0
	LifeSpan=0.0000000
	DrawScale=0.4500000
	bUnlit=false
	CollisionRadius=16.0000000
	CollisionHeight=44.0000000
	bCollideWorld=false
	bProjTarget=true
	bNetNotify=true
}
