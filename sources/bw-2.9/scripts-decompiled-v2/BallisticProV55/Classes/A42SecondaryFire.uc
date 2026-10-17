class A42SecondaryFire extends BallisticProInstantFire;

var() float ChargeTime;
var() Sound ChargeSound;

simulated function PlayPreFire()
{
	Weapon.AmbientSound = ChargeSound;
	Weapon.SoundPitch = 56;
	// End:0x5E
	if(!BW.bScopeView)
	{
		BW.SafeLoopAnim('SecIdle', 1.0000000, TweenTime,, "IDLE");
	}
	//return;	
}

function float ResolveDamageFactors(Actor Other, Vector TraceStart, Vector HitLocation, int PenetrateCount, int WallCount, int WallPenForce, Vector WaterHitLocation)
{
	KickForce = int(FMin(HoldTime, ChargeTime) / ChargeTime) * InstantEffectParams(Params.FireEffectParams[0]).MomentumTransfer;
	return super(BallisticInstantFire).ResolveDamageFactors(Other, TraceStart, HitLocation, PenetrateCount, WallCount, WallPenForce, WaterHitLocation) * (FMin(HoldTime, ChargeTime) / ChargeTime);
	//return;	
}

simulated event ModeDoFire()
{
	local float F;

	F = (FMin(HoldTime, ChargeTime) / ChargeTime) * float(AmmoPerFire);
	load = float(Max(1, int(F)));
	Weapon.AmbientSound = none;
	A42SkrithPistol(Weapon).NextAmmoTickTime = Level.TimeSeconds + float(2);
	super.ModeDoFire();
	//return;	
}

defaultproperties
{
	ChargeTime=1.0000000
	ChargeSound=Sound'BW_Core_WeaponSound.A42.A42-Charge'
	bFireOnRelease=true
	AmmoClass=Class'BallisticProV55.Ammo_A42Charge'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-160.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
}
