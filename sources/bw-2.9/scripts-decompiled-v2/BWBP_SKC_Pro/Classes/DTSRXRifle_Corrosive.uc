class DTSRXRifle_Corrosive extends DT_BWBullet
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
	ArmorDrain=0.3250000
	DeathStrings[0]="%o's veins are glowing bright with acid thanks to %k."
	DeathStrings[1]="%k injected some acid into %o's system and they melted from the inside."
	DeathStrings[2]="%o's armor and flesh fused into a bloody mess due to %k's acidic SRK."
	DeathStrings[3]="%k made some acidic soup, using their SRK and %o as ingredients."
	AimedString="Scoped"
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_SKC_Pro.SRXRifle'
	DeathString="%k assasinated %o with %kh SRK-650."
	FemaleSuicide="%o took the wrong kind of acid as a recreational drug."
	MaleSuicide="%o drank their own acid."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
}
