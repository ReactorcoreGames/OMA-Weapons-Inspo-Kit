class DTleMatrevolverHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k unleashed %kh diamond back on %o's head."
	DeathStrings[1]="%o got %vh head blown off in a duel with %k."
	DeathStrings[2]="%k went leMat on %o's head.."
	DeathStrings[3]="%o got %vh head in a few too many duels with %k."
	DeathStrings[4]="%k's Diamond Back bit %o in the head."
	bHeaddie=true
	WeaponClass=Class'BallisticProV55.leMatRevolver'
	DeathString="%k went leMat on %o's head."
	FemaleSuicide="%o shot herself in the face."
	MaleSuicide="%o shot himself in the face."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
