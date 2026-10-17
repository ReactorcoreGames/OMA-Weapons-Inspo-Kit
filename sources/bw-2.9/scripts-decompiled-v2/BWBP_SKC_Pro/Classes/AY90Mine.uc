class AY90Mine extends BallisticProjectile;

var bool bDetonated;
var bool bLightSpawned;
var() Sound ArmingSound;
var AY90MineLight MineEffect;
var int StuckDamage;
var() Class<DamageType> MyStuckDamageType;
var() Class<DamageType> MyStuckRadiusDamageType;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bDetonated, bLightSpawned;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x37
	if(int(Role) == int(ROLE_Authority))
	{
		MineEffect = SpawnMineLight();
		MineEffect.SetBase(self);
		bLightSpawned = true;
	}
	//return;	
}

simulated function PreBeginPlay()
{
	local BallisticWeapon BW;

	super(Actor).PreBeginPlay();
	// End:0x13
	if(Instigator == none)
	{
		return;
	}
	BW = BallisticWeapon(Instigator.Weapon);
	// End:0x39
	if(BW == none)
	{
		return;
	}
	BW.default.ParamsClasses[int(BW.GameStyleIndex)].static.OverrideProjectileParams(self, 0);
	//return;	
}

simulated event PostNetReceive()
{
	super(Actor).PostNetReceive();
	// End:0x21
	if(bDetonated)
	{
		Explode(Location, Vector(Rotation));
	}
	// End:0x58
	if((MineEffect == none) && bLightSpawned != default.bLightSpawned)
	{
		MineEffect = SpawnMineLight();
		MineEffect.SetBase(self);
	}
	//return;	
}

simulated function AY90MineLight SpawnMineLight()
{
	local Vector X, Y, Z;
	local AY90MineLight ML;

	GetAxes(Rotation, X, Y, Z);
	ML = Spawn(Class'BWBP_SKC_Pro.AY90MineLight', self,, Location - (X * float(16)), Rotation);
	return ML;
	//return;	
}

simulated function InitProjectile()
{
	super.InitProjectile();
	// End:0x1F
	if(int(Role) == int(ROLE_Authority))
	{
		SetTimer(1.0000000, false);
	}
	PlaySound(ArmingSound,, 2.0000000,, 128.0000000);
	//return;	
}

simulated function Timer()
{
	// End:0x18
	if(StartDelay > float(0))
	{
		super.Timer();
		return;		
	}
	else
	{
		// End:0x3A
		if(int(Role) == int(ROLE_Authority))
		{
			Explode(Location, Vector(Rotation));
		}
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

function BlowUp(Vector HitLocation)
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0xBD
	if(DamageRadius > float(0))
	{
		// End:0x9E
		if(Pawn(Base) != none)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Base, float(StuckDamage), Instigator, HitLocation, MomentumTransfer * Normal(Base.Location - Location), MyStuckDamageType);
			TargetedHurtRadius(Damage, DamageRadius, MyStuckRadiusDamageType, MomentumTransfer, HitLocation, Base);			
		}
		else
		{
			TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation);
		}
	}
	MakeNoise(1.0000000);
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(MineEffect != none)
	{
		MineEffect.Destroy();
	}
	super.Destroyed();
	//return;	
}

function bool IsStationary()
{
	return true;
	//return;	
}

defaultproperties
{
	ArmingSound=Sound'BWBP_SKC_Sounds.SkrithBow.Skrithbow-Fuse'
	StuckDamage=180
	MyStuckDamageType=Class'BWBP_SKC_Pro.DTAY90Skrith_BoltStuckExplode'
	MyStuckRadiusDamageType=Class'BWBP_SKC_Pro.DTAY90Skrith_BoltStuckExplodeRadius'
	WeaponClass=Class'BWBP_SKC_Pro.AY90SkrithBoltcaster'
	ImpactManager=Class'BWBP_SKC_Pro.IM_SkrithbowSticky'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	StartDelay=0.3000000
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTAY90SkrithRadius'
	ShakeRadius=1000.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=1.5000000
	MotionBlurTime=3.0000000
	Damage=150.0000000
	DamageRadius=256.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTAY90SkrithRadius'
	LightType=1
	LightEffect=21
	LightHue=200
	LightSaturation=5
	LightBrightness=500.0000000
	LightRadius=2.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.DarkProjBig'
	CullDistance=2500.0000000
	bDynamicLight=true
	bNetTemporary=false
	Physics=0
	LifeSpan=0.0000000
	DrawScale=0.5000000
	bUnlit=false
	CollisionRadius=16.0000000
	CollisionHeight=16.0000000
	bCollideWorld=false
	bProjTarget=true
	bNetNotify=true
}
