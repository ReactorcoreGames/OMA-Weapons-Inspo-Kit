class DT_LightningHead extends DT_BWMiscDamage
	config(BallisticProV55);

static function IncrementKills(Controller Killer)
{
	local xPlayerReplicationInfo xPRI;

	// End:0x12
	if(PlayerController(Killer) == none)
	{
		return;
	}
	PlayerController(Killer).ReceiveLocalizedMessage(Class'XGame.SpecialKillMessage', 0, Killer.PlayerReplicationInfo, none, none);
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

defaultproperties
{
	DeathStrings[0]="%o's head was fried by %k's lightning rifle."
	DeathStrings[1]="%k's lightning bolt cooked %o's face to a perfect temperature in an instant."
	DeathStrings[2]="%o felt the full force of a lightning strike to the head from %k's lightning bolt."
	AimedString="Scoped"
	bSnipingDamage=true
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_OP_Pro.LightningRifle'
	DeathString="%o's head was fried by %k's lightning rifle."
	FemaleSuicide="%o sniped off her own head."
	MaleSuicide="%o sniped off his own head."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.3000000
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=0.1500000
}
