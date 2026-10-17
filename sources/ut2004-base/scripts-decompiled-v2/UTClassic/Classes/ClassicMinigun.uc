class ClassicMinigun extends Minigun
	config(User)
	hidedropdown
	cacheexempt;

defaultproperties
{
	FireModeClass[0]=Class'UTClassic.ClassicMinigunAltfire'
	FireModeClass[1]=Class'UTClassic.ClassicMinigunFire'
	SelectAnimRate=0.7500000
	BringUpTime=0.6000000
	MinReloadPct=1.0000000
	PickupClass=Class'UTClassic.ClassicMinigunPickup'
}
