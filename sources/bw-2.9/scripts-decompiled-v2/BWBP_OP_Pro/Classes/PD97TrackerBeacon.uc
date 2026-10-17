class PD97TrackerBeacon extends BallisticProjectile;

var() Class<DamageType> StuckDamageType;
var() bool bNoFXOnExplode;
var() Sound DetonateSound;
var() float TriggerStartTime;
var() PD97TrackerTrail MineEffect;
var() bool bLightSpawned;
var() PD97Bloodhound Master;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLightSpawned;
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

simulated event PostNetReceive()
{
	super(Actor).PostNetReceive();
	// End:0x3D
	if((MineEffect == none) && bLightSpawned != default.bLightSpawned)
	{
		MineEffect = SpawnMineLight();
		MineEffect.SetBase(self);
	}
	//return;	
}

simulated function PD97TrackerTrail SpawnMineLight()
{
	local Vector X, Y, Z;
	local PD97TrackerTrail ML;

	GetAxes(Rotation, X, Y, Z);
	ML = Spawn(Class'BWBP_OP_Pro.PD97TrackerTrail', self,, Location - (X * float(16)), Rotation);
	return ML;
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	//return;	
}

function bool IsStationary()
{
	return true;
	//return;	
}

simulated function Destroyed()
{
	local int Surf;

	// End:0xD5
	if(bNoFXOnExplode && !bNoFX)
	{
		// End:0xD5
		if(((EffectIsRelevant(Location, false)) && ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
		{
			// End:0x6F
			if(bCheckHitSurface)
			{
				CheckSurface(Location, -Vector(Rotation), Surf);
			}
			// End:0xAE
			if(Instigator == none)
			{
				ImpactManager.static.StartSpawn(Location, -Vector(Rotation), Surf, Level.GetLocalPlayerController());				
			}
			else
			{
				ImpactManager.static.StartSpawn(Location, -Vector(Rotation), Surf, Instigator);
			}
		}
	}
	// End:0xEC
	if(MineEffect != none)
	{
		MineEffect.Destroy();
	}
	super.Destroyed();
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
	// End:0xDF
	if(!bNoFXOnExplode)
	{
		// End:0xDF
		if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
		{
			// End:0x81
			if(bCheckHitSurface)
			{
				CheckSurface(HitLocation, HitNormal, Surf);
			}
			// End:0xBC
			if(Instigator == none)
			{
				ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Level.GetLocalPlayerController());				
			}
			else
			{
				ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Instigator);
			}
		}
	}
	BlowUp(HitLocation);
	bExploded = true;
	// End:0x15B
	if((!bNetTemporary && bTearOnExplode) && (int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		TearOffHitNormal = HitNormal;
		bTearOff = true;
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
	//return;	
}

simulated function InitProjectile()
{
	super.InitProjectile();
	PlaySound(DetonateSound,, 2.0000000,, 256.0000000);
	SetTimer(20.0000000, false);
	return;
	//return;	
}

simulated event Timer()
{
	// End:0x16
	if(StartDelay > float(0))
	{
		super.Timer();		
	}
	else
	{
		Explode(Location, Vector(Rotation));
	}
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
	// End:0xBB
	if(DamageRadius > float(0))
	{
		// End:0x9C
		if(Pawn(Base) != none)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Base, Damage, Instigator, HitLocation, MomentumTransfer * Normal(Base.Location - Location), StuckDamageType);
			TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation, Base);			
		}
		else
		{
			TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation);
		}
	}
	MakeNoise(1.0000000);
	//return;	
}

defaultproperties
{
	StuckDamageType=Class'BallisticProV55.DTM46GrenadeStuck'
	bNoFXOnExplode=true
	DetonateSound=Sound'MenuSounds.select3'
	WeaponClass=Class'BWBP_OP_Pro.PD97Bloodhound'
	ImpactManager=Class'BWBP_SKC_Pro.IM_LonghornShatter'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_OP_Pro.PD97BeaconEffect'
	ModeIndex=1
	bTearOnExplode=false
	MyRadiusDamageType=Class'BallisticProV55.DTM46GrenadeRadius'
	WallPenetrationForce=128.0000000
	ShakeRadius=512.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Damage=5.0000000
	DamageRadius=1.0000000
	MyDamageType=Class'BallisticProV55.DTM46GrenadeRadius'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_Grenade'
	CullDistance=2500.0000000
	bNetTemporary=false
	Physics=0
	LifeSpan=0.0000000
	DrawScale=0.2500000
	bUnlit=false
	CollisionRadius=16.0000000
	CollisionHeight=16.0000000
	bCollideWorld=false
	bProjTarget=true
	bNetNotify=true
}
