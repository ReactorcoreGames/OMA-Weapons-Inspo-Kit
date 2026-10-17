class DTA42AcidBlast extends DT_BWMiscDamage
	config(BallisticProV55);

var() float ArmorDrain;

static function Hurt(Actor Victim, float Damage, Pawn Instigator, Vector HitLocation, Vector Momentum, Class<DamageType> dt)
{
	local Armor BestArmor;

	Victim.TakeDamage(int(Damage), Instigator, HitLocation, Momentum, dt);
	// End:0xC2
	if((Pawn(Victim) != none) && Pawn(Victim).Inventory != none)
	{
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
	ArmorDrain=0.3000000
	DeathStrings[0]="%o was melted into a gooey mess by %k's A42 acid blast."
	DeathStrings[1]="%k acidified %o with the A42."
	DeathStrings[2]="%k's Cobra blast chewed up and spat out %o."
	DeathStrings[3]="%o got liquidised by %k's Skrith Cobra acid."
	DamageDescription=",Corrosive,Hazard,NonSniper,"
	WeaponClass=Class'BallisticProV55.A42SkrithPistol'
	DeathString="%o was melted into a gooey mess by %k's A42 acid blast."
	FemaleSuicide="%o melted herself with a face full of A42 acid."
	MaleSuicide="%o melted himself with a face full of A42 acid"
	bDelayedDamage=true
	VehicleDamageScaling=1.5000000
}
