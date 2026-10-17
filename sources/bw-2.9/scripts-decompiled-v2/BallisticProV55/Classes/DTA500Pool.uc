class DTA500Pool extends DTA500Blast
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o waddled into %k's noxious acid pool."
	DeathStrings[1]="%k's acid pool turned %o into a slurred puddle."
	DeathStrings[2]="%o tripped into %k's acidic A500 puddle. "
	DeathStrings[3]="%o got liquidised by %k's Skrith Reptile acid."
	SimpleKillString="A500 Acid Pool"
	DamageDescription=",Corrosive,Hazard,NonSniper,Poison"
	DeathString="%o waddled into %k's noxious acid pool and melted."
	FemaleSuicide="%o dissolved herself in her own gooey A500 acid pool."
	MaleSuicide="%o dissolved himself in his own gooey A500 acid pool."
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.Reptile.Rep_PlayerImpact'
	TransientSoundVolume=2.0000000
}
