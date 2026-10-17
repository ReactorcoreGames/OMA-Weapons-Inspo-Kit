class RedeemerGuidedFire extends RedeemerFire;

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local RedeemerWarhead Warhead;
	local PlayerController Possessor;

	Warhead = Weapon.Spawn(Class'XWeapons.RedeemerWarhead', Instigator,, Start, Dir);
	// End:0x62
	if(Warhead == none)
	{
		Warhead = Weapon.Spawn(Class'XWeapons.RedeemerWarhead', Instigator,, Instigator.Location, Dir);
	}
	// End:0x1B3
	if(Warhead != none)
	{
		Warhead.OldPawn = Instigator;
		Warhead.PlaySound(FireSound);
		Possessor = PlayerController(Instigator.Controller);
		Possessor.bAltFire = 0;
		// End:0x13E
		if(Possessor != none)
		{
			// End:0xED
			if(Instigator.InCurrentCombo())
			{
				Possessor.Adrenaline = 0.0000000;
			}
			Possessor.UnPossess();
			Instigator.SetOwner(Possessor);
			Instigator.PlayerReplicationInfo = Possessor.PlayerReplicationInfo;
			Possessor.Possess(Warhead);
		}
		Warhead.Velocity = Warhead.AirSpeed * Vector(Warhead.Rotation);
		Warhead.Acceleration = Warhead.Velocity;
		Warhead.MyTeam = Possessor.PlayerReplicationInfo.Team;		
	}
	else
	{
		Weapon.Spawn(Class'XEffects.SmallRedeemerExplosion');
		Weapon.HurtRadius(500.0000000, 400.0000000, Class'XWeapons.DamTypeRedeemer', 100000.0000000, Instigator.Location);
	}
	bIsFiring = false;
	StopFiring();
	return none;
	//return;	
}

