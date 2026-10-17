class LAWMineHvy extends BallisticProjectile;

var bool bDetonated;
var bool bDetonating;
var() Sound ArmingSound;
var int ShockRadius;
var int ShockDamage;
var() Class<DamageType> MyShotDamageType;
var() Class<BCImpactManager> ImpactManager2;
var byte TeamLightColor;
var int Health;
var Emitter TeamLight;
var float TriggerStartTime;
var int PulseNum;
var bool bShot;
var bool bPulse;
var bool bOldPulse;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		TeamLightColor, bDetonated, 
		bDetonating, bPulse, 
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
		if(int(TeamLightColor) == 0)
		{
			TeamLight = Spawn(Class'BWBP_SKC_Pro.LAWSparkEmitterRed', self,, Location, Rotation);			
		}
		else
		{
			TeamLight = Spawn(Class'BWBP_SKC_Pro.LAWSparkEmitter', self,, Location, Rotation);
		}
		TeamLight.SetBase(self);
	}
	// End:0x9D
	if(bShot || bDetonated)
	{
		Explode(Location, Vector(Rotation));
	}
	// End:0xCD
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
	// End:0x27
	if(int(Role) == int(ROLE_Authority))
	{
		bDetonating = true;
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
	// End:0x8B
	if((PulseNum < 5) && !bShot)
	{
		// End:0x6E
		if(int(Level.NetMode) == int(NM_Standalone))
		{
			ShockwaveExplode(Location, Vector(Rotation));			
		}
		else
		{
			Shockwave(Location);
			bPulse = !bPulse;
		}		
	}
	else
	{
		bDetonated = true;
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
	// End:0x3F
	if(Class<DTLAWPulse>(DamageType) != none)
	{
		return;
	}
	// End:0x4E
	if(StartDelay > float(0))
	{
		return;
	}
	// End:0x59
	if(bShot)
	{
		return;
	}
	Health -= Damage;
	// End:0x72
	if(Health > 0)
	{
		return;
	}
	bShot = true;
	SetTimer(0.1000000, false);
	//return;	
}

function BlowUp(Vector HitLocation)
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0xC5
	if(DamageRadius > float(0))
	{
		// End:0x57
		if(bShot && PulseNum == 0)
		{
			TargetedHurtRadius(Damage, DamageRadius, MyShotDamageType, MomentumTransfer, HitLocation);			
		}
		else
		{
			// End:0x94
			if(bShot)
			{
				TargetedHurtRadius(Damage / float(PulseNum), DamageRadius / float(PulseNum), MyShotDamageType, MomentumTransfer, HitLocation);				
			}
			else
			{
				TargetedHurtRadius(Damage / float(PulseNum), DamageRadius / float(PulseNum), MyRadiusDamageType, MomentumTransfer, HitLocation);
			}
		}
	}
	MakeNoise(1.0000000);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
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
	// End:0xE8
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x76
		if(bCheckHitSurface)
		{
			CheckSurface(HitLocation, HitNormal, Surf);
		}
		// End:0x8A
		if(bShot)
		{
			ImpactManager = Class'BWBP_SKC_Pro.IM_LAWSmall';
		}
		// End:0xC5
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Instigator);
		}
	}
	BlowUp(HitLocation);
	bExploded = true;
	// End:0x139
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
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
	// End:0x94
	foreach RadiusActors(Class'Engine.Actor', A, float(ShockRadius), Location)
	{
		// End:0x93
		if(A.bCanBeDamaged)
		{
			Class'BCoreProV55.BallisticDamageType'.static.Hurt(A, float(ShockDamage), Instigator, A.Location, Normal(A.Location - Location) * float(500), Class'BWBP_SKC_Pro.DTLAWPulse');
		}		
	}	
	PulseNum++;
	SetTimer(3.1000000, false);
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
	ShockRadius=1600
	ShockDamage=50
	MyShotDamageType=Class'BWBP_SKC_Pro.DTLAWShot'
	ImpactManager2=Class'BWBP_SKC_Pro.IM_LAWWave'
	Health=70
	WeaponClass=Class'BWBP_SKC_Pro.LAWLauncher'
	ImpactManager=Class'BallisticProV55.IM_RPG'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	StartDelay=0.3000000
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTLAWMineDet'
	ShakeRadius=3000.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Damage=210.0000000
	DamageRadius=2500.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTLAWMineDet'
	StaticMesh=StaticMesh'BWBP_SKC_Static.LAW.LAWRocket'
	CullDistance=2500.0000000
	bNetTemporary=false
	Physics=0
	LifeSpan=0.0000000
	DrawScale=0.4500000
	bUnlit=false
	CollisionRadius=16.0000000
	CollisionHeight=16.0000000
	bCollideWorld=false
	bProjTarget=true
	bNetNotify=true
}
