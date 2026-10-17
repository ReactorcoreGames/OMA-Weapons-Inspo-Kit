class SPECIES_Night extends SPECIES_Human
	abstract;

static function int ModifyImpartedDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	Damage *= default.DamageScaling;
	// End:0x71
	if(instigatedBy.Health > 0)
	{
		instigatedBy.Health = Clamp(int(float(instigatedBy.Health) + (float(Damage) * 0.5000000)), instigatedBy.Health, int(instigatedBy.HealthMax));
	}
	return Damage;
	//return;	
}

defaultproperties
{
	MaleVoice="XGame.NightMaleVoice"
	FemaleVoice="XGame.NightFemaleVoice"
	MaleSoundGroup="XGame.xNightMaleSoundGroup"
	FemaleSoundGroup="XGame.xNightFemaleSoundGroup"
	SpeciesName="Night"
	RaceNum=5
	TauntAnims[8]="Gesture_Taunt03"
	TauntAnims[9]="Idle_Character03"
	DamageScaling=0.7000000
}
