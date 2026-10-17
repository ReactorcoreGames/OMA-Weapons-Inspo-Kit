class SkrithStaffPrimaryFire extends BallisticProProjectileFire;

var() Sound ChargeFireSound;
var() Sound PowerFireSound;

simulated event ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0x7E
	if(int(Weapon.SoundPitch) != 36)
	{
		// End:0x4A
		if(Instigator.DrivenVehicle != none)
		{
			Weapon.SoundPitch = 36;			
		}
		else
		{
			Weapon.SoundPitch = byte(Max(36, int(float(Weapon.SoundPitch) - (float(8) * dt))));
		}
	}
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	Weapon.SoundPitch = byte(Min(120, int(Weapon.SoundPitch) + 8));
	//return;	
}

simulated function SwitchCannonMode(byte newmode)
{
	// End:0x20
	if(int(newmode) == 0)
	{
		bSplashDamage = false;
		bRecommendSplashDamage = false;		
	}
	else
	{
		// End:0x40
		if(int(newmode) == 1)
		{
			bSplashDamage = true;
			bRecommendSplashDamage = true;			
		}
		else
		{
			// End:0x5E
			if(Weapon.bBerserk)
			{
				FireRate *= 0.7500000;
			}
		}
	}
	// End:0x9D
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		FireRate /= Level.GRI.WeaponBerserk;
	}
	load = float(AmmoPerFire);
	//return;	
}

defaultproperties
{
	PowerFireSound=Sound'BWBP_SKC_Sounds.A73E.A73E-Power'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	FlashBone="Muzzle"
	MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
	FlashScaleFactor=0.2000000
	AimedFireAnim="FireSight"
	FireRecoil=128.0000000
	FireChaos=0.2500000
	XInaccuracy=64.0000000
	YInaccuracy=64.0000000
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.1700000
	AmmoClass=Class'BallisticProV55.Ammo_Cells'
	AmmoPerFire=2
	ShakeRotMag=(X=32.0000000,Y=10.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.7500000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.7500000
	ProjectileClass=Class'BWBP_SWC_Pro.SkrithStaffProjectile'
	WarnTargetPct=0.2000000
}
