class DT_AH104Pistol extends DT_BWBullet
	config(BallisticProV55);

var() float ArmorDrain;

static function Hurt(Actor Victim, float Damage, Pawn Instigator, Vector HitLocation, Vector Momentum, Class<DamageType> dt)
{
	local Armor BestArmor;

	Victim.TakeDamage(int(Damage), Instigator, HitLocation, Momentum, dt);
	// End:0x161
	if((Pawn(Victim) != none) && Pawn(Victim).Inventory != none)
	{
		// End:0xC3
		if(((Instigator.Controller != none) && Pawn(Victim).Controller != Instigator.Controller) && Instigator.Controller.SameTeamAs(Pawn(Victim).Controller))
		{
			return;
		}
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
	ArmorDrain=0.2000000
	DeathStrings[0]="%k pounded %o to the ground with %kh AH104."
	DeathStrings[1]="%k punched through %o with %kh AH104."
	DeathStrings[2]="%o's body armor did nothing to stop %k's AH104."
	DeathStrings[3]="%k's AH104 blasted %o into submission."
	TagDuration=0.2000000
	bIgniteFires=true
	WeaponClass=Class'BWBP_SKC_Pro.AH104Pistol'
	DeathString="%k pounded %o to the ground with %kh AH104."
	FemaleSuicide="%o nailed herself with the AH104."
	MaleSuicide="%o nailed himself with the AH104."
	VehicleDamageScaling=0.8750000
	VehicleMomentumScaling=0.3000000
}
