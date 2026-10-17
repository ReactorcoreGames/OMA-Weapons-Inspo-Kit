class A800MinigunPrimaryFire extends BallisticProProjectileFire;

var Rotator OldLookDir;
var Rotator TurnVelocity;
var float LastFireTime;
var float MuzzleBTime;
var float MuzzleCTime;
var float OldFireRate;
var A800SkrithMinigun Minigun;
var float LagTime;
var int ProjectileCount;
var bool bStarted;
var float NextTVUpdateTime;

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	// End:0x6B
	if(!bStarted)
	{
		bStarted = true;
		BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
		BW.PlaySound(Minigun.BarrelStartSound, 0, 0.5000000,, 32.0000000, 1.0000000, true);
	}
	//return;	
}

function ServerPlayFiring()
{
	super(BallisticFire).ServerPlayFiring();
	// End:0x6E
	if(!bStarted)
	{
		bStarted = true;
		BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
		BW.PlayOwnedSound(Minigun.BarrelStartSound, 0, 0.5000000,, 32.0000000, 1.0000000, true);
	}
	//return;	
}

function StopFiring()
{
	super(BallisticFire).StopFiring();
	bStarted = false;
	// End:0x52
	if(BW.MagAmmo == 0)
	{
		BW.PlayOwnedSound(Minigun.NoAmmoSound, 0, 1.0000000,, 32.0000000, 1.0000000, true);
	}
	//return;	
}

simulated event PostBeginPlay()
{
	OldLookDir = BW.GetPlayerAim();
	super(WeaponFire).PostBeginPlay();
	//return;	
}

event ModeTick(float dt)
{
	local float DesiredFireRate;

	OldFireRate = FireRate;
	// End:0x2F
	if(Minigun.BarrelSpeed <= float(0))
	{
		FireRate = 1.0000000;		
	}
	else
	{
		DesiredFireRate = FMin(1.0000000 / ((float(60) * (float(1) + (0.2500000 * float(int(BW.bBerserk))))) * Minigun.BarrelSpeed), 1.0000000);
		FireRate = DesiredFireRate;
	}
	NextFireTime += (FireRate - OldFireRate);
	super(BallisticFire).ModeTick(dt);
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=1.0000000,Y=5.0000000,Z=-5.0000000)
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FlashScaleFactor=0.1000000
	AimedFireAnim="SightFire"
	FireRecoil=120.0000000
	FirePushbackForce=15.0000000
	FireChaos=0.1000000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.2400000,OutVal=1.0000000),(InVal=0.3500000,OutVal=1.5000000),(InVal=0.6600000,OutVal=2.2500000),(InVal=1.0000000,OutVal=3.5000000)))
	XInaccuracy=16.0000000
	YInaccuracy=16.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.A73E.A73E-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireRate=0.1750000
	AmmoClass=Class'BallisticProV55.Ammo_Cells'
	ShakeRotMag=(X=64.0000000,Y=64.0000000,Z=128.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	ProjectileClass=Class'BWBP_SWC_Pro.A73NewProjectile'
	WarnTargetPct=0.2000000
}
