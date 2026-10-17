class X3Projectile extends BallisticProjectile;

var bool bStuckInWall;
var bool bHitPlayer;

simulated function InitParams()
{
	WeaponClass.default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].OverrideProjectileParams(self, 1);
	//return;	
}

simulated function InitProjectile()
{
	SetTimer(0.1000000, false);
	super.InitProjectile();
	//return;	
}

simulated event Timer()
{
	super.Timer();
	bFixedRotationDir = true;
	RotationRate.Pitch = -100000;
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	// End:0x0B
	if(bHitPlayer)
	{
		return false;
	}
	return super.CanTouch(Other);
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x0D
	if(Other == none)
	{
		return;
	}
	// End:0x38
	if(bStuckInWall)
	{
		// End:0x36
		if(Pawn(Other) != none)
		{
			TakeBack(Pawn(Other));
		}
		return;
	}
	// End:0x4A
	if(!CanTouch(Other))
	{
		return;
	}
	// End:0x6A
	if(int(Role) == int(ROLE_Authority))
	{
		DoDamage(Other, HitLocation);
	}
	bHitPlayer = true;
	SetLocation(HitLocation);
	Velocity = Normal(HitLocation - Other.Location) * float(100);
	//return;	
}

function TakeBack(Pawn Other)
{
	local Ammunition Ammo;
	local Weapon newWeapon;
	local int AmmoAmount;

	// End:0x23
	if(!bStuckInWall || !Other.bCanPickupInventory)
	{
		return;
	}
	Ammo = Ammunition(Other.FindInventoryType(Class'BallisticProV55.Ammo_X3Knife'));
	// End:0x6F
	if(Ammo == none)
	{
		Ammo = Spawn(Class'BallisticProV55.Ammo_X3Knife');
		Other.AddInventory(Ammo);
	}
	AmmoAmount = Ammo.AmmoAmount;
	Ammo.UseAmmo(9999, true);
	// End:0x105
	if(Other.FindInventoryType(Class'BallisticProV55.X3Knife') == none)
	{
		newWeapon = Spawn(Class'BallisticProV55.X3Knife',,, Other.Location);
		// End:0x105
		if(newWeapon != none)
		{
			newWeapon.GiveTo(Other);
			newWeapon.ConsumeAmmo(0, 9999.0000000, true);
		}
	}
	Ammo.AddAmmo(AmmoAmount + 1);
	Ammo.GotoState('None');
	// End:0x170
	if(PlayerController(Other.Controller) != none)
	{
		PlayerController(Other.Controller).ClientPlaySound(Class'BallisticProV55.X3Pickup'.default.PickupSound);
	}
	Destroy();
	//return;	
}

simulated event Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

singular simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local int Surf;

	// End:0x0B
	if(bStuckInWall)
	{
		return;
	}
	// End:0x9A
	if(((Wall != none) && !Wall.bWorldGeometry) && !Wall.bStatic)
	{
		// End:0x6F
		if((int(Role) == int(ROLE_Authority)) && !bHitPlayer)
		{
			DoDamage(Wall, Location);
		}
		// End:0x9A
		if(Mover(Wall) == none)
		{
			bHitPlayer = true;
			Velocity = HitNormal * float(100);
			return;
		}
	}
	SetRotation(Rotator(Velocity));
	OnlyAffectPawns(true);
	SetCollisionSize(40.0000000, 40.0000000);
	SetPhysics(0);
	bFixedRotationDir = false;
	bStuckInWall = true;
	bHardAttach = true;
	CheckSurface(Location, HitNormal, Surf, Wall);
	LifeSpan = 20.0000000;
	// End:0x10D
	if(Wall != none)
	{
		SetBase(Wall);
	}
	// End:0x163
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && ImpactManager != none) && EffectIsRelevant(Location, false))
	{
		ImpactManager.static.StartSpawn(Location, HitNormal, Surf, self);
	}
	//return;	
}

function UsedBy(Pawn User)
{
	TakeBack(User);
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.X3Knife'
	ImpactManager=Class'BallisticProV55.IM_KnifeThrown'
	bRandomStartRotation=false
	ModeIndex=1
	DamageTypeHead=Class'BallisticProV55.DTX3KnifeThrownHead'
	bUsePositionalDamage=true
	bWarnEnemy=false
	Speed=3000.0000000
	Damage=40.0000000
	MyDamageType=Class'BallisticProV55.DTX3KnifeThrown'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.X3.X3PickupHi'
	bNetTemporary=false
	Physics=2
	LifeSpan=0.0000000
	DrawScale=0.1500000
	bUnlit=false
}
