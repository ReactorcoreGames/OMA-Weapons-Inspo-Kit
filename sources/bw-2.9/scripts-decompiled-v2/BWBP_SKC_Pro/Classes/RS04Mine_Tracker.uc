class RS04Mine_Tracker extends BallisticProjectile;

var() Sound ArmingSound;
var() Sound PingSound;
var() Sound PingDirectSound;
var() float PingSoundRadius;
var int SensorRadius;
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
	// End:0x52
	if(int(PulseNum) < int(MaxPulseNum))
	{
		Ping();
		bPulse = !bPulse;		
	}
	else
	{
		Explode(Location, Vector(Rotation));
	}
	//return;	
}

function Ping()
{
	// End:0x0B
	if(bExploded)
	{
		return;
	}
	PlaySound(PingDirectSound,, 6.0000000,, PingSoundRadius);
	PulseNum++;
	SetTimer(2.0000000, false);
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
	// End:0x87
	if(EventInstigator == Base)
	{
		return;
	}
	// End:0x96
	if(StartDelay > float(0))
	{
		return;
	}
	Health -= Damage;
	// End:0xBF
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

function bool IsStationary()
{
	return true;
	//return;	
}

defaultproperties
{
	ArmingSound=Sound'BWBP_SKC_Sounds.MARS.MARS-MineAlarm'
	PingSound=Sound'GeneralAmbience.beep7'
	PingDirectSound=Sound'GeneralAmbience.beep6'
	PingSoundRadius=256.0000000
	MyShotDamageType=Class'BWBP_SKC_Pro.DT_MARSMineShot'
	MyPulseDamageType=Class'BWBP_SKC_Pro.DT_MARSMinePulse'
	Health=200
	MaxPulseNum=5
	EndDamageRadius=256.0000000
	TeamLightColor=128
	ActivationDelay=2.0000000
	WeaponClass=Class'BWBP_SKC_Pro.RS04Pistol'
	ImpactManager=Class'BWBP_SKC_Pro.IM_LonghornShatter'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	ModeIndex=1
	StartDelay=0.3000000
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_MARSMineDet'
	ShakeRadius=1000.0000000
	MotionBlurRadius=384.0000000
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
