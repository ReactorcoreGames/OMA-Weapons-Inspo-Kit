class CX85DartDirect extends BallisticProjectile;

var() Class<DamageType> StuckDamageType;
var() bool bNoFXOnExplode;
var int TrackCount;
var bool bIsMaster;
var array<CX85DartDirect> Slaves;
var Pawn Tracked;

replication
{
	// Pos:0x000
	reliable if(bNetOwner && int(Role) == int(ROLE_Authority))
		TrackCount, Tracked;

	// Pos:0x018
	reliable if(bNetOwner && int(Role) < int(ROLE_Authority))
		ServerNotifyReceived;
}

function SetMaster()
{
	bIsMaster = true;
	Tracked.bAlwaysRelevant = true;
	SetTimer(5.0000000, true);
	//return;	
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x1E
	if(Instigator.IsLocallyControlled())
	{
		ServerNotifyReceived();
	}
	//return;	
}

function ServerNotifyReceived()
{
	// End:0x37
	if((int(Role) == int(ROLE_Authority)) && CX85AssaultWeapon(Owner) != none)
	{
		CX85AssaultWeapon(Owner).AddProjectile(self);
	}
	//return;	
}

function Timer()
{
	// End:0x2D
	if(!Tracked.bProjTarget || Tracked.Health < 1)
	{
		Destroy();
	}
	//return;	
}

event BaseChange()
{
	// End:0x1D
	if(Base == none)
	{
		Explode(Location, Vector(Rotation));
	}
	//return;	
}

event GainedChild(Actor proj)
{
	Slaves[Slaves.Length] = CX85DartDirect(proj);
	TrackCount++;
	//return;	
}

event LostChild(Actor proj)
{
	TrackCount--;
	//return;	
}

simulated function Destroyed()
{
	local int Surf, i;

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
	// End:0x179
	if(bIsMaster)
	{
		i = 0;
		J0xE5:

		// End:0x14F [Loop If]
		if(i < Slaves.Length)
		{
			// End:0x145
			if(Slaves[i] != none)
			{
				Slaves[i].Explode(Slaves[i].Location, Vector(Slaves[i].Rotation));
			}
			i++;
			// [Loop Continue]
			goto J0xE5;
		}
		// End:0x179
		if(Tracked != none)
		{
			Tracked.bAlwaysRelevant = Tracked.default.bAlwaysRelevant;
		}
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
	// End:0xF3
	if(bIsMaster)
	{
		BlowUp(HitLocation);
	}
	bExploded = true;
	// End:0x164
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
	// End:0xCF
	if(DamageRadius > float(0))
	{
		// End:0xB0
		if(Pawn(Base) != none)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Base, Damage * (float(1 + Slaves.Length) ** 1.4000000), Instigator, HitLocation, MomentumTransfer * Normal(Base.Location - Location), MyDamageType);
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

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	//return;	
}

function bool IsStationary()
{
	return true;
	//return;	
}

defaultproperties
{
	bNoFXOnExplode=true
	TrackCount=1
	bApplyParams=false
	WeaponClass=Class'BWBP_OP_Pro.CX85AssaultWeapon'
	ImpactManager=Class'BallisticProV55.IM_MRLRocket'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	ModeIndex=1
	bTearOnExplode=false
	MyRadiusDamageType=Class'BWBP_OP_Pro.DTCX85DartRadius'
	ShakeRadius=512.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Damage=10.0000000
	DamageRadius=384.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTCX85DartRadius'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-SMG.OA-SMG_Dart'
	CullDistance=2500.0000000
	bNetTemporary=false
	Physics=0
	LifeSpan=0.0000000
	DrawScale=0.4500000
	bUnlit=false
	CollisionRadius=2.0000000
	CollisionHeight=2.0000000
	bCollideActors=false
	bCollideWorld=false
	bProjTarget=true
	bNetNotify=true
}
