class ONSMineThrowFire extends BioFire;

var Class<Projectile> RedMineClass;
var Class<Projectile> BlueMineClass;

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local Projectile P;
	local int X;

	// End:0x29
	if(Weapon.Instigator.GetTeamNum() == 0)
	{
		ProjectileClass = RedMineClass;
	}
	// End:0x52
	if(Weapon.Instigator.GetTeamNum() == 1)
	{
		ProjectileClass = BlueMineClass;
	}
	// End:0x84
	if(ProjectileClass != none)
	{
		P = Weapon.Spawn(ProjectileClass, Weapon,, Start, Dir);
	}
	// End:0x91
	if(P == none)
	{
		return none;
	}
	P.Damage *= DamageAtten;
	// End:0x1D3
	if(ONSMineLayer(Weapon) != none)
	{
		// End:0x190
		if(ONSMineLayer(Weapon).CurrentMines >= ONSMineLayer(Weapon).MaxMines)
		{
			X = 0;
			J0xE8:

			// End:0x190 [Loop If]
			if(X < ONSMineLayer(Weapon).Mines.Length)
			{
				// End:0x149
				if(ONSMineLayer(Weapon).Mines[X] == none)
				{
					ONSMineLayer(Weapon).Mines.Remove(X, 1);
					X--;
					// [Explicit Continue]
					goto J0x186;
				}
				ONSMineLayer(Weapon).Mines[X].Destroy();
				ONSMineLayer(Weapon).Mines.Remove(X, 1);
				// [Explicit Break]
				goto J0x190;
				J0x186:

				X++;
				// [Loop Continue]
				goto J0xE8;
			}
		}
		J0x190:

		ONSMineLayer(Weapon).Mines[ONSMineLayer(Weapon).Mines.Length] = P;
		ONSMineLayer(Weapon).CurrentMines++;
	}
	return P;
	//return;	
}

function PlayFiring()
{
	super(WeaponFire).PlayFiring();
	ONSMineLayer(Weapon).PlayFiring(true);
	//return;	
}

defaultproperties
{
	RedMineClass=Class'Onslaught.ONSMineProjectileRED'
	BlueMineClass=Class'Onslaught.ONSMineProjectileBLUE'
	FireSound=Sound'ONSVehicleSounds-S.SpiderMines.SpiderMineFire01'
	FireRate=1.1000000
	AmmoClass=Class'Onslaught.ONSMineAmmo'
	ProjectileClass=Class'Onslaught.ONSMineProjectile'
}
