class DamTypeShockCombo extends WeaponDamageType
	abstract;

var Sound Combowhore;

static function GetHitEffects(out Class<xEmitter> HitEffects[4], int VictemHealth)
{
	HitEffects[0] = Class'XEffects.HitSmoke';
	//return;	
}

static function IncrementKills(Controller Killer)
{
	local xPlayerReplicationInfo xPRI;

	xPRI = xPlayerReplicationInfo(Killer.PlayerReplicationInfo);
	// End:0x76
	if(xPRI != none)
	{
		xPRI.combocount++;
		// End:0x76
		if((xPRI.combocount == 15) && UnrealPlayer(Killer) != none)
		{
			UnrealPlayer(Killer).ClientDelayedAnnouncementNamed('Combowhore', 15);
		}
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'XWeapons.ShockRifle'
	DeathString="%o couldn't avoid the blast from %k's shock combo."
	FemaleSuicide="%o made a tactical error with her shock combo."
	MaleSuicide="%o made a tactical error with his shock combo."
	ThemSuicide="%o made a tactical error with their shock combo."
	bAlwaysSevers=true
	bDetonatesGoop=true
	bThrowRagdoll=true
}
