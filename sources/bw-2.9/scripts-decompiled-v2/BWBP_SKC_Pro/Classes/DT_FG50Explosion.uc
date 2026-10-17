class DT_FG50Explosion extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="The outcome after %k came at %o with an FG50? %o go boom."
	DeathStrings[1]="%o failed to withstand %k's orbital assault, being exploded from up above."
	DeathStrings[2]="%k popped %o with some very, very big bullets."
	DeathStrings[3]="%o had %vh blood spilled onto the battlefield by %k's FG50."
	SimpleKillString="FG50 Explosive Rounds"
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	bIgniteFires=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Machinegun"
	DamageDescription=",Bullet,Flame,"
	WeaponClass=Class'BWBP_SKC_Pro.FG50MachineGun'
	DeathString="%o took %k's FG50 round straight to the spine."
	FemaleSuicide="%o trashed herself with her own explosive rounds."
	MaleSuicide="%o trashed himself with his own explosive rounds."
	bFastInstantHit=true
	bAlwaysSevers=true
	bFlaming=true
	GibModifier=1.5000000
	GibPerterbation=0.2000000
	KDamageImpulse=3500.0000000
	VehicleDamageScaling=0.5000000
}
