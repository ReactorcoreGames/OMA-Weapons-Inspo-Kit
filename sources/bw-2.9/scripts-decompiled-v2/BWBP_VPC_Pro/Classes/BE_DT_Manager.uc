class BE_DT_Manager extends WeaponDamageType;

var(KillMessages) localized array<localized string> DeathStrings;
var(KillMessages) localized array<localized string> FemaleSuicides;
var(KillMessages) localized array<localized string> MaleSuicides;

static function string DeathMessage(PlayerReplicationInfo Killer, PlayerReplicationInfo Victim)
{
	local string S;

	// End:0x23
	if(default.DeathStrings.Length > 0)
	{
		S = default.DeathStrings[Rand(default.DeathStrings.Length)];		
	}
	else
	{
		S = default.DeathString;
	}
	return S;
	//return;	
}

static function string SuicideMessage(PlayerReplicationInfo Victim)
{
	// End:0x26
	if(Victim.bIsFemale && default.FemaleSuicides.Length < 1)
	{
		return default.FemaleSuicide;
	}
	// End:0x38
	if(default.MaleSuicides.Length < 1)
	{
		return default.MaleSuicide;
	}
	// End:0x59
	if(Victim.bIsFemale)
	{
		return default.FemaleSuicides[Rand(default.FemaleSuicides.Length)];
	}
	return default.MaleSuicides[Rand(default.MaleSuicides.Length)];
	//return;	
}

defaultproperties
{
	bDetonatesGoop=true
	bKUseTearOffMomentum=true
	bExtraMomentumZ=false
	bDirectDamage=false
	TransientSoundVolume=1.0000000
	TransientSoundRadius=64.0000000
}
