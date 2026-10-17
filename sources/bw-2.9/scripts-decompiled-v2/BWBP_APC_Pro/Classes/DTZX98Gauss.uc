class DTZX98Gauss extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was gaussed to the point of no return by %k's Reaper."
	DeathStrings[1]="%k opened several wormholes into %o's torso."
	DeathStrings[2]="%o was ferried to the afterlife, %k's gauss powered reaper helped speed it along."
	DeathStrings[3]="%k took %o's soul using newfound gauss technology."
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_APC_Pro.ZX98AssaultRifle'
	DeathString="%o was perforated by %k's ZX-98 fire."
	FemaleSuicide="OH NO YOU SOMEHOW SHOT YOURSELF. WHYYYY."
	MaleSuicide="OH GOD YOU SHOT YOURSELF. HOW DID YOU DO THAT."
	bFastInstantHit=true
	GibPerterbation=0.2000000
	KDamageImpulse=3000.0000000
}
