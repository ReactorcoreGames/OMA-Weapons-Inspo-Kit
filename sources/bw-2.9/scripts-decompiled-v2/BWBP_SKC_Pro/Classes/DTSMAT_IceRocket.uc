class DTSMAT_IceRocket extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k sent %o a belated holiday gift via SMAT, an ice rocket to the sternum."
	DeathStrings[1]="%o's temperature went from red hot to ice cold after catching %k's SMAT rocket."
	DeathStrings[2]="%k shattered %o into a trillion pieces thanks to a SMAT ice rocket."
	DeathStrings[3]="%o took %k's SMAT rocket right in the North Pole."
	SimpleKillString="SMAT Ice Rocket Direct"
	FlashV=(X=0.0000000,Y=0.0000000,Z=2000.0000000)
	FlashF=0.3000000
	WeaponClass=Class'BWBP_SKC_Pro.SMATLauncher'
	DeathString="%k sent %o a belated holiday gift via SMAT, an ice rocket to the sternum."
	FemaleSuicide="%o pointed her SMAT in the wrong direction."
	MaleSuicide="%o pointed his SMAT in the wrong direction."
	bDelayedDamage=true
	VehicleDamageScaling=1.2000000
}
