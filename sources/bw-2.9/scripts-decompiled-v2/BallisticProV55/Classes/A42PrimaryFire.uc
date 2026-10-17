class A42PrimaryFire extends BallisticProProjectileFire;

var byte Shots;
var byte Cycle;
var() int FireSpread;

simulated event ModeDoFire()
{
	// End:0x20
	if(Weapon.GetFireMode(1).IsFiring())
	{
		return;
	}
	// End:0x3A
	if(FRand() > 0.5000000)
	{
		FireAnim = 'Fire';		
	}
	else
	{
		FireAnim = 'Fire2';
	}
	A42SkrithPistol(Weapon).NextAmmoTickTime = Level.TimeSeconds + float(2);
	super.ModeDoFire();
	//return;	
}

simulated state SpreadShot
{
	function SpawnProjectile(Vector Start, Rotator Dir)
	{
		local int i;
		local Rotator R;

		Shots = byte(FMin(float(default.Shots), float(BW.MagAmmo)));
		ConsumedLoad = AmmoPerFire * int(Shots);
		i = 0;
		J0x3C:

		// End:0x10F [Loop If]
		if(i < int(Shots))
		{
			R.Roll = int(float((65536 / 3) * int(Cycle)) + (65536.0000000 / float(12)));
			Dir = Rotator((GetFireSpread()) >> Dir);
			proj = Spawn(ProjectileClass,,, Start, Rotator((Vector(rot(0, 1, 0) * float(FireSpread)) >> R) >> Dir));
			proj.Instigator = Instigator;
			Cycle++;
			// End:0x105
			if(int(Cycle) > 3)
			{
				Cycle = 1;
			}
			i++;
			// [Loop Continue]
			goto J0x3C;
		}
		//return;		
	}

	simulated function bool AllowFire()
	{
		// End:0x2B
		if(!super(BallisticFire).AllowFire() || A42SkrithPistol(BW).HeatLevel >= float(10))
		{
			return false;
		}
		return true;
		//return;		
	}

	function DoFireEffect()
	{
		super(BallisticProjectileFire).DoFireEffect();
		A42SkrithPistol(Weapon).AddHeat(HeatPerShot * float(Shots), 0.0000000);
		//return;		
	}

	function PlayFiring()
	{
		// End:0x40
		if(int(Level.NetMode) == int(NM_Client))
		{
			A42SkrithPistol(Weapon).AddHeat(HeatPerShot * float(Shots), 0.0000000);
		}
		super(BallisticFire).PlayFiring();
		//return;		
	}
	stop;	
}

defaultproperties
{
	Shots=3
	Cycle=1
	FireSpread=120
	HeatPerShot=0.8100000
	bPawnRapidFireAnim=true
	AmmoClass=Class'BallisticProV55.Ammo_A42Charge'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-60.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
}
