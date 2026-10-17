class DTSRXRifleHead_Corrosive extends DT_BWBullet
	config(BallisticProV55);

var() float ArmorDrain;

static function Hurt(Actor Victim, float Damage, Pawn Instigator, Vector HitLocation, Vector Momentum, Class<DamageType> dt)
{
	local Armor BestArmor;

	Victim.TakeDamage(int(Damage), Instigator, HitLocation, Momentum, dt);
	// End:0x98
	if(((Instigator.Controller != none) && Pawn(Victim).Controller != Instigator.Controller) && Instigator.Controller.SameTeamAs(Pawn(Victim).Controller))
	{
		return;
	}
	// End:0x161
	if((Pawn(Victim) != none) && Pawn(Victim).Inventory != none)
	{
		BestArmor = Pawn(Victim).Inventory.PrioritizeArmor(int(Damage * default.ArmorDrain), default.Class, HitLocation);
		// End:0x161
		if(BestArmor != none)
		{
			Victim.TakeDamage(int(Damage * default.ArmorDrain), Instigator, HitLocation, Momentum, dt);
			BestArmor.ArmorAbsorbDamage(int(Damage * default.ArmorDrain), default.Class, HitLocation);
		}
	}
	//return;	
}

defaultproperties
{
	ArmorDrain=0.7500000
	DeathStrings[0]="%o became a muse for %k after their face turned to goop."
	DeathStrings[1]="%k made %o's head bubble and boil until it was all gone."
	DeathStrings[2]="%o found that %k's acid wasn't a mind altering substance, it was a mind ender."
	DeathStrings[3]="%k cleaned the flesh off of %o's until a clean skull remained."
	AimedString="Scoped"
	bHeaddie=true
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_SKC_Pro.SRXRifle'
	DeathString="%k assasinated %o's head with %kh SRK-650."
	FemaleSuicide="%o took the wrong kind of acid as a recreational drug."
	MaleSuicide="%o drank their own acid."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.0000000
}
