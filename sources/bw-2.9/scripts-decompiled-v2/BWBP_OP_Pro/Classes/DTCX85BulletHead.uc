class DTCX85BulletHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was decapitated by %k with the CX85."
	DeathStrings[1]="%k beheaded %o with %kh CX85."
	bHeaddie=true
	DamageIdent="Machinegun"
	WeaponClass=Class'BWBP_OP_Pro.CX85AssaultWeapon'
	DeathString="%o was decapitated by %k with the CX85."
	FemaleSuicide="%o peered down the barrel of her CX85."
	MaleSuicide="%o peered down the barrel of his CX85."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
