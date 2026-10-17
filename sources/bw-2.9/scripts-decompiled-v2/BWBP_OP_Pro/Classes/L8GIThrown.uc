class L8GIThrown extends BallisticGrenade;

var() int HealingAmount;
var() bool bSuperHeal;
var() Sound HealSound;
var IP_L8GIAmmoPack AmmoPack1;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		AmmoPack1, SpawnPack;
}

simulated event Timer()
{
	local xPawn HitPawn;

	// End:0x45
	if(StartDelay > float(0))
	{
		StartDelay = 0.0000000;
		bHidden = false;
		SetPhysics(default.Physics);
		SetCollision(default.bCollideActors, default.bBlockActors, default.bBlockPlayers);
		InitProjectile();
		return;
	}
	// End:0xD9
	if(HitActor != none)
	{
		HitPawn = xPawn(HitActor);
		// End:0x95
		if((Instigator == none) || Instigator.Controller == none)
		{
			HitPawn.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(HitActor, Damage, Instigator, Location, MomentumTransfer * (HitActor.Location - Location), MyDamageType);
	}
	Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	//return;	
}

function SpawnPack()
{
	// End:0x7A
	if(AmmoPack1 == none)
	{
		AmmoPack1 = Spawn(Class'BWBP_OP_Pro.IP_L8GIAmmoPack',,, self.Location, self.Rotation);
		AmmoPack1.SetPhysics(2);
		// End:0x55
		if(AmmoPack1 != none)
		{
			AmmoPack1.SetBase(self);
		}
		AmmoPack1.bDropped = true;
		AmmoPack1.LifeSpan = 32.0000000;
	}
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor Wall)
{
	SpawnPack();
	super.HitWall(HitNormal, Wall);
	Destroy();
	//return;	
}

simulated event ProcessTouch(Actor Other, Vector HitLocation)
{
	local float boneDist;
	local xPawn HitPawn;

	// End:0x1E
	if((Other == Instigator) && !bCanHitOwner)
	{
		return;
	}
	// End:0x2B
	if(Base != none)
	{
		return;
	}
	HitPawn = xPawn(Other);
	// End:0x70
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0xF9
	if((int(PlayerImpactType) == int(1)) || int(DetonateOn) == int(1))
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, MomentumTransfer * Normal(Velocity), ImpactDamageType);
		HitActor = Other;
		Explode(HitLocation, Normal(HitLocation - Other.Location));
		return;
	}
	// End:0x1E8
	if((int(PlayerImpactType) == int(0)) || (int(PlayerImpactType) == int(2)) && VSize(Velocity) < MinStickVelocity)
	{
		HitWall(Normal(HitLocation - Other.Location), Other);
		// End:0x1B6
		if((Instigator.GetTeamNum() == HitPawn.GetTeamNum()) && Level.Game.bTeamGame)
		{
			GiveAmmo(HitPawn);
			// End:0x1B0
			if(HealSound != none)
			{
				PlaySound(HealSound, 3);
			}
			Destroy();			
		}
		else
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, Velocity, ImpactDamageType);
		}		
	}
	else
	{
		// End:0x2DD
		if((int(PlayerImpactType) == int(2)) && Base == none)
		{
			SetPhysics(0);
			// End:0x223
			if(int(DetonateOn) == int(2))
			{
				SetTimer(DetonateDelay, false);
			}
			HitActor = Other;
			// End:0x289
			if((Other != Instigator) && int(Other.DrawType) == int(2))
			{
				Other.AttachToBone(self, Other.GetClosestBone(Location, Velocity, boneDist));				
			}
			else
			{
				SetBase(Other);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, Velocity, ImpactDamageType);
			SetRotation(Rotator(Velocity));
			Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		}
	}
	// End:0x366
	if((int(PlayerImpactType) == int(1)) || int(DetonateOn) == int(1))
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, MomentumTransfer * Normal(Velocity), ImpactDamageType);
		HitActor = Other;
		Explode(HitLocation, Normal(HitLocation - Other.Location));
		return;
	}
	//return;	
}

function GiveAmmo(Actor Other)
{
	local Inventory Inv, GW;
	local int Count;
	local Weapon W;
	local bool bGetIt;
	local Ammunition A;

	// End:0x36
	if(Pawn(Other).GiveHealth(5, int(Pawn(Other).HealthMax)))
	{
		bGetIt = true;
	}
	Inv = Pawn(Other).Inventory;
	J0x4F:

	// End:0x104 [Loop If]
	if((Inv != none) && Count < 1000)
	{
		// End:0xFA
		if(!Inv.IsA('L8GIAmmoPack'))
		{
			// End:0xE6
			if((BCGhostWeapon(Inv) != none) && BCGhostWeapon(Inv).MyWeaponClass != Class'BWBP_OP_Pro.L8GIAmmoPack')
			{
				GW = Inv;
				Inv = Inv.Inventory;
				BCGhostWeapon(GW).ReviveWeapon();
				// [Explicit Continue]
				goto J0xFA;
			}
			Inv = Inv.Inventory;
		}
		J0xFA:

		Count++;
		// [Loop Continue]
		goto J0x4F;
	}
	Count = 0;
	Inv = Pawn(Other).Inventory;
	J0x124:

	// End:0x302 [Loop If]
	if((Inv != none) && Count < 1000)
	{
		A = Ammunition(Inv);
		// End:0x1BC
		if((A != none) && !A.IsA('Ammo_L8GI'))
		{
			// End:0x1B9
			if(A.AmmoAmount < A.MaxAmmo)
			{
				A.AddAmmo(A.InitialAmount);
				bGetIt = true;
			}			
		}
		else
		{
			W = Weapon(Inv);
			// End:0x2E4
			if((W != none) && !W.IsA('L8GIAmmoPack'))
			{
				// End:0x2E4
				if(W.bNoAmmoInstances)
				{
					// End:0x25F
					if(!W.AmmoMaxed(0) && W.GetAmmoClass(0) != none)
					{
						W.AddAmmo(W.static.GetAmmoClass(0).default.InitialAmount, 0);
						bGetIt = true;
					}
					// End:0x2E4
					if(((W.GetAmmoClass(1) != none) && W.GetAmmoClass(1) != W.GetAmmoClass(0)) && !W.AmmoMaxed(1))
					{
						bGetIt = true;
						W.AddAmmo(W.static.GetAmmoClass(1).default.InitialAmount, 1);
					}
				}
			}
		}
		Count++;
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x124;
	}
	//return;	
}

function int GetHealMax(Pawn P)
{
	// End:0x1A
	if(bSuperHeal)
	{
		return int(P.SuperHealthMax);
	}
	return int(P.HealthMax);
	//return;	
}

defaultproperties
{
	HealingAmount=5
	HealSound=Sound'BW_Core_WeaponSound.Ammo.AmmoPackPickup'
	RandomSpin=1024.0000000
	bNoInitialSpin=true
	ImpactDamage=10
	ImpactDamageType=Class'BWBP_OP_Pro.DTAmmoPack'
	WeaponClass=Class'BWBP_OP_Pro.L8GIAmmoPack'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailOffset=(X=1.6000000,Y=0.0000000,Z=6.4000000)
	Speed=600.0000000
	MaxSpeed=600.0000000
	Damage=0.0000000
	DamageRadius=250.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTAmmoPack'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Concrete'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Ammo.AmmoPackHi'
	DrawScale=0.3500000
	CollisionRadius=16.0000000
	CollisionHeight=15.0000000
	RotationRate=(Pitch=0,Yaw=0,Roll=0)
}
