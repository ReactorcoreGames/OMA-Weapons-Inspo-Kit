class DTA51Pool extends DTA500Blast
	config(BallisticProV55);

static function Hurt(Actor Victim, float Damage, Pawn Instigator, Vector HitLocation, Vector Momentum, Class<DamageType> dt)
{
	local Armor BestArmor;

	Victim.TakeDamage(int(Damage), Instigator, HitLocation, Momentum, dt);
	// End:0xC2
	if(Pawn(Victim) != none)
	{
		// End:0x55
		if(Pawn(Victim).Inventory == none)
		{
			return;
		}
		BestArmor = Pawn(Victim).Inventory.PrioritizeArmor(int(Damage * default.ArmorDrain), default.Class, HitLocation);
		// End:0xC2
		if(BestArmor != none)
		{
			BestArmor.ArmorAbsorbDamage(int(Damage * default.ArmorDrain), default.Class, HitLocation);
		}
	}
	//return;	
}

defaultproperties
{
	DeathStrings[0]="%o waddled into %k's noxious acid pool and melted."
	DeathStrings[1]="%k's acid pool turned %o into a slurred puddle."
	DeathStrings[2]="%o tripped into %k's acidic A51 puddle and melted %vs. "
	DeathStrings[3]="%o got liquidised by %k's Skrith Reptile acid."
	DamageDescription=",Corrosive,Hazard,NonSniper,Poison"
	WeaponClass=Class'BWBP_SWC_Pro.A51Grenade'
	DeathString="%o waddled into %k's noxious acid pool and melted."
	FemaleSuicide="%o dissolved herself in her own gooey A51 acid pool."
	MaleSuicide="%o dissolved himself in his own gooey A51 acid pool."
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.Reptile.Rep_PlayerImpact'
	TransientSoundVolume=2.0000000
}
