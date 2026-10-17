class DT_MP40_Corrosive extends DT_BWBullet
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
	DeathStrings[0]="%k adapted to the amplified tehcnology, %o did not as %ve turned into a pile of goo."
	DeathStrings[1]="%o was on the wrong end of %k's chemical warfare."
	DeathStrings[2]="%k turned %o into primordial goop with an acidic AMP."
	DeathStrings[3]="%o couldn't hide from the impending acidic blitzkrieg from %k's amped FMP."
	DeathStrings[4]="Who wants a %o smoothie from %k?  Made of flesh and corrosive bullets."
	TagMultiplier=0.7000000
	TagDuration=0.1000000
	WeaponClass=Class'BWBP_SKC_Pro.FMPMachinePistol'
	DeathString="%k embraced Schadenfreude as %kh FMP destroyed %o."
	FemaleSuicide="%o did her FÃ¼hrer impression."
	MaleSuicide="%o did his FÃ¼hrer impression."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.6500000
}
