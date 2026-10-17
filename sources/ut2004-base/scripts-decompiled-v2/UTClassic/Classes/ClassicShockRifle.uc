class ClassicShockRifle extends ShockRifle
	config(User)
	hidedropdown
	cacheexempt;

defaultproperties
{
	FireModeClass[0]=Class'UTClassic.ClassicShockBeamFire'
	FireModeClass[1]=Class'UTClassic.ClassicShockProjFire'
	SelectAnimRate=1.0000000
	BringUpTime=0.4500000
	MinReloadPct=1.0000000
	PickupClass=Class'UTClassic.ClassicShockRiflePickup'
}
