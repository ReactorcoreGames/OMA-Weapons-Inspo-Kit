class SPECIES_Jugg extends SpeciesType
	abstract;

static function string GetRagSkelName(string MeshName)
{
	return "Jugg2";
	//return;	
}

defaultproperties
{
	MaleVoice="XGame.JuggMaleVoice"
	FemaleVoice="XGame.JuggFemaleVoice"
	GibGroup="xGame.xJuggGibGroup"
	FemaleSkeleton="Jugg.SkeletonJugg"
	MaleSkeleton="Jugg.SkeletonJugg"
	MaleSoundGroup="XGame.xJuggMaleSoundGroup"
	FemaleSoundGroup="XGame.xJuggFemaleSoundGroup"
	SpeciesName="Juggernaut"
	RaceNum=3
	DMTeam=1
	TauntAnims[10]="Gesture_Taunt02"
	TauntAnims[11]="Idle_Character02"
	TauntAnimNames[7]="Flex"
	TauntAnimNames[8]="Stomp"
	TauntAnimNames[9]="Back scratch"
	TauntAnimNames[10]="Show butt"
	TauntAnimNames[11]="Head scratch"
	AirControl=0.7000000
	ReceivedDamageScaling=0.7000000
	AccelRate=0.7000000
	WalkingPct=0.8000000
	CrouchedPct=0.8000000
	DodgeSpeedFactor=0.9000000
	DodgeSpeedZ=0.9000000
}
