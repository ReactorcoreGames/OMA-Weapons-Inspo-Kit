class MACTW_PrimaryFire extends MACPrimaryFire;

simulated function LaunchBeacon(optional byte i)
{
	local Vector StartTrace, X, Y, Z, Start, End,
		HitLocation, HitNormal;

	local Rotator Aim;
	local Actor Other;

	Weapon.GetViewAxes(X, Y, Z);
	Start = Instigator.Location + Instigator.EyePosition();
	StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
	// End:0xB6
	if(!Weapon.WeaponCentered())
	{
		StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
	}
	Aim = GetFireAim(StartTrace);
	Aim = Rotator((GetFireSpread()) >> Aim);
	End = Start + (Vector(Aim) * (MaxRange()));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x139
	if(Other != none)
	{
		Aim = Rotator(HitLocation - StartTrace);
	}
	Spawn(Class'BallisticProV55.MACBeacon_Heavy', Weapon,, StartTrace, Aim);
	//return;	
}

simulated function TurretLaunchBeacon()
{
	local Vector StartTrace, X, Y, Z, Start, End,
		HitLocation, HitNormal;

	local Rotator Aim;
	local Actor Other;

	Weapon.GetViewAxes(X, Y, Z);
	Start = (Instigator.Location + Instigator.EyePosition()) + (X * float(55));
	StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
	// End:0xC3
	if(!Weapon.WeaponCentered())
	{
		StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
	}
	Aim = GetFireAim(StartTrace);
	Aim = Rotator((GetFireSpread()) >> Aim);
	End = Start + (Vector(Aim) * (MaxRange()));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x146
	if(Other != none)
	{
		Aim = Rotator(HitLocation - StartTrace);
	}
	Spawn(Class'BallisticProV55.MACBeacon_Heavy', Weapon,, StartTrace, Aim);
	//return;	
}

simulated function ModeDoFire()
{
	super(BallisticProProjectileFire).ModeDoFire();
	// End:0x74
	if((Instigator != none) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Instigator.PlayerReplicationInfo) != none)
	{
		Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Instigator.PlayerReplicationInfo).AddFireStat(int(load), int(BW.InventoryGroup));
	}
	//return;	
}

defaultproperties
{
	FireRecoil=256.0000000
	FireRate=0.8000000
}
