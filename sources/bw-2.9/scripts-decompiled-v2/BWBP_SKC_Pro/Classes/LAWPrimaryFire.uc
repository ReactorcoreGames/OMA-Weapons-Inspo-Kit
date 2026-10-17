class LAWPrimaryFire extends BallisticProProjectileFire;

var() Class<Actor> HatchSmokeClass;
var Actor HatchSmoke;
var() Sound SteamSound;
var float RailPower;

simulated function Vector GetFireSpread()
{
	local float fX;
	local Rotator R;

	// End:0x1C
	if(BW.bScopeView)
	{
		return super.GetFireSpread();		
	}
	else
	{
		fX = FRand();
		R.Yaw = int((float(1024) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
		R.Pitch = int((float(1024) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
		return Vector(R);
	}
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireRecoil=3072.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-FireLoud',Volume=4.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bSplashDamage=true
	bRecommendSplashDamage=true
	FireEndAnim="None"
	FireRate=0.9500000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_LAW'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=16.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.5000000
	ShakeOffsetMag=(X=-50.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1600.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=5.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.LAWRocket'
	BotRefireRate=0.3000000
	WarnTargetPct=1.0000000
}
