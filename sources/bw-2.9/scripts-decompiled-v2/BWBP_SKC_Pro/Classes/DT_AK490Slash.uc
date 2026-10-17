class DT_AK490Slash extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k shared %kh bayonet with %o the communist way."
	DeathStrings[1]="%k speared %o in a vodka induced rage."
	DeathStrings[2]="%o was split like small bear by %k's AK490 blade."
	DeathStrings[3]="%o is now leaking borscht thanks to %k's bayonet."
	DeathStrings[4]="%k slaughtered %o like small baby man."
	DamageDescription=",Stab,"
	WeaponClass=Class'BWBP_SKC_Pro.AK490BattleRifle'
	DeathString="%k shared %kh bayonet with %o the communist way."
	FemaleSuicide="%o stumbled onto her AK490 bayonet."
	MaleSuicide="%o stumbled onto his AK490 bayonet."
	bArmorStops=false
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=0.5000000
}
