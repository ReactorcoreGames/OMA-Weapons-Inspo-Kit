class DamTypeSniperHeadShot extends WeaponDamageType
	abstract;

var Class<LocalMessage> KillerMessage;
var Sound Headhunter;

static function IncrementKills(Controller Killer)
{
	local xPlayerReplicationInfo xPRI;

	// End:0x12
	if(PlayerController(Killer) == none)
	{
		return;
	}
	PlayerController(Killer).ReceiveLocalizedMessage(default.KillerMessage, 0, Killer.PlayerReplicationInfo, none, none);
	xPRI = xPlayerReplicationInfo(Killer.PlayerReplicationInfo);
	// End:0xB2
	if(xPRI != none)
	{
		xPRI.headcount++;
		// End:0xB2
		if((xPRI.headcount == 15) && UnrealPlayer(Killer) != none)
		{
			UnrealPlayer(Killer).ClientDelayedAnnouncementNamed('Headhunter', 15);
		}
	}
	//return;	
}

static function GetHitEffects(out Class<xEmitter> HitEffects[4], int VictemHealth)
{
	HitEffects[0] = Class'XEffects.HitSmoke';
	HitEffects[1] = Class'XEffects.HitFlameBig';
	//return;	
}

defaultproperties
{
	KillerMessage=Class'XGame.SpecialKillMessage'
	WeaponClass=Class'XWeapons.SniperRifle'
	DeathString="%o's cranium was made extra crispy by %k's lightning gun."
	FemaleSuicide="%o violated the laws of space-time and sniped herself."
	MaleSuicide="%o violated the laws of space-time and sniped himself."
	ThemSuicide="%o violated the laws of space-time and sniped themself."
	bAlwaysSevers=true
	bSpecial=true
	bCauseConvulsions=true
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
}
