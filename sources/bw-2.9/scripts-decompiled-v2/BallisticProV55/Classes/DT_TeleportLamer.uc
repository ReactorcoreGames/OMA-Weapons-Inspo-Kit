class DT_TeleportLamer extends DT_BWMiscDamage
	config(BallisticProV55);

static function string DeathMessage(PlayerReplicationInfo Killer, PlayerReplicationInfo Victim)
{
	local string S;

	// End:0x34
	if(default.bSimpleDeathMessages)
	{
		S = "%k [Teleport Camper Reversal] %o";		
	}
	else
	{
		// End:0x57
		if(default.DeathStrings.Length > 0)
		{
			S = default.DeathStrings[Rand(default.DeathStrings.Length)];			
		}
		else
		{
			S = default.DeathString;
		}
	}
	return Detag(S, Victim, Killer);
	//return;	
}

static function string SuicideMessage(PlayerReplicationInfo Victim)
{
	// End:0x28
	if(default.bSimpleDeathMessages)
	{
		return "%o [Teleport Camper Suicide]";
	}
	// End:0x4E
	if(Victim.bIsFemale && default.FemaleSuicides.Length < 1)
	{
		return default.FemaleSuicide;
	}
	// End:0x60
	if(default.MaleSuicides.Length < 1)
	{
		return default.MaleSuicide;
	}
	// End:0x81
	if(Victim.bIsFemale)
	{
		return default.FemaleSuicides[Rand(default.FemaleSuicides.Length)];
	}
	return default.MaleSuicides[Rand(default.MaleSuicides.Length)];
	//return;	
}

defaultproperties
{
	bDetonatesBombs=false
	DamageIdent="Grenade"
	DeathString="%o tried to cheese %k with a mined teleporter, and ate the damage %vs."
	FemaleSuicide="%o tried to cheese by mining a teleporter."
	MaleSuicide="%o tried to cheese by mining a teleporter."
	bArmorStops=false
	bLocationalHit=false
	bSkeletize=true
	bCausesBlood=false
	bDelayedDamage=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
	VehicleDamageScaling=0.0000000
}
