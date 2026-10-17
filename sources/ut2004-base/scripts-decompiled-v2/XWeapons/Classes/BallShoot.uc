class BallShoot extends ProjectileFire;

simulated function bool AllowFire()
{
	return true;
	//return;	
}

function ModeDoFire()
{
	local xBombFlag Bomb;
	local Translauncher t;

	Bomb = xBombFlag(Instigator.PlayerReplicationInfo.HasFlag);
	// End:0x6D
	if(Bomb.bBallDrainsTransloc)
	{
		t = Translauncher(Instigator.FindInventoryType(Class'XWeapons.Translauncher'));
		// End:0x6D
		if(t != none)
		{
			t.DrainCharges();
		}
	}
	super(WeaponFire).ModeDoFire();
	// End:0xED
	if(((PlayerController(Instigator.Controller) != none) && Instigator.IsLocallyControlled()) && (Instigator.PendingWeapon == Weapon) || Instigator.PendingWeapon == none)
	{
		PlayerController(Instigator.Controller).ClientSwitchToBestWeapon();
	}
	//return;	
}

function DoFireEffect()
{
	local xBombFlag Bomb;

	// End:0x1B
	if(int(Weapon.Role) != int(ROLE_Authority))
	{
		return;
	}
	// End:0x3A
	if(Instigator.PlayerReplicationInfo.HasFlag == none)
	{
		return;
	}
	Bomb = xBombFlag(Instigator.PlayerReplicationInfo.HasFlag);
	// End:0x69
	if(Bomb == none)
	{
		return;
	}
	BallLauncher(Weapon).launchedBall = true;
	super.DoFireEffect();
	//return;	
}

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local xBombFlag Bomb;
	local Vector ThrowDir;

	Bomb = xBombFlag(Weapon.Instigator.Controller.PlayerReplicationInfo.HasFlag);
	Bomb.PassTarget = BallLauncher(Weapon).PassTarget;
	ThrowDir = Bomb.ThrowSpeed * Vector(Dir);
	Bomb.Throw(Start, ThrowDir);
	BallLauncher(Weapon).PassTarget = none;
	return none;
	//return;	
}

defaultproperties
{
	bWaitForRelease=true
	bModeExclusive=false
	FireSound=Sound'WeaponSounds.Misc.ballgun_launch'
	FireForce="ballgun_launch"
	FireRate=0.2500000
	AmmoClass=Class'XWeapons.BallAmmo'
}
