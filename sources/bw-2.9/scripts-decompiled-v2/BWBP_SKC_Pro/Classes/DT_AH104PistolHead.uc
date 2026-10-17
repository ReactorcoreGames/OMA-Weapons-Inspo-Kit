class DT_AH104PistolHead extends DT_BWBullet
	config(BallisticProV55);

var() float ArmorDrain;

static function Hurt(Actor Victim, float Damage, Pawn Instigator, Vector HitLocation, Vector Momentum, Class<DamageType> dt)
{
	local Armor BestArmor;

	Victim.TakeDamage(int(Damage), Instigator, HitLocation, Momentum, dt);
	// End:0x98
	if(((Instigator.Controller != none) && Pawn(Victim).Controller != Instigator.Controller) && Instigator.Controller.SameTeamAs(Pawn(Victim).Controller))
	{
		return;
	}
	// End:0x161
	if((Pawn(Victim) != none) && Pawn(Victim).Inventory != none)
	{
		BestArmor = Pawn(Victim).Inventory.PrioritizeArmor(int(Damage * default.ArmorDrain), default.Class, HitLocation);
		// End:0x161
		if(BestArmor != none)
		{
			Victim.TakeDamage(int(Damage * default.ArmorDrain), Instigator, HitLocation, Momentum, dt);
			BestArmor.ArmorAbsorbDamage(int(Damage * default.ArmorDrain), default.Class, HitLocation);
		}
	}
	//return;	
}

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
	ArmorDrain=0.2000000
	DeathStrings[0]="%k blew %o's head off with %kh AH104."
	DeathStrings[1]="%k cracked %o's skull with AH104 rounds."
	DeathStrings[2]="%o lost %vh head in a fight with %k's AH104 Pounder."
	TagDuration=0.2000000
	bHeaddie=true
	WeaponClass=Class'BWBP_SKC_Pro.AH104Pistol'
	DeathString="%k blew %o's head off with %kh AH104."
	FemaleSuicide="%o headshotted herself with the AH104."
	MaleSuicide="%o headshotted himself with the AH104."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
