class HVPCMk66SecondaryFire extends BallisticProProjectileFire;

simulated function bool AllowFire()
{
	// End:0x45
	if(((HVPCMk66PlasmaCannon(Weapon).HeatLevel >= 10.5000000) || HVPCMk66PlasmaCannon(Weapon).bIsVenting) || !super(BallisticFire).AllowFire())
	{
		return false;
	}
	return true;
	//return;	
}

function PlayFiring()
{
	HVPCMk66PlasmaCannon(BW).AddHeat(0.2500000);
	// End:0x49
	if(((Instigator == none) || Weapon == none) || Instigator.Health < 1)
	{
		return;
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

function DoFireEffect()
{
	local Vector StartTrace, X, Y, Z, Start, End,
		HitLocation, HitNormal;

	local Rotator Aim;
	local Actor Other;
	local int SpawnCount;

	// End:0x32
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		HVPCMk66PlasmaCannon(BW).AddHeat(0.2500000);
	}
	// End:0x62
	if(((Instigator == none) || Weapon == none) || Instigator.Health < 1)
	{
		return;
	}
	Weapon.GetViewAxes(X, Y, Z);
	Start = Instigator.Location + Instigator.EyePosition();
	StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
	// End:0x118
	if(!Weapon.WeaponCentered())
	{
		StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
	}
	Other = Weapon.Trace(HitLocation, HitNormal, StartTrace, Start, false);
	// End:0x155
	if(Other != none)
	{
		StartTrace = HitLocation;
	}
	SpawnCount = 1;
	Aim = GetFireAim(StartTrace);
	Aim = Rotator((GetFireSpread()) >> Aim);
	End = Start + (Vector(Aim) * (MaxRange()));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x1DF
	if(Other != none)
	{
		Aim = Rotator(HitLocation - StartTrace);
	}
	SpawnProjectile(StartTrace, Aim);
	// End:0x289
	if((InStr(Level.Game.GameName, "Freon") != -1) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
	{
		Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(int(load), 1);
	}
	SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BallisticProV55.RSNovaFastMuzzleFlash'
	FireRecoil=100.0000000
	FireChaos=0.0500000
	XInaccuracy=2.0000000
	YInaccuracy=2.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.BFG.BFG-SmallFire',Volume=2.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FireAnim="Fire2"
	FireEndAnim="None"
	FireRate=0.1100000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_HVPCCells'
	AmmoPerFire=4
	ShakeRotMag=(X=16.0000000,Y=4.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1200.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk66ProjectileSmall'
	WarnTargetPct=0.2000000
}
