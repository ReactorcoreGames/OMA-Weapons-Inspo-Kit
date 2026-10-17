class SPECIES_Bot extends SpeciesType
	abstract;

static function string GetRagSkelName(string MeshName)
{
	return "Bot2";
	//return;	
}

defaultproperties
{
	MaleVoice="XGame.RobotVoice"
	FemaleVoice="XGame.FemRobotVoice"
	GibGroup="xEffects.xBotGibGroup"
	MaleSoundGroup="XGame.xBotSoundGroup"
	FemaleSoundGroup="XGame.xBotSoundGroup"
	SpeciesName="Robot"
	RaceNum=1
	DMTeam=1
	TauntAnims[9]="None"
	TauntAnimNames[8]="Want some?"
	ReceivedDamageScaling=1.2000000
	DamageScaling=1.2000000
	AccelRate=1.1000000
	WalkingPct=0.8000000
	CrouchedPct=0.7000000
}
