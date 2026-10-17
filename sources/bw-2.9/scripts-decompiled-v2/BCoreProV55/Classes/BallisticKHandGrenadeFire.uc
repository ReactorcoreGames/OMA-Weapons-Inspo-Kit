class BallisticKHandGrenadeFire extends BallisticHandGrenadeFire;

function SpawnProjectile(Vector Start, Rotator Dir)
{
	local float Speed, DetonateDelay;
	local Vector enemyDir;

	proj = Spawn(ProjectileClass,,, Start, Dir);
	proj.Instigator = Instigator;
	// End:0x29B
	if(BallisticKHandGrenadeProjectile(proj) != none)
	{
		// End:0x112
		if(AIController(Instigator.Controller) == none)
		{
			// End:0xCA
			if((BW != none) && BW.WeaponModes[int(BW.CurrentWeaponMode)].Value == float(0))
			{
				Speed = (proj.Speed * FClamp(HoldTime - 0.5000000, 0.0000000, 2.0000000)) / float(2);				
			}
			else
			{
				// End:0x10F
				if(BW != none)
				{
					Speed = proj.Speed / BW.WeaponModes[int(BW.CurrentWeaponMode)].Value;
				}
			}			
		}
		else
		{
			// End:0x1F2
			if(Instigator.Controller.Enemy != none)
			{
				enemyDir = Instigator.Controller.Enemy.Location - Instigator.Location;
				Speed = FMin(proj.Speed, ((1.0000000 + Normal(enemyDir).Z) * (VSize(enemyDir) / 1.5000000)) + (VSize(Instigator.Controller.Enemy.Velocity) * (Normal(Instigator.Controller.Enemy.Velocity) Dot Normal(enemyDir))));				
			}
			else
			{
				Speed = proj.Speed;
			}
		}
		// End:0x264
		if(BallisticHandGrenade(Weapon).ClipReleaseTime > 0.0000000)
		{
			DetonateDelay = BallisticKHandGrenadeProjectile(proj).DetonateDelay - (Level.TimeSeconds - BallisticHandGrenade(Weapon).ClipReleaseTime);			
		}
		else
		{
			DetonateDelay = BallisticKHandGrenadeProjectile(proj).DetonateDelay;
		}
		BallisticKHandGrenadeProjectile(proj).SetThrowPowerAndDelay(Speed, DetonateDelay);
	}
	//return;	
}

