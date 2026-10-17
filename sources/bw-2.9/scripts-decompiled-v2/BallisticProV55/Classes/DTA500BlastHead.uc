class DTA500BlastHead extends DT_BWMiscDamage
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
	ArmorDrain=0.2300000
	DeathStrings[0]="%o was melted into a gooey mess by %k's A500 acid blast."
	DeathStrings[1]="%k acidified %o with the A500."
	DeathStrings[2]="%k's Reptile blast chewed up and spat out %o."
	DeathStrings[3]="%o got liquidised by %k's Skrith Reptile acid."
	FlashThreshold=0
	FlashV=(X=0.0000000,Y=2000.0000000,Z=0.0000000)
	FlashF=0.2500000
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	DamageDescription=",Corrosive,Hazard,NonSniper,"
	WeaponClass=Class'BallisticProV55.A500Reptile'
	DeathString="%o was melted into a gooey mess by %k's A500 acid blast."
	FemaleSuicide="%o melted herself with a face full of A500 acid."
	MaleSuicide="%o melted himself with a face full of A500 acid."
	bDelayedDamage=true
}
