class DT_HB4Bolt extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k deadened %o's arms, then their legs, and finally, their heart."
	DeathStrings[1]="%o was stunned long enough for them to be murdered by %k."
	DeathStrings[2]="%k fried %o to a nice, crispy, well done with a stun bolt."
	DeathStrings[3]="%o got blasted to bits by %k's grenade blaster."
	SimpleKillString="HB4 Electric Bolt"
	BloodManagerName="BallisticProV55.BloodMan_A73Burn"
	bIgniteFires=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	DamageDescription=",Plasma,"
	WeaponClass=Class'BWBP_APC_Pro.HB4GrenadeBlaster'
	DeathString="%k plugged %o into an X-007 bolt."
	FemaleSuicide="%o brought a capacitor to a wall fight."
	MaleSuicide="%o brought a capacitor to a wall fight."
	bCauseConvulsions=true
	PawnDamageSounds[0]=Sound'BWBP_SKC_Sounds.Misc.XM84-StunEffect'
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=1.2500000
}
