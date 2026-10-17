class XMV500TW_PrimaryFire extends XMV500MinigunPrimaryFire;

simulated event ModeDoFire()
{
	// End:0x3A
	if(!AllowFire() || XMV500Minigun_TW(BW).BarrelSpeed < XMV500Minigun_TW(BW).DesiredSpeed)
	{
		return;
	}
	BW.bPreventReload = true;
	BW.FireCount++;
	// End:0x85
	if(int(BW.ReloadState) != int(0))
	{
		BW.ReloadState = 0;
	}
	// End:0x180
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0xC7
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x103
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
		// End:0x180
		if((Instigator != none) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Instigator.PlayerReplicationInfo) != none)
		{
			Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Instigator.PlayerReplicationInfo).AddFireStat(int(load), int(BW.InventoryGroup));
		}
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x1CA
	if(Instigator.IsLocallyControlled())
	{
		ShakeView();
		PlayFiring();
		FlashMuzzleFlash();
		StartMuzzleSmoke();		
	}
	else
	{
		ServerPlayFiring();
	}
	NextFireTime += FireRate;
	NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
	load = float(AmmoPerFire);
	HoldTime = 0.0000000;
	// End:0x254
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
	//return;	
}

defaultproperties
{
	DamageType=Class'BallisticProV55.DTXMV850MGDeploy'
	DamageTypeHead=Class'BallisticProV55.DTXMV850MGDeployHead'
	DamageTypeArm=Class'BallisticProV55.DTXMV850MGDeploy'
	FireRecoil=20.0000000
	FireChaos=0.0800000
	aimerror=0.0000000
}
