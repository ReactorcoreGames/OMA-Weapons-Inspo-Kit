class DTMDKSMGHead extends DT_BWBullet
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
	DeathStrings[0]="%k's modular SMG drilled a small hole into %o's skull."
	DeathStrings[1]="%o got murdered in their skull by %k's MDK."
	DeathStrings[2]="%k cleared %o's ears of wax and excess brains with a scoped SMG."
	DeathStrings[3]="%o didn't find %k's SMG a joke after taking a bullet up the nose canal."
	EffectChance=0.5000000
	bHeaddie=true
	InvasionDamageScaling=1.5000000
	DamageIdent="SMG"
	WeaponClass=Class'BWBP_SWC_Pro.MDKSubMachinegun'
	DeathString="%o was stung in the head by %k's MDK."
	FemaleSuicide="%o silenced herself."
	MaleSuicide="%o silenced himself."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	VehicleDamageScaling=0.0000000
}
