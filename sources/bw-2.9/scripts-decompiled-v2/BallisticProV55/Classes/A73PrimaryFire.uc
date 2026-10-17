class A73PrimaryFire extends BallisticProProjectileFire;

var float HeatDeclineDelay;

simulated function bool AllowFire()
{
	// End:0x46
	if(((A73SkrithRifle(Weapon).HeatLevel >= float(10)) && !A73SkrithRifle(Weapon).bDecorativeHeat) || !super(BallisticFire).AllowFire())
	{
		return false;
	}
	return true;
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	A73SkrithRifle(BW).AddHeat(HeatPerShot, HeatDeclineDelay);
	//return;	
}

function DoFireEffect()
{
	super(BallisticProjectileFire).DoFireEffect();
	// End:0x3D
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		A73SkrithRifle(BW).AddHeat(HeatPerShot, HeatDeclineDelay);
	}
	//return;	
}

defaultproperties
{
	HeatDeclineDelay=0.2000000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	HeatPerShot=0.6000000
	bInstantHit=true
	bPawnRapidFireAnim=true
	AmmoClass=Class'BallisticProV55.Ammo_Cells'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
}
