class TransFire extends ProjectileFire;

var() Sound TransFireSound;
var() Sound RecallFireSound;
var() string TransFireForce;
var() string RecallFireForce;

simulated function PlayFiring()
{
	// End:0x3F
	if(!Translauncher(Weapon).bBeaconDeployed)
	{
		Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
		ClientPlayForceFeedback(TransFireForce);
	}
	//return;	
}

function Rotator AdjustAim(Vector Start, float InAimError)
{
	return Instigator.Controller.Rotation;
	//return;	
}

simulated function bool AllowFire()
{
	return Translauncher(Weapon).AmmoChargeF >= 1.0000000;
	//return;	
}

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local TransBeacon TransBeacon;

	// End:0x122
	if(Translauncher(Weapon).TransBeacon == none)
	{
		// End:0x7F
		if(((Instigator == none) || Instigator.PlayerReplicationInfo == none) || Instigator.PlayerReplicationInfo.Team == none)
		{
			TransBeacon = Weapon.Spawn(Class'XWeapons.TransBeacon',,, Start, Dir);			
		}
		else
		{
			// End:0xCB
			if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 0)
			{
				TransBeacon = Weapon.Spawn(Class'XWeapons.RedBeacon',,, Start, Dir);				
			}
			else
			{
				TransBeacon = Weapon.Spawn(Class'XWeapons.BlueBeacon',,, Start, Dir);
			}
		}
		Translauncher(Weapon).TransBeacon = TransBeacon;
		Weapon.PlaySound(TransFireSound, 3,,,,, false);		
	}
	else
	{
		Translauncher(Weapon).ViewPlayer();
		// End:0x1A1
		if(Translauncher(Weapon).TransBeacon.Disrupted())
		{
			// End:0x19E
			if((Instigator != none) && PlayerController(Instigator.Controller) != none)
			{
				PlayerController(Instigator.Controller).ClientPlaySound(Sound'WeaponSounds.BaseGunTech.BSeekLost1');
			}			
		}
		else
		{
			Translauncher(Weapon).TransBeacon.Destroy();
			Translauncher(Weapon).TransBeacon = none;
			Weapon.PlaySound(RecallFireSound, 3,,,,, false);
		}
	}
	return TransBeacon;
	//return;	
}

defaultproperties
{
	TransFireSound=SoundGroup'WeaponSounds.Translocator.TranslocatorFire'
	RecallFireSound=SoundGroup'WeaponSounds.Translocator.TranslocatorModuleRegeneration'
	TransFireForce="TranslocatorFire"
	RecallFireForce="TranslocatorModuleRegeneration"
	ProjSpawnOffset=(X=25.0000000,Y=8.0000000,Z=-10.0000000)
	bLeadTarget=false
	bWaitForRelease=true
	bModeExclusive=false
	FireAnimRate=1.5000000
	FireRate=0.2500000
	AmmoPerFire=1
	ProjectileClass=Class'XWeapons.TransBeacon'
	BotRefireRate=0.3000000
}
