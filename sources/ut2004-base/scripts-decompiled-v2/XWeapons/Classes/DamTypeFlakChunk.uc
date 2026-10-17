class DamTypeFlakChunk extends WeaponDamageType
	abstract;

var Sound FlakMonkey;

static function IncrementKills(Controller Killer)
{
	local xPlayerReplicationInfo xPRI;

	xPRI = xPlayerReplicationInfo(Killer.PlayerReplicationInfo);
	// End:0x76
	if(xPRI != none)
	{
		xPRI.flakcount++;
		// End:0x76
		if((xPRI.flakcount == 15) && UnrealPlayer(Killer) != none)
		{
			UnrealPlayer(Killer).ClientDelayedAnnouncementNamed('FlackMonkey', 15);
		}
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'XWeapons.FlakCannon'
	DeathString="%o was shredded by %k's flak cannon."
	FemaleSuicide="%o was perforated by her own flak."
	MaleSuicide="%o was perforated by his own flak."
	ThemSuicide="%o was perforated by their own flak."
	bDelayedDamage=true
	bBulletHit=true
	VehicleMomentumScaling=0.5000000
}
