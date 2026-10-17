class DTR9000EPlague extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o couldn't escape being a green goo pile after being tagged by %k's Chimera."
	DeathStrings[1]="%k let their Chimera do all the heavy lifting to irradiate %o to death."
	DeathStrings[2]="%o had a good life before succumbing to %k's radiation."
	DeathStrings[3]="%k watched as %o perished from terminal radiation poisoning."
	DeathStrings[4]="%o's corpse is a reminder that %k's Chimera can kill even beyond the grave."
	DeathStrings[5]="%k might've grazed %o with a radioactive bullet, but it's all it takes to kill someone."
	SimpleKillString="Raygun Irradiation"
	BloodManagerName="BallisticProV55.BloodMan_DarkSlow"
	InvasionDamageScaling=1.2500000
	DamageIdent="Energy"
	DamageDescription=",Plasma,"
	WeaponClass=Class'BWBP_APC_Pro.R9000ERifle'
	DeathString="%k's radiation overdose was too much for %o."
	FemaleSuicide="%o irradiated herself."
	MaleSuicide="%o irradiated himself."
	bArmorStops=false
	bDetonatesGoop=false
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=30000.0000000
	VehicleDamageScaling=0.2000000
	VehicleMomentumScaling=0.2000000
}
