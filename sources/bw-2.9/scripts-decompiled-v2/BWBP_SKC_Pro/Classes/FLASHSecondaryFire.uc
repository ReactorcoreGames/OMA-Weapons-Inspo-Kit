class FLASHSecondaryFire extends BallisticProProjectileFire;

var() Class<Actor> HatchSmokeClass;
var Actor HatchSmoke;
var() Sound SteamSound;

function SpawnProjectile(Vector Start, Rotator Dir)
{
	local int i, j;
	local Rotator R;

	j = Min(4, BW.MagAmmo);
	ConsumedLoad += (j - 1);
	i = 0;
	J0x2E:

	// End:0xB2 [Loop If]
	if(i < j)
	{
		R.Roll = (65536 / j) * i;
		proj = Spawn(ProjectileClass,,, Start, Rotator((Vector(rot(400, 400, 0)) >> R) >> Dir));
		proj.Instigator = Instigator;
		i++;
		// [Loop Continue]
		goto J0x2E;
	}
	//return;	
}

simulated event Timer()
{
	super(BallisticFire).Timer();
	// End:0x70
	if((int(Weapon.Role) == int(ROLE_Authority)) && ConsumedLoad > 0)
	{
		// End:0x55
		if(BW != none)
		{
			BW.ConsumeMagAmmo(ThisModeNum, float(ConsumedLoad));			
		}
		else
		{
			Weapon.ConsumeAmmo(ThisModeNum, float(ConsumedLoad));
		}
	}
	ConsumedLoad = 0;
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireRecoil=1024.0000000
	XInaccuracy=400.0000000
	YInaccuracy=400.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.M202-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bSplashDamage=true
	bRecommendSplashDamage=true
	FireAnim="Fireall"
	FireEndAnim="None"
	FireRate=3.5000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_FLASH'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=16.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.5000000
	ShakeOffsetMag=(X=-50.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1600.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=5.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.FLASHProjectile'
	BotRefireRate=0.3000000
	WarnTargetPct=1.0000000
}
