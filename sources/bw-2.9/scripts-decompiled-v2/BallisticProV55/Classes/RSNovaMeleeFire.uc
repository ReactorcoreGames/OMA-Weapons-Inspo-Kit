class RSNovaMeleeFire extends BallisticMeleeFire;

var() Pawn HookedVictim;
var() float HookTime;

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

event ModeTick(float dt)
{
	local Vector ForceDir;

	super(BallisticFire).ModeTick(dt);
	// End:0x14C
	if(((int(Weapon.Role) == int(ROLE_Authority)) && HookedVictim != none) && (Vector(Instigator.GetViewRotation()) Dot Normal(HookedVictim.Location - Instigator.Location)) > 0.8000000)
	{
		ForceDir = (Instigator.Location + (Vector(Instigator.GetViewRotation()) * float(192))) - HookedVictim.Location;
		// End:0xD6
		if(int(Instigator.Physics) == int(2))
		{
			ForceDir.Z = 0.0000000;
		}
		ForceDir *= float(400);
		HookedVictim.AddVelocity((HookedVictim.Velocity * -0.7000000) + ((ForceDir / HookedVictim.Mass) * dt));
		// End:0x14C
		if((Level.TimeSeconds - HookTime) > 0.5000000)
		{
			HookedVictim = none;
		}
	}
	//return;	
}

function float ResolveDamageFactors(Actor Other, Vector TraceStart, Vector HitLocation, int PenetrateCount, int WallCount, int WallPenForce, Vector WaterHitLocation)
{
	local float DamageFactor;

	DamageFactor = 1.0000000;
	// End:0x2E
	if(RSNovaStaff(Weapon).bOnRampage)
	{
		DamageFactor *= 2.0000000;
	}
	DamageFactor *= super.ResolveDamageFactors(Other, TraceStart, HitLocation, PenetrateCount, WallCount, WallPenForce, WaterHitLocation);
	return DamageFactor;
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	local bool bWasAlive;

	// End:0x62
	if((xPawn(Victim) != none) && Pawn(Victim).Health > 0)
	{
		// End:0x62
		if((Monster(Victim) == none) || Pawn(Victim).default.Health > 275)
		{
			bWasAlive = true;
		}
	}
	// End:0x1AF
	if(((((BallisticPawn(Instigator) != none) && RSNovaStaff(Instigator.Weapon) != none) && Victim.bProjTarget) && xPawn(Victim) != none) && (Pawn(Victim).GetTeamNum() != Instigator.GetTeamNum()) || Instigator.GetTeamNum() == 255)
	{
		BallisticPawn(Instigator).GiveAttributedHealth(Damage / 3, int(Instigator.SuperHealthMax), Instigator, true);
		// End:0x1AF
		if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
		{
			// End:0x196
			if(BW.MagAmmo < BW.default.MagAmmo)
			{
				BW.MagAmmo = Min(BW.default.MagAmmo, BW.MagAmmo + (Damage / 3));				
			}
			else
			{
				BW.AddAmmo(Damage / 3, 0);
			}
		}
	}
	super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x21F
	if(bWasAlive && Pawn(Victim).Health <= 0)
	{
		Class'BallisticProV55.RSNovaSoul'.static.SpawnSoul(HitLocation, Instigator, Pawn(Victim), Weapon);
	}
	// End:0x26E
	if((Pawn(Victim) != none) && Pawn(Victim).Health > 0)
	{
		HookedVictim = Pawn(Victim);
		HookTime = Level.TimeSeconds;
	}
	//return;	
}

defaultproperties
{
	SwipePoints[0]=(Weight=3,offset=(Pitch=1000,Yaw=1000,Roll=0))
	SwipePoints[1]=(Weight=2,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[2]=(Weight=1,offset=(Pitch=-1000,Yaw=-1000,Roll=0))
	SwipePoints[3]=(Weight=4,offset=(Pitch=0,Yaw=-1280,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=0,Yaw=-2560,Roll=0))
	WallHitPoint=1
	NumSwipePoints=3
	DamageType=Class'BallisticProV55.DT_RSNovaStab'
	DamageTypeHead=Class'BallisticProV55.DT_RSNovaStabHead'
	DamageTypeArm=Class'BallisticProV55.DT_RSNovaStab'
	KickForce=100
	HookStopFactor=1.7000000
	HookPullForce=150.0000000
	bIgnoreReload=true
	bUseWeaponMag=false
	ScopeDownOn=2
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.NovaStaff.Nova-Melee',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="PrepSwipe"
	FireAnim="Swipe"
	AmmoClass=Class'BallisticProV55.Ammo_NovaCrystal'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=384.0000000,Z=0.0000000)
	ShakeRotRate=(X=3500.0000000,Y=3500.0000000,Z=3500.0000000)
	ShakeRotTime=2.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
}
