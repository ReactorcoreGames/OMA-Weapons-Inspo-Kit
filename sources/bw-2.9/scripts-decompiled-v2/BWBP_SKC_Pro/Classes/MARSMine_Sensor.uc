class MARSMine_Sensor extends BallisticProjectile;

var() Sound ArmingSound;
var() Sound PingSound;
var() Sound PingDirectSound;
var int SensorRadius;
var int PingSoundRadius;
var() Class<DamageType> MyShotDamageType;
var() Class<DamageType> MyPulseDamageType;
var() Class<BCImpactManager> ImpactManager2;
var int Health;
var Emitter TeamLight;
var byte PulseNum;
var byte MaxPulseNum;
var bool bPulse;
var bool bOldPulse;
var float EndDamageRadius;
var byte TeamLightColor;
var float ActivationDelay;

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
			TeamLightColor = 0;
			// End:0x90
			if(int(Level.NetMode) != int(NM_DedicatedServer))
			{
				TeamLight = Spawn(Class'BWBP_SKC_Pro.MARSSparkEmitterRed', self,, Location, Rotation);
			}			
		}
		else
		{
			TeamLightColor = 1;
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
		if(int(TeamLightColor) == 0)
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
		EmitPulse(Location, Vector(Rotation));
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
	PlaySound(ArmingSound,, 0.3000000,, 256.0000000);
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
	// End:0x5E
	if(int(PulseNum) < int(MaxPulseNum))
	{
		EmitPulse(Location, Vector(Rotation));
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
	// End:0xAE
	if(Health <= 0)
	{
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
	MakeNoise(1.0000000);
	//return;	
}

simulated function EmitPulse(Vector HitLocation, Vector HitNormal)
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
	// End:0xD4
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
			ImpactManager2.static.StartSpawn(HitLocation, HitNormal, Surf, Instigator);
		}
	}
	Ping(HitLocation);
	//return;	
}

function Ping(Vector HitLocation)
{
	local Actor A;

	// End:0x35
	if(((int(Role) < int(ROLE_Authority)) || Instigator == none) || Instigator.Controller == none)
	{
		return;
	}
	// End:0x1C8
	foreach CollidingActors(Class'Engine.Actor', A, float(SensorRadius), Location)
	{
		// End:0x1C7
		if((((A.bCanBeDamaged && A.bProjTarget) && A != self) && (A != Instigator) && A != Owner) && !Level.Game.bTeamGame && Instigator.Controller.SameTeamAs(Pawn(A).Controller))
		{
			// End:0x16C
			if(FastTrace(A.Location, Location))
			{
				A.PlaySound(PingDirectSound,, 6.0000000,, float(PingSoundRadius));
				// End:0x169
				if((Owner != none) && Pawn(A) != none)
				{
					MARSAssaultRifle(Owner).AddTarget(Pawn(A));
				}
				// End:0x1C7
				continue;
			}
			A.PlaySound(PingSound,, 4.0000000,, float(PingSoundRadius));
			// End:0x1C7
			if((Owner != none) && Pawn(A) != none)
			{
				MARSAssaultRifle(Owner).AddTarget(Pawn(A));
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
	ArmingSound=Sound'BWBP_SKC_Sounds.MARS.MARS-MineAlarm'
	PingSound=Sound'GeneralAmbience.beep6'
	PingDirectSound=Sound'BWBP_SKC_Sounds.MJ51.Sensor-PingDirect'
	SensorRadius=768
	PingSoundRadius=256
	MyShotDamageType=Class'BWBP_SKC_Pro.DT_MARSMineShot'
	MyPulseDamageType=Class'BWBP_SKC_Pro.DT_MARSMinePulse'
	ImpactManager2=Class'BWBP_SKC_Pro.IM_RadarWave'
	Health=40
	MaxPulseNum=3
	EndDamageRadius=256.0000000
	TeamLightColor=128
	ActivationDelay=2.0000000
	WeaponClass=Class'BWBP_SKC_Pro.MARSAssaultRifle'
	ImpactManager=Class'BWBP_SKC_Pro.IM_LonghornShatter'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	ModeIndex=1
	StartDelay=0.3000000
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_MARSMineDet'
	ShakeRadius=16.0000000
	MotionBlurRadius=16.0000000
	MotionBlurFactor=1.5000000
	MotionBlurTime=3.0000000
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
