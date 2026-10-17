class DTMX32Primary extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's rib cage was shattered by %k's MX32."
	DeathStrings[1]="%k opened up several holes in %o's lungs with the MX32."
	DeathStrings[2]="%o got a much needed colon cleansing thanks to %k."
	DeathStrings[3]="%k reduced %o's limbs to beef jerky."
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_OP_Pro.MX32Weapon'
	DeathString="%o's rib cage was shattered by %k's MX32."
	FemaleSuicide="%o nailed herself with the MX32."
	MaleSuicide="%o nailed himself with the MX32."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
}
