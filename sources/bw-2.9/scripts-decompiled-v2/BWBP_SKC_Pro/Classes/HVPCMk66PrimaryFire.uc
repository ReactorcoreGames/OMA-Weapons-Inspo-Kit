class HVPCMk66PrimaryFire extends BallisticProProjectileFire;

var float StopFireTime;
var() Sound FailSound;

simulated function bool AllowFire()
{
	// End:0x45
	if(((HVPCMk66PlasmaCannon(Weapon).HeatLevel >= 9.5000000) || HVPCMk66PlasmaCannon(Weapon).bIsVenting) || !super(BallisticFire).AllowFire())
	{
		return false;
	}
	return true;
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	HVPCMk66PlasmaCannon(BW).AddHeat(5.0000000);
	//return;	
}

function StopFiring()
{
	bIsFiring = false;
	StopFireTime = Level.TimeSeconds;
	//return;	
}

function DoFireEffect()
{
	local Vector StartTrace, StartProj, X, Y, Z, Start,
		End, HitLocation, HitNormal;

	local Rotator Aim;
	local Actor Other, Other2;

	Weapon.GetViewAxes(X, Y, Z);
	Start = Instigator.Location + Instigator.EyePosition();
	StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
	// End:0xB6
	if(!Weapon.WeaponCentered())
	{
		StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
	}
	Other = Trace(HitLocation, HitNormal, StartTrace, Start, true);
	// End:0x105
	if(Other != none)
	{
		StartProj = HitLocation;
		Weapon.PlaySound(FailSound, 1, 1.3000000);
	}
	Aim = GetFireAim(StartTrace);
	Aim = Rotator((GetFireSpread()) >> Aim);
	End = Start + (Vector(Aim) * (MaxRange()));
	Other2 = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x1A6
	if(Other == none)
	{
		// End:0x193
		if(Other2 != none)
		{
			Aim = Rotator(HitLocation - StartTrace);
		}
		SpawnProjectile(StartTrace, Aim);		
	}
	else
	{
		SpawnProjectile(StartProj, Aim);
	}
	// End:0x239
	if((int(Weapon.Role) == int(ROLE_Authority)) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
	{
		Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(1, 1);
	}
	SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
	// End:0x285
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		HVPCMk66PlasmaCannon(BW).AddHeat(5.0000000);
	}
	//return;	
}

defaultproperties
{
	FailSound=Sound'BWBP_SKC_Sounds.HyperBeamCannon.343Primary-Fail'
	SpawnOffset=(X=100.0000000,Y=10.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.BFGFlashEmitter'
	FireRecoil=820.0000000
	FireChaos=0.6000000
	XInaccuracy=8.0000000
	YInaccuracy=4.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.BFG.BFG-Fire',Volume=4.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FireAnim="Fire2"
	FireEndAnim="None"
	FireRate=2.5000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_HVPCCells'
	AmmoPerFire=100
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1200.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk66Projectile'
	WarnTargetPct=0.2000000
}
