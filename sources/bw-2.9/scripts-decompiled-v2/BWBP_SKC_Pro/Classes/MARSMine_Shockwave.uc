class MARSMine_Shockwave extends BallisticProjectile;

var() Sound ArmingSound;
var int ShockRadius;
var() Class<DamageType> MyShotDamageType;
var() Class<DamageType> MyPulseDamageType;
var() Class<BCImpactManager> ImpactManager2;
var int Health;
var Emitter TeamLight;
var int PulseNum;
var bool bPulse;
var bool bOldPulse;
var bool bShot;
var float EndDamageRadius;
var byte TeamLightColor;
var float ActivationDelay;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		TeamLightColor, bPulse, 
		bShot;
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
				TeamLight = Spawn(Class'BWBP_SKC_Pro.MARSSparkEmitterRed', self,, Location, Rotation);
			}			
		}
		else
		{
			TeamLightColor = 0;
			// End:0xCE
			if(int(Level.NetMode) != int(NM_DedicatedServer))
			{
				TeamLight = Spawn(Class'BWBP_SKC_Pro.MARSSparkEmitter', self,, Location, Rotation);
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
			TeamLight = Spawn(Class'BWBP_SKC_Pro.MARSSparkEmitterRed', self,, Location, Rotation);			
		}
		else
		{
			TeamLight = Spawn(Class'BWBP_SKC_Pro.MARSSparkEmitter', self,, Location, Rotation);
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
		SetTimer(ActivationDelay, false);
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
	if(PulseNum < 3)
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
	// End:0x76
	if(((EventInstigator != Instigator) && EventInstigator.Controller != none) && EventInstigator.Controller.SameTeamAs(InstigatorController))
	{
		return;
	}
	// End:0x85
	if(StartDelay > float(0))
	{
		return;
	}
	Health -= Damage;
	// End:0xB6
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
	// End:0x49
	if(bShot)
	{
		HurtRadius(Damage / float(1 + PulseNum), DamageRadius, MyShotDamageType, MomentumTransfer, HitLocation);		
	}
	else
	{
		HurtRadius(Damage / float(1 + PulseNum), EndDamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation);
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
	// End:0x10C
	foreach CollidingActors(Class'Engine.Actor', A, float(ShockRadius), Location)
	{
		// End:0x10B
		if((A != self) && A.bCanBeDamaged)
		{
			// End:0xBA
			if(FastTrace(A.Location, Location))
			{
				Class'BCoreProV55.BallisticDamageType'.static.Hurt(A, 25.0000000, Instigator, A.Location, Normal(A.Location - Location) * float(500), MyPulseDamageType);
				// End:0x10B
				continue;
			}
			Class'BCoreProV55.BallisticDamageType'.static.Hurt(A, 15.0000000, Instigator, A.Location, Normal(A.Location - Location) * float(500), MyPulseDamageType);
		}		
	}	
	PulseNum++;
	SetTimer(1.5000000, false);
	//return;	
}

function bool IsStationary()
{
	return true;
	//return;	
}

defaultproperties
{
	ArmingSound=Sound'BWBP_SKC_Sounds.MARS.MARS-MineAlarm'
	ShockRadius=768
	MyShotDamageType=Class'BWBP_SKC_Pro.DT_MARSMineShot'
	MyPulseDamageType=Class'BWBP_SKC_Pro.DT_MARSMinePulse'
	ImpactManager2=Class'BWBP_SKC_Pro.IM_F2000Wave'
	Health=40
	EndDamageRadius=256.0000000
	TeamLightColor=128
	ActivationDelay=2.0000000
	WeaponClass=Class'BWBP_SKC_Pro.MARSAssaultRifle'
	ImpactManager=Class'BWBP_SKC_Pro.IM_PumaDet'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	ModeIndex=1
	StartDelay=0.3000000
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_MARSMineDet'
	ShakeRadius=1000.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=1.5000000
	MotionBlurTime=3.0000000
	Damage=100.0000000
	DamageRadius=256.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_MARSMineDet'
	StaticMesh=StaticMesh'BWBP_SKC_Static.MARS.MARS3Grenade'
	CullDistance=2500.0000000
	bNetTemporary=false
	bAlwaysRelevant=true
	Physics=0
	LifeSpan=0.0000000
	DrawScale=0.5000000
	bUnlit=false
	CollisionRadius=24.0000000
	CollisionHeight=24.0000000
	bCollideWorld=false
	bProjTarget=true
	bNetNotify=true
}
