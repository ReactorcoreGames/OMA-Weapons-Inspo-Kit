class AK490MeleeFire extends BallisticMeleeFire;

simulated function SwitchBladeMode(bool bLoaded)
{
	// End:0x69
	if(bLoaded)
	{
		BallisticFireSound.Sound = SoundGroup'BW_Core_WeaponSound.A73.A73Stab';
		PreFireAnim = 'PrepPokies';
		FireAnim = 'Pokies';
		FireAnimRate = 0.9000000;
		Damage = default.Damage;
		DamageType = Class'BWBP_SKC_Pro.DT_AK490Slash';
		DamageTypeHead = Class'BWBP_SKC_Pro.DT_AK490SlashHead';
		DamageTypeArm = Class'BWBP_SKC_Pro.DT_AK490Slash';		
	}
	else
	{
		BallisticFireSound.Sound = default.BallisticFireSound.Sound;
		PreFireAnim = 'PrepBash';
		FireAnim = 'Bash';
		FireAnimRate = default.FireAnimRate;
		Damage *= 0.8000000;
		DamageType = default.DamageType;
		DamageTypeHead = default.DamageTypeHead;
		DamageTypeArm = default.DamageTypeArm;
	}
	// End:0xEA
	if(Weapon.bBerserk)
	{
		FireRate *= 0.7500000;
	}
	// End:0x129
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		FireRate /= Level.GRI.WeaponBerserk;
	}
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

simulated event ModeDoFire()
{
	super.ModeDoFire();
	BW.GunLength = BW.default.GunLength;
	//return;	
}

simulated event ModeHoldFire()
{
	super.ModeHoldFire();
	BW.GunLength = 1.0000000;
	//return;	
}

defaultproperties
{
	DamageType=Class'BWBP_SKC_Pro.DT_AK490Hit'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK490HitHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK490Hit'
	KickForce=100
	bIgnoreReload=true
	bUseWeaponMag=false
	ScopeDownOn=2
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.Marlin.Mar-Melee',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="PrepBash"
	FireAnim="Bash"
	PreFireAnimRate=2.0000000
	FireAnimRate=1.3000000
	TweenTime=0.0000000
	FireRate=0.6500000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_X8Knife'
	AmmoPerFire=0
	ShakeRotTime=1.0000000
	ShakeOffsetMag=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.0500000
}
