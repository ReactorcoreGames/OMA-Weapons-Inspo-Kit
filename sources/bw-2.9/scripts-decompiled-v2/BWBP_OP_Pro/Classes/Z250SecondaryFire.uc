class Z250SecondaryFire extends BallisticProjectileFire;

var bool bLoaded;

simulated event ModeHoldFire()
{
	super(WeaponFire).ModeHoldFire();
	CheckGrenade();
	//return;	
}

simulated function bool CheckGrenade()
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0x6B
	if(!bLoaded)
	{
		Weapon.GetAnimParams(Channel, seq, frame, Rate);
		// End:0x4D
		if(seq == Z250Minigun(Weapon).GrenadeLoadAnim)
		{
			return false;
		}
		Z250Minigun(Weapon).LoadGrenade();
		bIsFiring = false;
		return false;
	}
	return true;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x1A
	if(!CheckGrenade())
	{
		return;
	}
	super(BallisticFire).ModeDoFire();
	bLoaded = false;
	PreFireTime = 0.0000000;
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	proj = Spawn(ProjectileClass,,, Start, Dir);
	// End:0x68
	if(Z250Grenade(proj) != none)
	{
		proj.Instigator = Instigator;
		Z250Grenade(proj).FireControl = Z250Minigun(Weapon).FireControl;
	}
	//return;	
}

function StopFiring()
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	Weapon.GetAnimParams(Channel, seq, frame, Rate);
	// End:0x56
	if(seq == PreFireAnim)
	{
		Weapon.PlayAnim(Weapon.IdleAnim, 1.0000000, 0.5000000);
	}
	//return;	
}

defaultproperties
{
	bLoaded=true
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	FlashBone="GLtip"
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BWBP_OP_Pro.Z250GrenadeFlashEmitter'
	BallisticFireSound=(Sound=Sound'BWBP_OP_Sounds.Z250.Z250-GrenadeFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	PreFireAnim="None"
	FireAnim="GLFire"
	FireForce="AssaultRifleAltFire"
	FireRate=0.8000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_Z250GasGrenades'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_OP_Pro.Z250Grenade'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
