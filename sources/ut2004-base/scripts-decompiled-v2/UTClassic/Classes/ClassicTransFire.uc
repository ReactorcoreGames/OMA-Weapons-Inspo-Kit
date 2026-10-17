class ClassicTransFire extends TransFire;

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local TransBeacon TransBeacon;

	// End:0x122
	if(Translauncher(Weapon).TransBeacon == none)
	{
		// End:0x7F
		if(((Instigator == none) || Instigator.PlayerReplicationInfo == none) || Instigator.PlayerReplicationInfo.Team == none)
		{
			TransBeacon = Weapon.Spawn(Class'UTClassic.ClassicTransBeacon',,, Start, Dir);			
		}
		else
		{
			// End:0xCB
			if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 0)
			{
				TransBeacon = Weapon.Spawn(Class'UTClassic.ClassicRedBeacon',,, Start, Dir);				
			}
			else
			{
				TransBeacon = Weapon.Spawn(Class'UTClassic.ClassicBlueBeacon',,, Start, Dir);
			}
		}
		Translauncher(Weapon).TransBeacon = TransBeacon;
		Weapon.PlaySound(TransFireSound, 3,,,,, false);		
	}
	else
	{
		Translauncher(Weapon).ViewPlayer();
		Translauncher(Weapon).TransBeacon.Destroy();
		Translauncher(Weapon).TransBeacon = none;
		Weapon.PlaySound(RecallFireSound, 3,,,,, false);
	}
	return TransBeacon;
	//return;	
}

defaultproperties
{
	ProjectileClass=Class'UTClassic.ClassicTransBeacon'
}
