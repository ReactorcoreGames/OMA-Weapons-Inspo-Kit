class BX5SpringMine extends BallisticProjectile;

var bool bDetonated;
var BX5SpringProj proj;
var BX5SpringTrigger MyUseTrigger;
var int Health;
var float TriggerStartTime;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		proj;
}

simulated function InitProjectile()
{
	local Actor TA;
	local Teleporter TB;

	super.InitProjectile();
	// End:0x74
	if(int(Role) == int(ROLE_Authority))
	{
		MyUseTrigger = Spawn(Class'BallisticProV55.BX5SpringTrigger', self,, Location);
		proj = Spawn(Class'BallisticProV55.BX5SpringProj', self,, Location, Rotation);
		TriggerStartTime = Level.TimeSeconds + 3.0000000;
		proj.Instigator = Instigator;
	}
	// End:0xEF
	if(proj != none)
	{
		// End:0xC3
		foreach TouchingActors(Class'Engine.Actor', TA)
		{
			// End:0xC2
			if((xPickUpBase(TA) != none) || Pickup(TA) != none)
			{
				proj.bAntiLameMode = true;
			}			
		}		
		// End:0xEE
		foreach VisibleActors(Class'Engine.Teleporter', TB, 256.0000000)
		{
			proj.bAntiLameMode = true;			
			return;			
		}		
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(MyUseTrigger != none)
	{
		MyUseTrigger.Destroy();
	}
	// End:0x3B
	if(!bDetonated && proj != none)
	{
		proj.Destroy();
	}
	super.Destroyed();
	//return;	
}

function SteppedOn(Actor Other)
{
	// End:0x2C
	if(((Pawn(Other) == none) || StartDelay > float(0)) || bDetonated)
	{
		return;
	}
	// End:0x7F
	if(((InstigatorController != none) && Pawn(Other).Controller != InstigatorController) && InstigatorController.SameTeamAs(Pawn(Other).Controller))
	{
		return;
	}
	// End:0xAC
	if((Vehicle(Other) != none) && VSize(Other.Velocity) < float(50))
	{
		return;
	}
	// End:0xE2
	if((Pawn(Other).Health < 1) && VSize(Other.Velocity) < float(200))
	{
		return;
	}
	// End:0x10B
	if((Level.TimeSeconds < TriggerStartTime) || TriggerStartTime == float(0))
	{
		return;
	}
	// End:0x125
	if(VSize(Other.Velocity) == float(0))
	{
		return;
	}
	// End:0x19A
	if((VSize(Other.Velocity) <= float(170)) && (Pawn(Other).Controller == InstigatorController) || (Vector(Pawn(Other).GetViewRotation()) Dot Normal(Location - Other.Location)) > 0.2000000)
	{
		return;
	}
	bDetonated = true;
	SetTimer(0.0500000, false);
	bTearOff = true;
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
		// End:0x4C
		if(proj != none)
		{
			PlaySound(Sound'BW_Core_WeaponSound.BX5.BX5-Jump',, 1.0000000,, 64.0000000);
			proj.SpringOff();
			GotoState('FadeOut');
		}
	}
	//return;	
}

simulated event TornOff()
{
	// End:0x0D
	if(proj == none)
	{
		return;
	}
	PlaySound(Sound'BW_Core_WeaponSound.BX5.BX5-Jump',, 1.0000000,, 64.0000000);
	proj.SpringOff();
	GotoState('FadeOut');
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
	// End:0x47
	if(bDetonated)
	{
		return;
	}
	Health -= Damage;
	// End:0x60
	if(Health > 0)
	{
		return;
	}
	bDetonated = true;
	// End:0xC7
	if((!proj.bAntiLameMode && EventInstigator != none) && proj != none)
	{
		proj.Instigator = EventInstigator;
		proj.InstigatorController = EventInstigator.Controller;
	}
	SetTimer(0.0500000 + (0.2000000 * FRand()), false);
	bTearOff = true;
	//return;	
}

function TryUse(Pawn User)
{
	local Ammunition Ammo;
	local Weapon newWeapon;
	local int AmmoAmount;

	// End:0x0B
	if(bDetonated)
	{
		return;
	}
	Ammo = Ammunition(User.FindInventoryType(Class'BallisticProV55.Ammo_BX5Mines'));
	// End:0x57
	if(Ammo == none)
	{
		Ammo = Spawn(Class'BallisticProV55.Ammo_BX5Mines');
		User.AddInventory(Ammo);
	}
	AmmoAmount = Ammo.AmmoAmount;
	Ammo.UseAmmo(9999, true);
	// End:0xED
	if(User.FindInventoryType(Class'BallisticProV55.BX5Mine') == none)
	{
		newWeapon = Spawn(Class'BallisticProV55.BX5Mine',,, User.Location);
		// End:0xED
		if(newWeapon != none)
		{
			newWeapon.GiveTo(User);
			newWeapon.ConsumeAmmo(0, 9999.0000000, true);
		}
	}
	Ammo.AddAmmo(AmmoAmount + 1);
	Ammo.GotoState('None');
	Destroy();
	//return;	
}

simulated state FadeOut
{
	simulated function Tick(float DeltaTime)
	{
		SetDrawScale(FMax(0.0100000, DrawScale - (default.DrawScale * DeltaTime)));
		//return;		
	}

	simulated function BeginState()
	{
		LifeSpan = 1.0000000;
		//return;		
	}

	function EndState()
	{
		SetDrawScale(default.DrawScale);
		//return;		
	}
	stop;	
}

defaultproperties
{
	Health=30
	WeaponClass=Class'BallisticProV55.BX5Mine'
	StartDelay=0.3000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.BX5.MineSBase2'
	CullDistance=2500.0000000
	bNetTemporary=false
	Physics=0
	LifeSpan=0.0000000
	DrawScale=0.2000000
	bUnlit=false
	CollisionRadius=32.0000000
	CollisionHeight=16.0000000
	bCollideWorld=false
	bProjTarget=true
	bNetNotify=true
}
