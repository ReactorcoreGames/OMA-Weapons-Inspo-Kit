class DTSRKSmg extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k ran into %o within close proximity, putting holes into %vh torso."
	DeathStrings[1]="%o couldn't withstand %k's super 10mm bullets entering %vh lungs."
	DeathStrings[2]="%k didn't need a full sized gun to kill %o, the 205 does the job."
	DeathStrings[3]="%o had t%vh kneecaps resemble broken stumps because of %k."
	DeathStrings[4]="%k's super bullets destroyed the villainous %o."
	DeathStrings[5]="%o couldn't run or escape from %k's 205 in a confined space."
	WeaponClass=Class'BWBP_APC_Pro.SRKSubMachinegun'
	DeathString="%k shot through %o with the SRK-205."
	FemaleSuicide="%o nailed herself with the SRK-205."
	MaleSuicide="%o nailed himself with the SRK-205."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.6500000
}
