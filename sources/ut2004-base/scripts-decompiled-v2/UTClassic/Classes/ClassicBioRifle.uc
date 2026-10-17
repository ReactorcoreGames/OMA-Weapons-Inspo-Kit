class ClassicBioRifle extends BioRifle
	config(User)
	hidedropdown
	cacheexempt;

defaultproperties
{
	FireModeClass[0]=Class'UTClassic.ClassicBioFire'
	FireModeClass[1]=Class'UTClassic.ClassicBioChargedFire'
	SelectAnimRate=1.0000000
	BringUpTime=0.4500000
	MinReloadPct=1.0000000
	PickupClass=Class'UTClassic.ClassicBioRiflePickup'
}
