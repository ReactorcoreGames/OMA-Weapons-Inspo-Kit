class PKMSecondaryFire extends BallisticProjectileFire;

var bool bLoaded;

simulated function bool CheckKnife()
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0x6B
	if(!bLoaded)
	{
		Weapon.GetAnimParams(Channel, seq, frame, Rate);
		// End:0x4D
		if(seq == PKMMachinegun(Weapon).KnifeLoadAnim)
		{
			return false;
		}
		PKMMachinegun(Weapon).LoadKnife();
		bIsFiring = false;
		return false;
	}
	return true;
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	// End:0x1A
	if(!CheckWeaponMode())
	{
		return false;
	}
	// End:0xAC
	if(!super(BallisticFire).AllowFire() || !bLoaded)
	{
		// End:0x99
		if(DryFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
		}
		BW.EmptyFire(1);
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
	if(!CheckKnife())
	{
		return;
	}
	super(BallisticFire).ModeDoFire();
	PreFireTime = 0.0000000;
	PKMMachinegun(Weapon).BladeOut();
	bLoaded = false;
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
	SpawnOffset=(X=12.0000000,Y=10.0000000,Z=-15.0000000)
	bUseWeaponMag=false
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-KnifeFire',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bTossed=true
	bFireOnRelease=true
	bWaitForRelease=true
	PreFireTime=0.4500000
	PreFireAnim="KnifeFirePrep"
	FireAnim="KnifeFire"
	FireForce="AssaultRifleAltFire"
	FireRate=0.6500000
	AmmoClass=Class'BallisticProV55.Ammo_XMK5Darts'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_APC_Pro.PKMKnife'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
