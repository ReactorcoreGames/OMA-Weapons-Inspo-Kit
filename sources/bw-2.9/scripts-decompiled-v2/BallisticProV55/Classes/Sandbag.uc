class Sandbag extends DECO_Smashable;

var Sound DamagedSounds[4];
var Sound DestroyedSound;
var BallisticTurret AttachedWeapon;
var SandbagTrigger SBC;
var SandbagList BagList;

function PostBeginPlay()
{
	local Teleporter Tel;

	// End:0x1C
	foreach RadiusActors(Class'Engine.Teleporter', Tel, 128.0000000)
	{
		Destroy();		
		return;		
	}	
	Class'BallisticProV55.SandbagList'.static.AutoInitBag(self);
	SBC = Spawn(Class'BallisticProV55.SandbagTrigger', self,, Location);
	SBC.Bags = self;
	//return;	
}

function Reset()
{
	Destroy();
	//return;	
}

function BreakApart(Vector HitLocation, Vector Momentum)
{
	Destroy();
	//return;	
}

simulated function Destroyed()
{
	// End:0x52
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && EffectWhenDestroyed != none) && EffectIsRelevant(Location, false))
	{
		Spawn(EffectWhenDestroyed, Owner,, Location);
		PlaySound(DestroyedSound);
	}
	// End:0x8D
	if(AttachedWeapon != none)
	{
		// End:0x81
		if(AttachedWeapon.Driver != none)
		{
			AttachedWeapon.KDriverLeave(true);
		}
		AttachedWeapon.Destroy();
	}
	// End:0xBA
	if((int(Role) == int(ROLE_Authority)) && BagList != none)
	{
		BagList.RemoveBag(self);
	}
	SBC.RemoveCoverAnchors();
	SBC.Destroy();
	super(Decoration).Destroyed();
	//return;	
}

function TakeBag(Pawn User)
{
	local Ammunition Ammo;
	local Weapon newWeapon;
	local int AmmoAmount;

	// End:0x0D
	if(AttachedWeapon != none)
	{
		return;
	}
	Ammo = Ammunition(User.FindInventoryType(Class'BallisticProV55.Ammo_Sandbags'));
	// End:0x82
	if(Ammo == none)
	{
		Ammo = Spawn(Class'BallisticProV55.Ammo_Sandbags');
		User.AddInventory(Ammo);
		AmmoAmount = Ammo.AmmoAmount;
		Ammo.UseAmmo(9999, true);
	}
	// End:0xEF
	if(User.FindInventoryType(Class'BallisticProV55.SandbagLayer') == none)
	{
		newWeapon = Spawn(Class'BallisticProV55.SandbagLayer',,, User.Location);
		// End:0xEF
		if(newWeapon != none)
		{
			newWeapon.GiveTo(User);
			newWeapon.ConsumeAmmo(0, 9999.0000000, true);
		}
	}
	Ammo.AddAmmo(1);
	Ammo.GotoState('None');
	Destroy();
	//return;	
}

auto state Working
{
	function BeginState()
	{
		super(Object).BeginState();
		SetCollision(true, true, true);
		NetUpdateTime = Level.TimeSeconds - float(1);
		bHidden = false;
		Health = default.Health;
		//return;		
	}

	function EndState()
	{
		super(Object).EndState();
		NetUpdateTime = Level.TimeSeconds - float(1);
		bHidden = true;
		SetCollision(false, false, false);
		//return;		
	}

	function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
	{
		PlaySound(DamagedSounds[Rand(4)]);
		// End:0x53
		if((Class<BallisticDamageType>(DamageType) != none) && Class<BallisticDamageType>(DamageType).default.DamageIdent != "Melee")
		{
			Damage *= DamageType.default.VehicleDamageScaling;
		}
		Health -= Damage;
		// End:0x6D
		if(Health < 1)
		{
			Destroy();
		}
		//return;		
	}

	function Bump(Actor Other)
	{
		// End:0x2B
		if((Mover(Other) != none) && Mover(Other).bResetting)
		{
			return;
		}
		// End:0x48
		if((UnrealPawn(Other) != none) && bImperviusToPlayer)
		{
			return;
		}
		// End:0x67
		if(VSize(Other.Velocity) > float(500))
		{
			Destroy();
		}
		//return;		
	}

	function bool EncroachingOn(Actor Other)
	{
		// End:0x2B
		if((Mover(Other) != none) && Mover(Other).bResetting)
		{
			return false;
		}
		// End:0x3D
		if(BallisticTurret(Other) != none)
		{
			return false;
		}
		Destroy();
		return false;
		//return;		
	}

	event EncroachedBy(Actor Other)
	{
		// End:0x2B
		if((Mover(Other) != none) && Mover(Other).bResetting)
		{
			return;
		}
		// End:0x3D
		if(BallisticTurret(Other) != none)
		{
			return;
		}
		Destroy();
		//return;		
	}
	stop;	
}

defaultproperties
{
	DamagedSounds[0]=Sound'BW_Core_WeaponSound.BulletImpacts.BulletDirt1'
	DamagedSounds[1]=Sound'BW_Core_WeaponSound.BulletImpacts.BulletDirt2'
	DamagedSounds[2]=Sound'BW_Core_WeaponSound.BulletImpacts.BulletDirt3'
	DamagedSounds[3]=Sound'BW_Core_WeaponSound.BulletImpacts.BulletDirt4'
	DestroyedSound=Sound'BW_Core_WeaponSound.BOGP.BOGP_FlareImpact'
	EffectWhenDestroyed=Class'BallisticProV55.IE_SandbagExplosion'
	Health=250
	DrawType=8
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Sandbags.UTSandbags'
	CullDistance=0.0000000
	bWorldGeometry=true
	bAlwaysRelevant=true
	DrawScale=0.7000000
	bGameRelevant=true
	SoundVolume=150
	TransientSoundVolume=0.4000000
	TransientSoundRadius=128.0000000
	CollisionRadius=35.0000000
	CollisionHeight=21.0000000
	bBlockPlayers=true
	bBlockProjectiles=true
	bProjTarget=true
	bUseCylinderCollision=false
}
