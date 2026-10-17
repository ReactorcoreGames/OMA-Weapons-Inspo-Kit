class ClassicFlakCannon extends FlakCannon
	config(User)
	hidedropdown
	cacheexempt;

defaultproperties
{
	FireModeClass[0]=Class'UTClassic.ClassicFlakFire'
	FireModeClass[1]=Class'UTClassic.ClassicFlakAltFire'
	SelectAnimRate=0.7500000
	BringUpTime=0.6000000
	MinReloadPct=1.0000000
	PickupClass=Class'UTClassic.ClassicFlakCannonPickup'
}
